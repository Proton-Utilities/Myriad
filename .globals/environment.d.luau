--#region Helper types
type GenericFunction<A..., R...> = (A...) -> R...
type GenericScript = LocalScript | ModuleScript
type AnyFunction = <A..., R...>(A...) -> R...
type AnyTable = { [any]: any }
type AnyArray = { any }
type BuiltIn = nil | string | number | boolean
type BooleanNumber = number 
type Metamethods =
    "__index" |
    "__newindex" |
    "__call" |
    "__concat" |
    "__unm" |
    "__add" |
    "__sub" |
    "__mul" |
    "__div" |
    "__idiv" |
    "__mod" |
    "__pow" |
    "__tostring" |
    "__metatable" |
    "__eq" |
    "__lt" |
    "__le" |
    "__mode" |
    "__len" |
    "__iter" |
    "__namecall"
--#endregion
    
--#region Cache
type cache = {
    iscached: (object: Instance) -> boolean,
    invalidate: (object: Instance) -> (),
    replace: (object: Instance, newObject: Instance) -> (),
}
declare cache: cache
--#endregion

--#region Closures
declare function checkcaller(): boolean
declare function clonefunction<A..., R...>(function_to_clone: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function getfunctionhash(function_to_hash: AnyFunction): string
declare function hookfunction<A..., R...>(function_to_hook: GenericFunction<A..., R...>, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function hookmetamethod<A..., R...>(object: AnyTable | Instance, metamethod_name: string, hook: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function iscclosure(func: AnyFunction): boolean
declare function isexecutorclosure(func: AnyFunction): boolean
declare function islclosure(func: AnyFunction): boolean
declare function newcclosure<A..., R...>(function_to_wrap: GenericFunction<A..., R...>): GenericFunction<A..., R...>
declare function restorefunction(functionToRestore: AnyFunction): ()

declare function getnamecallmethod(): string
--#endregion

--#region Console
declare function rconsoleclear(): ()
declare function rconsolecreate(): ()
declare function rconsoledestroy(): ()
declare function rconsoleinput(): string
declare function rconsoleprint(text: string): ()
declare function rconsolesettitle(title: string): ()
--#endregion

--#region Cryptography
type CryptCipherMode = "CBC" | "ECB" | "CTR" | "CFB" | "OFB" | "GCM"
type CryptHashAlgorithm = "shA" | "sha384" | "sha512" | "md5" | "sha256" | "sha3-224" | "sha3-256" | "sha3-512"
type crypt = {
    base64decode: (data: string) -> string,
    base64encode: (data: string) -> string,

    encrypt: (data: string, key: string, iv: string?, mode: CryptCipherMode?) -> (string, string),
    decrypt: (data: string, key: string, iv: string, mode: CryptCipherMode) -> string,
    generatebytes: (size: number) -> string,
    generatekey: () -> string,
    hash: (data: string, algorithm: CryptHashAlgorithm) -> string,
}
declare crypt: crypt
--#endregion

--#region Debug
type DebugInfo = {
    source: string,
    short_src: string,
    func: AnyFunction,
    what: "Lua" | "C",
    currentline: number,
    name: string,
    nups: number,
    numparams: number,
    is_vararg: BooleanNumber,
}
type debug = {
    getconstant: (func_or_level: AnyFunction | number, index: number) -> BuiltIn,
    getconstants: (func_or_level: AnyFunction | number) -> { BuiltIn },
    getproto: ((func_or_level: AnyFunction | number, index: number, activated: true) -> { AnyFunction }) &
              ((func_or_level: AnyFunction | number, index: number, activated: false?) -> AnyFunction),
    getprotos: (func_or_level: AnyFunction | number) -> { AnyFunction },
    getstack: (level: number, index: number?) -> any | AnyArray,
    getupvalue: (func_or_level: AnyFunction | number, index: number) -> any,
    getupvalues: (func_or_level: AnyFunction | number) -> AnyArray?,
    setconstant: (func_or_level: AnyFunction | number, index: number, value: BuiltIn) -> (),
    setstack: (level: number, index: number, value: any) -> (),
    setupvalue: (func_or_level: AnyFunction | number, index: number, value: any) -> (),

    getinfo: (func_or_level: AnyFunction | number) -> DebugInfo,
}
declare debug: debug & typeof(debug)
--#endregion

--#region Drawing
declare class DrawingObject
    Visible: boolean
    ZIndex: number
    Transparency: number
    Color: Color3
    __OBJECT_EXISTS: boolean
    function Remove(self)
    function Destroy(self)
end
declare class DrawingLine extends DrawingObject
    Thickness: number
    From: Vector2
    To: Vector2
end
declare class DrawingText extends DrawingObject
    Text: string
    Size: number
    Center: boolean
    Outline: boolean
    OutlineColor: Color3
    Position: Vector2
    TextBounds: Vector2 
end
declare class DrawingImage extends DrawingObject
    Data: string 
    Size: Vector2
    Position: Vector2
    Rounding: number
end
declare class DrawingCircle extends DrawingObject
    Thickness: number
    NumSides: number
    Radius: number
    Filled: boolean
    Position: Vector2
end
declare class DrawingSquare extends DrawingObject
    Thickness: number
    Size: Vector2
    Position: Vector2
    Filled: boolean
end
declare class DrawingQuad extends DrawingObject
    Thickness: number
    PointA: Vector2
    PointB: Vector2
    PointC: Vector2
    PointD: Vector2
    Filled: boolean
end
declare class DrawingTriangle extends DrawingObject
    Thickness: number
    PointA: Vector2
    PointB: Vector2
    PointC: Vector2
    Filled: boolean
end
type DrawingFonts = {
    UI: number,
    System: number,
    Plex: number,
    Monospace: number,
}
export type DrawingNewTypes = "Line" | "Text" | "Image" | "Circle" | "Square" | "Quad" | "Triangle"
export type DrawingNewFunction =
    (("Line") -> DrawingLine)
    & (("Text") -> DrawingText)
    & (("Image") -> DrawingImage)
    & (("Circle") -> DrawingCircle)
    & (("Square") -> DrawingSquare)
    & (("Quad") -> DrawingQuad)
    & (("Triangle") -> DrawingTriangle)
export type Drawing = {
    Fonts: DrawingFonts,
    new: DrawingNewFunction
}
declare Drawing: Drawing
declare function cleardrawcache(): ()
declare function getrenderproperty(drawing: DrawingObject, property: string): any
declare function isrenderobj(object: any): boolean
declare function setrenderproperty(drawing: DrawingObject, property: string, value: any): ()
--#endregion

--#region Environment
type FunctionFilterOptions = {
    Name: string?,
    IgnoreExecutor: boolean?,
    Hash: string?,
    Constants: AnyArray?,
    Upvalues: AnyArray?,
}
type TableFilterOptions = {
    Keys: AnyArray?,
    Values: AnyArray?,
    KeyValuePairs: AnyTable?,
    Metatable: any?,
}
declare getgc:
    ((include_tables: false?) -> AnyArray)
    & ((include_tables: true) -> { any | AnyArray })
declare function getgenv(): AnyTable
declare function getreg(): AnyArray
declare function getrenv(): AnyTable
declare filtergc: (
    (filter_type: "table", filter_options: TableFilterOptions, return_one: true) -> AnyTable?
) & (
    (filter_type: "table", filter_options: TableFilterOptions, return_one: false?) -> { AnyTable }
) & (
    (filter_type: "function", filter_options: FunctionFilterOptions, return_one: true) -> AnyFunction?
) & (
    (filter_type: "function", filter_options: FunctionFilterOptions, return_one: false?) -> { AnyFunction }
)
--#endregion

--#region Filesystem
declare function appendfile(path: string, contents: string): ()
declare function delfile(path: string): ()
declare function delfolder(path: string): ()
declare function getcustomasset(path: string): string
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function listfiles(path: string): { string }
declare function loadfile(path: string): (AnyFunction?, string?)
declare function makefolder(path: string): ()
declare function readfile(path: string): string
declare function writefile(path: string, data: string): ()

declare function dofile(path: string): ()
--#endregion

--#region Input
declare function isrbxactive(): boolean
declare function mouse1click(): ()
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse2click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(pixels: number): ()
declare function keypress(key: string): ()
declare function keyrelease(key: string): ()
--#endregion

--#region Instances
declare function cloneref<T>(object: T & Instance): T
declare function compareinstances(object1: Instance, object2: Instance): boolean
declare function fireclickdetector(object: ClickDetector, distance: number?, event: ("MouseClick" | "MouseHoverEnter" | "MouseHoverLeave" | "RightMouseClick")?): ()
declare function fireproximityprompt(object: ProximityPrompt): ()
declare function firetouchinterest(part: BasePart, part2: BasePart, toggle: boolean | BooleanNumber): ()
declare function getcallbackvalue(object: Instance, property: string): AnyFunction
declare function gethui(): Instance
declare function getinstances(): { Instance }
declare function getnilinstances(): { Instance }
declare function isscriptable(object: Instance, property: string): boolean
declare function setrbxclipboard(data: string): boolean
--#endregion

--#region Metatable
declare function getrawmetatable(object: any): AnyTable?
declare function isreadonly(table: AnyTable): boolean
declare function setrawmetatable<T>(object: T, metatable: AnyTable): T
declare function setreadonly(table: AnyTable, state: boolean): ()
--#endregion

--#region Miscellaneous
type Request = {
    Url: string,
    Method: string,
    Body: string?,
    Headers: { [string]: any }?,
    Cookies: { [string]: any }?,
}
type Response = {
    Body: string,
    StatusCode: number,
    StatusMessage: string,
    Success: boolean,
    Headers: { [string]: any },
}
type ExtraDataModel = {
    HttpGet: (self: typeof(game), url: string, synchronous: boolean?, httpRequestType: typeof(Enum.HttpRequestType)?, doNotAllowDiabolicalMode: boolean?) -> string,
}
declare function identifyexecutor(): (string, string)
declare function request(options: Request): Response

declare function setclipboard(text: string): ()
declare function toclipboard(text: string): ()
declare function setfpscap(fps: number): ()
declare function getfpscap(): number
declare game: typeof(game) & ExtraDataModel
--#endregion

--#region Reflection
declare function gethiddenproperty(instance: Instance, property_name: string): (any, boolean)
declare function getthreadidentity(): number
declare function sethiddenproperty(instance: Instance, property_name: string, property_value: any): boolean
declare function setscriptable(object: Instance, property: string, state: boolean): boolean?
declare function setthreadidentity(id: number): ()
--#endregion

--#region Scripts
declare function getcallingscript(): GenericScript?
declare function getloadedmodules(excludeCore: boolean?): { ModuleScript }
declare function getrunningscripts(): { GenericScript }
declare function getscriptbytecode(script: GenericScript): string?
declare function getscriptclosure(script: GenericScript): AnyFunction?
declare function getscripthash(script: GenericScript): string?
declare function getscripts(): { GenericScript }
declare function getsenv(script: GenericScript): { [any]: any }
declare function loadstring<A...>(src: string, chunkname: string?): (((A...) -> any) | nil, string?)
--#endregion

--#region Signals
declare class Connection
    Enabled: boolean
    ForeignState: boolean
    LuaConnection: boolean
    Function: AnyFunction?
    Thread: thread?
    function Fire(self, ...: any): ()
    function Defer(self, ...: any): ()
    function Disconnect(self): ()
    function Disable(self): ()
    function Enable(self): ()
end
declare function firesignal<T...>(signal: RBXScriptSignal<T...>, ...: T...): ()
declare function getconnections<T...>(signal: RBXScriptSignal<T...>): { Connection }
declare function lz4compress(data: string): string
declare function lz4decompress(data: string, size: number): string
declare function messagebox(text: string, caption: string, flags: number): number
declare function queue_on_teleport(code: string): ()
declare function replicatesignal<T...>(signal: RBXScriptSignal<T...>, ...: T...): ()
--#endregion

--#region WebSocket
type WebSocketConnection = {
    OnMessage: RBXScriptSignal<string>,
    OnClose: RBXScriptSignal<()>,
    Send: (self: WebSocketConnection, message: string) -> (),
    Close: (self: WebSocketConnection) -> (),
}
type WebSocket = {
    connect: (url: string) -> WebSocketConnection
}
declare WebSocket: WebSocket
--#endregion