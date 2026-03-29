--!strict
--!optimize 2
--!native
--!nolint

--[[
    Flow Signal - Advanced Signal library with SoA, Sync and Async callbacks
	
	@author super_sonic
	@license Apache 2.0
	@version 1.0.0
	
	@changelog:
		- Initial release
--]]

--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- Types
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
type Callback = (...any) -> ()
type  TaskFn      = (...any) -> ()

export type Connection = {
	Disconnect: (Self: Connection) -> (),
	Connected: boolean,

	_id: number,
	_index: number,
}

export type Signal<T...> =  {
	_id            : number,
	_max           : number,
	_current       : number,
	Connect        : (Self: Signal<T...>, Fn: (T...) -> ()) -> Connection?,
	ConnectAsync   : (Self: Signal<T...>, Fn: (T...) -> ()) -> Connection?,
	Once           : (Self: Signal<T...>, Fn: (T...) -> ()) -> Connection?,
	OnceAsync      : (Self: Signal<T...>, Fn: (T...) -> ()) -> Connection?,
	DisconnectAll  : (Self: Signal<T...>) -> (),
	Destroy        : (Self: Signal<T...>) -> (),
	Wait           : (Self: Signal<T...>, Timeout: number?) -> (),
	Fire           : (Self: Signal<T...>, T...) -> (),
}

local NULL = table.freeze({})
type  Nullable<T> = typeof(NULL) | T

--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- Worker system
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
local Workers     = table.create(48, NULL) :: {Nullable<thread>}
local WorkerFn    = function() end
local WorkerCount = 0
local Yield       = coroutine.yield
local Running     = coroutine.running
local Create      = coroutine.create
local Resume      = coroutine.resume

local RunTask = function(fn: TaskFn, wrk: thread, ...: any)
	fn(...)
	WorkerCount += 1
	Workers[WorkerCount] = wrk
end

local WorkerLoop = function()
	while (1) do
		RunTask(Yield())
	end
end

local GetWorker = function(): thread
	if WorkerCount == 0 then
		local wrk = Create(WorkerLoop)
		Resume(wrk, WorkerFn, wrk)
		return wrk
	else
		local worker = Workers[WorkerCount] :: thread
		Workers[WorkerCount] = NULL
		WorkerCount -= 1
		return worker
	end
end

--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- Table {Pool}
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

local TablePool: {Nullable<{}>} = table.create(32, NULL)
local TableCount = 0

local Borrow = function(): {}
	if TableCount == 0 then
		return table.create(4)
	else
		local tbl = TablePool[TableCount]
		TablePool[TableCount] = NULL
		TableCount -= 1
		table.clear(tbl)
		return tbl
	end
end

local Free = function(tbl: {})
	TableCount += 1
	TablePool[TableCount] = tbl
end


type Arr<T> = Nullable<{T}>

local CallbackSync  = 0
local CallbackAsync = 1
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- SoA Arrays
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
local Callbacks   : Arr<Arr<Callback>>             = table.create(32, NULL)
local CallbackType: Arr<Arr<number>>               = table.create(32, NULL)
local CallbackLen : Arr<number>                    = table.create(32, NULL :: any)
local Connections : Arr<Arr<Nullable<Connection>>> = table.create(32, NULL)
local Prev        : Arr<Arr<Nullable<number>>>     = table.create(32, NULL)
local Next        : Arr<Arr<Nullable<number>>>     = table.create(32, NULL)
local Heads       : Arr<{number}>                  = table.create(32, NULL :: any)
local Tails       : Arr<{number}>                  = table.create(32, NULL :: any)
local Alive       : Arr<{boolean}>                 = table.create(32, NULL :: any)
local Index       = 0

-- Free system
local FreeConnections    : Arr<Arr<number>> = table.create(32, NULL :: any) 
local FreeSignals        : Arr<{number}>    = table.create(32, NULL :: any) 
local LastFreeConnections: Arr<{number}>    = table.create(32, 0 :: any)   
local LastFreeSignal = 0 

--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- API
--#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

--[[
	@brief Disconnects connection object.
	
	@param Self: Connection
	@returns void
--]]
local Disconnect = function(Self: Connection)
	if not Self.Connected then return end
	if Alive[Self._id] ~= true then return end

	Self.Connected = false

	local id = Self._id
	local index = Self._index

	local prev = Prev[id][index]
	local next = Next[id][index]

	if prev ~= NULL then
		Next[id][prev] = next
	end
	if next ~= NULL then
		Prev[id][next] = prev
	end
	
	if Heads[id] == index then
		Heads[id] = next
	end

	if Tails[id] == index then
		Tails[id] = prev
	end
	
	local freeList = FreeConnections[id] :: {number}
	LastFreeConnections[id] += 1  :: any
	freeList[LastFreeConnections[id] :: number] = index :: any
	
	Connections[id][index] = NULL	
	Callbacks[id][index] = NULL
	CallbackType[id][index] = NULL
	Prev[id][index] = NULL
	Next[id][index] = NULL

	Free(Self)
end

--[[
	@brief Internal function to create connections.
	
	@param id: number
	@param index: number
	
	@returns Connection
--]]
local MakeConnection = function(id: number, index: number): Connection
	local Conn = Borrow() :: Connection

	Conn._id = id
	Conn._index = index
	Conn.Connected = true
	Conn.Disconnect = Disconnect
	return Conn	
end

--[[
	@brief Connects a function to a signal.
	
	@param Self: Signal<T...>
	@param Fn: (T...) -> ()
	@returns Connection?
--]]
local Connect = function<T...>(Self: Signal<T...>, Fn: (T...) -> ()): Connection?
	if Alive[Self._id] ~= true then return nil end

	local id = Self._id
	local slot

	if FreeConnections[id] ~= NULL and LastFreeConnections[id] > 0 :: any then
		slot = FreeConnections[id][LastFreeConnections[id]]
		FreeConnections[id][LastFreeConnections[id]] = NULL
		LastFreeConnections[id] -= 1:: any
	else
		CallbackLen[id] += 1 :: any
		slot = CallbackLen[id]
	end

	Callbacks[id][slot] = Fn
	CallbackType[id][slot] = CallbackSync
	local conn = MakeConnection(id, slot)
	Connections[id][slot] = conn

	if Heads[id] == NULL then
		Heads[id] = slot
		Tails[id] = slot
		Prev[id][slot] = NULL
		Next[id][slot] = NULL
	else
		local tail = Tails[id]
		Next[id][tail] = slot
		Prev[id][slot] = tail
		Next[id][slot] = NULL
		Tails[id] = slot
	end

	return conn
end

--[[
	@brief Async variant of Connect.
	
	@param Self: Signal<T...>
	@param Fn: (T...) -> ()
	
	@returns Connection?
--]]
local ConnectAsync = function<T...>(Self: Signal<T...>, Fn: (T...) -> ()): Connection?
	if Alive[Self._id] ~= true then return nil end

	local id = Self._id
	local slot

	if FreeConnections[id] ~= NULL and LastFreeConnections[id] > 0 :: any then
		slot = FreeConnections[id][LastFreeConnections[id]]
		FreeConnections[id][LastFreeConnections[id]] = NULL
		LastFreeConnections[id] -= 1:: any
	else
		CallbackLen[id] += 1 :: any
		slot = CallbackLen[id]
	end

	Callbacks[id][slot] = Fn
	local conn = MakeConnection(id, slot)
	CallbackType[id][slot] = CallbackAsync
	Connections[id][slot] = conn

	if Heads[id] == NULL then
		Heads[id] = slot
		Tails[id] = slot
		Prev[id][slot] = NULL
		Next[id][slot] = NULL
	else
		local tail = Tails[id]
		Next[id][tail] = slot
		Prev[id][slot] = tail
		Next[id][slot] = NULL
		Tails[id] = slot
	end

	return conn
end

--[[
	@brief Connects a function to a signal and Disconnects after first fire.
	
	@param Self: Signal<T...>
	@param Fn: (T...) -> ()
	
	@returns Connection?
--]]
local Once = function<T...>(Self: Signal<T...>, Fn: (T...) -> ()): Connection?
	if Alive[Self._id] ~= true then return nil end
	
	local conn: Connection
	conn = Connect(Self, function(...: T...)
		Disconnect(conn)
		Fn(...)
	end) :: Connection
	
	return conn
end

--[[
	@brief Async variant of Once.
	
	@param Self: Signal<T...>
	@param Fn: (T...) -> ()
	
	@returns Connection?
--]]
local OnceAsync = function<T...>(Self: Signal<T...>, Fn: (T...) -> ()): Connection?
	if Alive[Self._id] ~= true then return nil end
	
	local conn: Connection
	conn = ConnectAsync(Self, function(...: T...)
		Disconnect(conn)
		Fn(...)
	end) :: Connection
	
	return conn
end

--[[
	@brief Wait for signal to fire.
	
	@param Self: Signal<T...>
	@param Timeout: number?
	
	@reutrns void
--]]
local Wait = function<T...>(Self: Signal<T...>, Timeout: number?)
	if Alive[Self._id] ~= true then return end
	
	Timeout = Timeout or 5
	
	local Thread = Running()
	
	local TimeoutThread: thread
	local Conn: Connection
	
	Conn = Connect(Self, function(...) -- I DONT use Once cuz i get Double free lol
		if TimeoutThread then
			task.cancel(TimeoutThread)
		end
		Resume(Thread, ...)
		Disconnect(Conn)	
	end) :: Connection
	
	TimeoutThread = task.delay(Timeout, function()
		warn(`[FlowSignal] Wait timed out {Timeout}s`)
		Disconnect(Conn)
		Resume(Thread)
	end)	
	
	return Yield()
end

--[[
	@brief Destroys signal.
	
	@param Self: Signal<T...>
	@returns void
]]
local Destroy = function<T...>(Self: Signal<T...>)
	local id = Self._id
	if Alive[id] ~= true then return end

	Self:DisconnectAll()

	Alive[id] = false
	Callbacks[id] = NULL
	CallbackType[id] = NULL
	Prev[id] = NULL
	Next[id] = NULL
	Heads[id] = NULL
	Tails[id] = NULL
	Connections[id] = NULL
	CallbackLen[id] = 0

	FreeConnections[id] = NULL
	LastFreeConnections[id] = 0
	

	LastFreeSignal += 1
	FreeSignals[LastFreeSignal] = id
end

--[[
	@brief Disconnects all connections from signal.
	
	@param Self: Signal<T...>
	
	@returns void
]]
local DisconnectAll = function<T...>(Self: Signal<T...>)
	if Alive[Self._id] ~= true then return end

	local id = Self._id
	local node = Heads[id]

	while node ~= NULL do
		local nextNode = Next[id][node] 

		local prev = Prev[id][node]
		local next = Next[id][node]

		if prev ~= NULL then
			Next[id][prev] = next
		end
		if next ~= NULL then
			Prev[id][next] = prev
		end

		if FreeConnections[id] == NULL then
			FreeConnections[id] = {}
		end
		LastFreeConnections[id] += 1 :: any
		FreeConnections[id][LastFreeConnections[id]] = node

		Callbacks[id][node] = NULL
		CallbackType[id][node] = NULL
		Prev[id][node] = NULL
		Next[id][node] = NULL
		
		local ConnObject: Connection = Connections[id][node]
		if ConnObject ~= NULL then
			ConnObject.Connected = false
		end

		node = nextNode
	end

	Heads[id] = NULL
	Tails[id] = NULL
end

--[[
	@brief Fires and calls all callbacks.
	
	@param Self: Signal<T...>
	@param ...: T...
	
	@returns void
--]]
local Fire = function<T...>(Self: Signal<T...>, ...: T...)
	if Alive[Self._id] ~= true then return end
	if Self._current >= Self._max then error(`[FlowSignal] Stack overflow {Self._current}/{Self._max}`) end
	Self._current += 1
	
	local Id = Self._id
	local Callbacks = Callbacks[Id]
	local CallbackType = CallbackType[Id]
	local Next = Next[Id]
	
	local node: Nullable<number> = Heads[Id]
	while node ~= NULL do
		local NextNode = Next[node]
		local Callback: (T...) -> ()  = Callbacks[node]
		local CallbackType           = CallbackType[node]
		
		if Callback ~= NULL :: any then -- if branching for 99% cases, CPU happy
			if CallbackType == CallbackSync then
				Callback(...)
				node = NextNode
				continue
			else
				local Thread = GetWorker()
				local Ok, Stack = Resume(Thread, Callback, Thread, ...)
				if Ok then
					node = NextNode
					continue
				else
					warn(`[FlowSignal] error in callback, stack: {Stack}`)
					node = NextNode
					continue
				end	
			end
		else
			node = NextNode
			continue
		end
	end
	
	
	Self._current -= 1
end

-- Creating pre-warmed threads for Async callbacks.
local index = 1
while index <= 48 do
	local wrk = Create(WorkerLoop)
	Resume(wrk, WorkerFn, wrk)
	WorkerCount += 1
	Workers[WorkerCount] = wrk
	index += 1
end

--[[
	@brief Creates a new signal.
	
	@param limit: number?
	
	@return Signal<T...>
--]]
return function<T...>(limit: number?): Signal<T...>
	limit = limit or 10
	
	local Id: number
	
	if LastFreeSignal > 0 then
		Id = FreeSignals[LastFreeSignal] :: number
		FreeSignals[LastFreeSignal] = NULL
		LastFreeSignal -= 1
	else
		Index += 1 
		Id = Index
	end
	
	Alive[Id]        = true
	CallbackLen[Id]  = 0
	CallbackType[Id] = table.create(4, NULL)
	Connections[Id]  = table.create(4, NULL)
	Prev[Id]         = table.create(4, NULL)
	Next[Id]         = table.create(4, NULL)
	Callbacks[Id]    = table.create(4, NULL)
	FreeConnections[Id] = table.create(4)
	
	LastFreeConnections[Id] = 0
	Heads[Id]               = NULL
	Tails[Id]               = NULL
	
	local Self: Signal<T...> = {
		_id = Id,
		_max = limit,
		_current = 0,
		DisconnectAll = DisconnectAll,
		Once = Once,
		OnceAsync = OnceAsync,
		Wait = Wait,
		Fire = Fire,
		Destroy = Destroy,
		Connect = Connect,
		ConnectAsync = ConnectAsync
	}
	return Self	
end