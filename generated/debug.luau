--!nolint
--!nocheck

--[[
    @repository https://github.com/Proton-Utilities/Myriad

    @author Proton-Utilities
    @name Myriad

    This file was automatically @generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-01-01T03:45:06.534537100+00:00",
    cfg = "Debug",
    vers = "v0.0.0"
}


type Streamer__DARKLUA_TYPE_a = {
	Offset: number,
	Source: string,
	Length: number,
	IsFinished: boolean,
	LastUnreadBytes: number,

	read: (Streamer__DARKLUA_TYPE_a, len: number?, shiftOffset: boolean?) -> string,
	seek: (Streamer__DARKLUA_TYPE_a, len: number) -> (),
	append: (Streamer__DARKLUA_TYPE_a, newData: string) -> (),
	toEnd: (Streamer__DARKLUA_TYPE_a) -> ()
}

type BlockData__DARKLUA_TYPE_b = {
	[number]: {
		Literal: string,
		LiteralLength: number,
		MatchOffset: number?,
		MatchLength: number?
	}
}
type bytes__DARKLUA_TYPE_c = {number} -- Type instance of a valid bytes object
local __DIST={cache={}::any}do do local function __modImpl()--!nocheck
--!nolint


local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d='8.0',cloneref or
function(b)return b end,{Theme={Syntax={Text=Color3.fromRGB(204,204,204),
Background=Color3.fromRGB(20,20,20),Selection=Color3.fromRGB(255,255,255),
SelectionBack=Color3.fromRGB(102,161,255),Operator=Color3.fromRGB(204,204,204),
Number=Color3.fromRGB(255,198,0),String=Color3.fromRGB(172,240,148),Comment=
Color3.fromRGB(102,102,102),Keyword=Color3.fromRGB(248,109,124),BuiltIn=Color3.
fromRGB(132,214,247),LocalMethod=Color3.fromRGB(253,251,172),LocalProperty=
Color3.fromRGB(97,161,241),Nil=Color3.fromRGB(255,198,0),Bool=Color3.fromRGB(255
,198,0),Function=Color3.fromRGB(248,109,124),Local=Color3.fromRGB(248,109,124),
Self=Color3.fromRGB(248,109,124),FunctionName=Color3.fromRGB(253,251,172),
Bracket=Color3.fromRGB(204,204,204)}}}local e,f=setmetatable({},{__index=
function(e,f)local g=game:GetService(f)return c(g)end}),{StartAndEnd={Enum.
UserInputType.MouseButton1,Enum.UserInputType.Touch},Movement={Enum.
UserInputType.MouseMovement,Enum.UserInputType.Touch}}local g,h,i,j=e.Players,e.
UserInputService,e.RunService,e.TweenService local k=c(g.LocalPlayer)local l,m,n
,o=c(k:GetMouse()),function(l,m)for n,o in next,m do l[n]=o end return l end,
function(l,m)local n=l.UserInputType return table.find(f[m],n)end,function(...)
return c(Instance.new(...))end local p,q,r=function(p,q)local r=o(p)for s,t in
next,q do r[s]=t end return r end,{},o'Frame'q.CheckMouseInGui=function(s)if s==
nil then return false end local t,u=s.AbsolutePosition,s.AbsoluteSize return l.X
>=t.X and l.X<t.X+u.X and l.Y>=t.Y and l.Y<t.Y+u.Y end q.Signal=(function()local
s,t={},function(s)local t=table.find(s.Signal.Connections,s)if t then table.
remove(s.Signal.Connections,t)end end s.Connect=function(u,v)if type(v)~=
'function'then error'Attempt to connect a non-function'end local w={Signal=u,
Func=v,Disconnect=t}u.Connections[#u.Connections+1]=w return w end s.Fire=
function(u,...)for v,w in next,u.Connections do xpcall(coroutine.wrap(w.Func),
function(x)warn(x..'\n'..debug.traceback())end,...)end end local u={__index=s,
__tostring=function(u)return'Signal: '..tostring(#u.Connections)..' Connections'
end}local v=function()local v={}v.Connections={}return setmetatable(v,u)end
return{new=v}end)()q.CreateArrow=function(s,t,u)local v,w=t,p('Frame',{
BackgroundTransparency=1,Name='Arrow',Size=UDim2.new(0,s,0,s)})if u=='up'then
for x=1,t do p('Frame',{BackgroundColor3=Color3.new(0.8627450980392157,
0.8627450980392157,0.8627450980392157),BorderSizePixel=0,Position=UDim2.new(0,
math.floor(s/2)-(x-1),0,math.floor(s/2)+x-math.floor(v/2)-1),Size=UDim2.new(0,x+
(x-1),0,1),Parent=w})end return w elseif u=='down'then for x=1,t do p('Frame',{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,
0.8627450980392157),BorderSizePixel=0,Position=UDim2.new(0,math.floor(s/2)-(x-1)
,0,math.floor(s/2)-x+math.floor(v/2)+1),Size=UDim2.new(0,x+(x-1),0,1),Parent=w})
end return w elseif u=='left'then for x=1,t do p('Frame',{BackgroundColor3=
Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,Position=UDim2.new(0,math.floor(s/2)+x-math.floor(v/2)-1,0,
math.floor(s/2)-(x-1)),Size=UDim2.new(0,1,0,x+(x-1)),Parent=w})end return w
elseif u=='right'then for x=1,t do p('Frame',{BackgroundColor3=Color3.new(
0.8627450980392157,0.8627450980392157,0.8627450980392157),BorderSizePixel=0,
Position=UDim2.new(0,math.floor(s/2)-x+math.floor(v/2)+1,0,math.floor(s/2)-(x-1)
),Size=UDim2.new(0,1,0,x+(x-1)),Parent=w})end return w end error''end q.FastWait
=(function(s)task.wait(s)end)q.ScrollBar=(function()local s,t,u,v={},q.
CheckMouseInGui,q.CreateArrow,function(s)local t,u,v,w=s.TotalSpace,s.
VisibleSpace,s.GuiElems.ScrollThumb,s.GuiElems.ScrollThumbFrame if not(s:
CanScrollUp()or s:CanScrollDown())then v.Visible=false else v.Visible=true end
if s.Horizontal then v.Size=UDim2.new(u/t,0,1,0)if v.AbsoluteSize.X<10 then v.
Size=UDim2.new(0,10,1,0)end local x,y=w.AbsoluteSize.X,v.AbsoluteSize.X v.
Position=UDim2.new(s:GetScrollPercent()*(x-y)/x,0,0,0)else v.Size=UDim2.new(1,0,
u/t,0)if v.AbsoluteSize.Y<10 then v.Size=UDim2.new(1,0,0,10)end local x,y=w.
AbsoluteSize.Y,v.AbsoluteSize.Y v.Position=UDim2.new(0,0,s:GetScrollPercent()*(x
-y)/x,0)end end local w=function(w)local x,y,z=(p('Frame',{Style=0,Active=true,
AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,
0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.
new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,
ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-10,0,0),Rotation=0,
Selectable=false,Size=UDim2.new(0,10,1,0),SizeConstraint=0,Visible=true,ZIndex=1
,Name='ScrollBar'}))if w.Horizontal then x.Size=UDim2.new(1,0,0,10)y=p(
'ImageButton',{Parent=x,Name='Left',Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false})u(10,4,'left')
.Parent=y z=p('ImageButton',{Parent=x,Name='Right',Position=UDim2.new(1,-10,0,0)
,Size=UDim2.new(0,10,0,10),BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false})u(10,4,'right').Parent=z else x.Size=UDim2.new(0,10,1,0)y
=p('ImageButton',{Parent=x,Name='Up',Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false})u(10,4,'up').
Parent=y z=p('ImageButton',{Parent=x,Name='Down',Position=UDim2.new(0,0,1,-10),
Size=UDim2.new(0,10,0,10),BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false})u(10,4,'down').Parent=z end local A=p('Frame',{
BackgroundTransparency=1,Parent=x})if w.Horizontal then A.Position=UDim2.new(0,
10,0,0)A.Size=UDim2.new(1,-20,1,0)else A.Position=UDim2.new(0,0,0,10)A.Size=
UDim2.new(1,0,1,-20)end local B,C,D,E,F=p('Frame',{BackgroundColor3=Color3.new(
0.47058823529411764,0.47058823529411764,0.47058823529411764),BorderSizePixel=0,
Parent=A}),p('Frame',{BackgroundTransparency=1,Name='Markers',Size=UDim2.new(1,0
,1,0),Parent=A}),false,false,false y.InputBegan:Connect(function(G)if n(G,
'Movement')and not D and w:CanScrollUp()then y.BackgroundTransparency=0.8 end if
not n(G,'StartAndEnd')or not w:CanScrollUp()then return end D=true y.
BackgroundTransparency=0.5 if w:CanScrollUp()then w:ScrollUp()w.Scrolled:Fire()
end local H,I=(tick())I=h.InputEnded:Connect(function(J)if not n(J,'StartAndEnd'
)then return end I:Disconnect()if t(y)and w:CanScrollUp()then y.
BackgroundTransparency=0.8 else y.BackgroundTransparency=1 end D=false end)while
D do if tick()-H>=0.3 and w:CanScrollUp()then w:ScrollUp()w.Scrolled:Fire()end
wait()end end)y.InputEnded:Connect(function(G)if n(G,'Movement')and not D then y
.BackgroundTransparency=1 end end)z.InputBegan:Connect(function(G)if n(G,
'Movement')and not D and w:CanScrollDown()then z.BackgroundTransparency=0.8 end
if not n(G,'StartAndEnd')or not w:CanScrollDown()then return end D=true z.
BackgroundTransparency=0.5 if w:CanScrollDown()then w:ScrollDown()w.Scrolled:
Fire()end local H,I=(tick())I=h.InputEnded:Connect(function(J)if not n(J,
'StartAndEnd')then return end I:Disconnect()if t(z)and w:CanScrollDown()then z.
BackgroundTransparency=0.8 else z.BackgroundTransparency=1 end D=false end)while
D do if tick()-H>=0.3 and w:CanScrollDown()then w:ScrollDown()w.Scrolled:Fire()
end wait()end end)z.InputEnded:Connect(function(G)if n(G,'Movement')and not D
then z.BackgroundTransparency=1 end end)B.InputBegan:Connect(function(G)if n(G,
'Movement')and not E then B.BackgroundTransparency=0.2 B.BackgroundColor3=w.
ThumbSelectColor end if not n(G,'StartAndEnd')then return end local H,I=w.
Horizontal and'X'or'Y'D=false F=false E=true B.BackgroundTransparency=0 local J,
K,L=(l[H]-B.AbsolutePosition[H])K=h.InputEnded:Connect(function(M)if not n(M,
'StartAndEnd')then return end K:Disconnect()if L then L:Disconnect()end if t(B)
then B.BackgroundTransparency=0.2 else B.BackgroundTransparency=0 B.
BackgroundColor3=w.ThumbColor end E=false end)w:Update()L=h.InputChanged:
Connect(function(M)if n(M,'Movement')and E and K.Connected then local N,O=A.
AbsoluteSize[H]-B.AbsoluteSize[H],l[H]-A.AbsolutePosition[H]-J if O>N then O=N
elseif O<0 then O=0 end if I~=O then I=O w:ScrollTo(math.floor(0.5+O/N*(w.
TotalSpace-w.VisibleSpace)))end wait()end end)end)B.InputEnded:Connect(function(
G)if n(G,'Movement')and not E then B.BackgroundTransparency=0 B.BackgroundColor3
=w.ThumbColor end end)A.InputBegan:Connect(function(G)if not n(G,'StartAndEnd')
or t(B)then return end local H,I=w.Horizontal and'X'or'Y',0 if l[H]>=B.
AbsolutePosition[H]+B.AbsoluteSize[H]then I=1 end local J=function()local J=w.
VisibleSpace-1 if I==0 and l[H]<B.AbsolutePosition[H]then w:ScrollTo(w.Index-J)
elseif I==1 and l[H]>=B.AbsolutePosition[H]+B.AbsoluteSize[H]then w:ScrollTo(w.
Index+J)end end E=false F=true J()local K,L=(tick())L=h.InputEnded:Connect(
function(M)if not n(M,'StartAndEnd')then return end L:Disconnect()F=false end)
while F do if tick()-K>=0.3 and t(A)then J()end wait()end end)x.
MouseWheelForward:Connect(function()w:ScrollTo(w.Index-w.WheelIncrement)end)x.
MouseWheelBackward:Connect(function()w:ScrollTo(w.Index+w.WheelIncrement)end)w.
GuiElems.ScrollThumb=B w.GuiElems.ScrollThumbFrame=A w.GuiElems.Button1=y w.
GuiElems.Button2=z w.GuiElems.MarkerFrame=C return x end s.Update=function(x,y)
local z,A,B,C=x.TotalSpace,x.VisibleSpace,x.GuiElems.Button1,x.GuiElems.Button2
x.Index=math.clamp(x.Index,0,math.max(0,z-A))if x.LastTotalSpace~=x.TotalSpace
then x.LastTotalSpace=x.TotalSpace x:UpdateMarkers()end if x:CanScrollUp()then
for D,E in pairs(B.Arrow:GetChildren())do E.BackgroundTransparency=0 end else B.
BackgroundTransparency=1 for D,E in pairs(B.Arrow:GetChildren())do E.
BackgroundTransparency=0.5 end end if x:CanScrollDown()then for D,E in pairs(C.
Arrow:GetChildren())do E.BackgroundTransparency=0 end else C.
BackgroundTransparency=1 for D,E in pairs(C.Arrow:GetChildren())do E.
BackgroundTransparency=0.5 end end v(x)end s.UpdateMarkers=function(x)local y=x.
GuiElems.MarkerFrame y:ClearAllChildren()for z,A in pairs(x.Markers)do if z<x.
TotalSpace then p('Frame',{BackgroundTransparency=0,BackgroundColor3=A,
BorderSizePixel=0,Position=x.Horizontal and UDim2.new(z/x.TotalSpace,0,1,-6)or
UDim2.new(1,-6,z/x.TotalSpace,0),Size=x.Horizontal and UDim2.new(0,1,0,6)or
UDim2.new(0,6,0,1),Name='Marker'..tostring(z),Parent=y})end end end s.AddMarker=
function(x,y,z)x.Markers[y]=z or Color3.new(0,0,0)end s.ScrollTo=function(x,y,z)
x.Index=y x:Update()if not z then x.Scrolled:Fire()end end s.ScrollUp=function(x
)x.Index=x.Index-x.Increment x:Update()end s.ScrollDown=function(x)x.Index=x.
Index+x.Increment x:Update()end s.CanScrollUp=function(x)return x.Index>0 end s.
CanScrollDown=function(x)return x.Index+x.VisibleSpace<x.TotalSpace end s.
GetScrollPercent=function(x)return x.Index/(x.TotalSpace-x.VisibleSpace)end s.
SetScrollPercent=function(x,y)x.Index=math.floor(y*(x.TotalSpace-x.VisibleSpace)
)x:Update()end s.Texture=function(x,y)x.ThumbColor=y.ThumbColor or Color3.new(0,
0,0)x.ThumbSelectColor=y.ThumbSelectColor or Color3.new(0,0,0)x.GuiElems.
ScrollThumb.BackgroundColor3=y.ThumbColor or Color3.new(0,0,0)x.Gui.
BackgroundColor3=y.FrameColor or Color3.new(0,0,0)x.GuiElems.Button1.
BackgroundColor3=y.ButtonColor or Color3.new(0,0,0)x.GuiElems.Button2.
BackgroundColor3=y.ButtonColor or Color3.new(0,0,0)for z,A in pairs(x.GuiElems.
Button1.Arrow:GetChildren())do A.BackgroundColor3=y.ArrowColor or Color3.new(0,0
,0)end for z,A in pairs(x.GuiElems.Button2.Arrow:GetChildren())do A.
BackgroundColor3=y.ArrowColor or Color3.new(0,0,0)end end s.SetScrollFrame=
function(x,y)if x.ScrollUpEvent then x.ScrollUpEvent:Disconnect()x.ScrollUpEvent
=nil end if x.ScrollDownEvent then x.ScrollDownEvent:Disconnect()x.
ScrollDownEvent=nil end x.ScrollUpEvent=y.MouseWheelForward:Connect(function()x:
ScrollTo(x.Index-x.WheelIncrement)end)x.ScrollDownEvent=y.MouseWheelBackward:
Connect(function()x:ScrollTo(x.Index+x.WheelIncrement)end)end local x={}x.
__index=s local y=function(y)local z=setmetatable({Index=0,VisibleSpace=0,
TotalSpace=0,Increment=1,WheelIncrement=1,Markers={},GuiElems={},Horizontal=y,
LastTotalSpace=0,Scrolled=q.Signal.new()},x)z.Gui=w(z)z:Texture{ThumbColor=
Color3.fromRGB(60,60,60),ThumbSelectColor=Color3.fromRGB(75,75,75),ArrowColor=
Color3.new(1,1,1),FrameColor=Color3.fromRGB(40,40,40),ButtonColor=Color3.
fromRGB(75,75,75)}return z end return{new=y}end)()q.CodeFrame=(function()local s
,t,u,v,w,x,y,z={},{[1]='String',[2]='String',[3]='String',[4]='Comment',[5]=
'Operator',[6]='Number',[7]='Keyword',[8]='BuiltIn',[9]='LocalMethod',[10]=
'LocalProperty',[11]='Nil',[12]='Bool',[13]='Function',[14]='Local',[15]='Self',
[16]='FunctionName',[17]='Bracket'},{['nil']=11,['true']=12,['false']=12,[
'function']=13,['local']=14,self=15},{['and']=true,['break']=true,['do']=true,[
'else']=true,['elseif']=true,['end']=true,['false']=true,['for']=true,[
'function']=true,['if']=true,['in']=true,['local']=true,['nil']=true,['not']=
true,['or']=true,['repeat']=true,['return']=true,['then']=true,['true']=true,[
'until']=true,['while']=true,plugin=true},{delay=true,elapsedTime=true,require=
true,spawn=true,tick=true,time=true,typeof=true,UserSettings=true,wait=true,warn
=true,game=true,shared=true,script=true,workspace=true,assert=true,
collectgarbage=true,error=true,getfenv=true,getmetatable=true,ipairs=true,
loadstring=true,newproxy=true,next=true,pairs=true,pcall=true,print=true,
rawequal=true,rawget=true,rawset=true,select=true,setfenv=true,setmetatable=true
,tonumber=true,tostring=true,type=true,unpack=true,xpcall=true,_G=true,_VERSION=
true,coroutine=true,debug=true,math=true,os=true,string=true,table=true,bit32=
true,utf8=true,Axes=true,BrickColor=true,CFrame=true,Color3=true,ColorSequence=
true,ColorSequenceKeypoint=true,DockWidgetPluginGuiInfo=true,Enum=true,Faces=
true,Instance=true,NumberRange=true,NumberSequence=true,NumberSequenceKeypoint=
true,PathWaypoint=true,PhysicalProperties=true,Random=true,Ray=true,Rect=true,
Region3=true,Region3int16=true,TweenInfo=true,UDim=true,UDim2=true,Vector2=true,
Vector2int16=true,Vector3=true,Vector3int16=true,Drawing=true,syn=true,crypt=
true,cache=true,bit=true,readfile=true,writefile=true,isfile=true,appendfile=
true,listfiles=true,loadfile=true,isfolder=true,makefolder=true,delfolder=true,
delfile=true,setclipboard=true,setfflag=true,getnamecallmethod=true,isluau=true,
setnonreplicatedproperty=true,getspecialinfo=true,saveinstance=true,
rconsoleprint=true,rconsoleinfo=true,rconsolewarn=true,rconsoleerr=true,
rconsoleclear=true,rconsolename=true,rconsoleinput=true,rconsoleinputasync=true,
printconsole=true,checkcaller=true,islclosure=true,iscclosure=true,dumpstring=
true,decompile=true,hookfunction=true,newcclosure=true,isrbxactive=true,keypress
=true,keyrelease=true,mouse1click=true,mouse1press=true,mouse1release=true,
mouse2click=true,mouse2press=true,mouse2release=true,mousescroll=true,
mousemoveabs=true,mousemoverel=true,getrawmetatable=true,setrawmetatable=true,
setreadonly=true,isreadonly=true,getsenv=true,getcallingscript=true,getgenv=true
,getrenv=true,getreg=true,getgc=true,getinstances=true,getnilinstances=true,
getscripts=true,getloadedmodules=true,getconnections=true,firesignal=true,
fireclickdetector=true,firetouchinterest=true,fireproximityprompt=true},false,{[
"'"]='&apos;',['"']='&quot;',['<']='&lt;',['>']='&gt;',['&']='&amp;'},'\u{cd}'
local A,B,C,D,E,F=(' %s%s '):format(z,z),{[('[^%s] %s'):format(z,z)]=0,[(' %s%s'
):format(z,z)]=-1,[('%s%s '):format(z,z)]=2,[('%s [^%s]'):format(z,z)]=1},{},
function()local A,B,C=getfenv(),type,tostring for D,E in next,w do local F=A[D]
if B(F)=='table'then local G={}for H,I in next,F do G[H]=true end w[D]=G end end
local D,E={},Enum:GetEnums()for F=1,#E do D[C(E[F])]=true end w.Enum=D x=true
end,function(A)local B=A.GuiElems.EditBox B.Focused:Connect(function()A:
ConnectEditBoxEvent()A.Editing=true end)B.FocusLost:Connect(function()A:
DisconnectEditBoxEvent()A.Editing=false end)B:GetPropertyChangedSignal'Text':
Connect(function()local C=B.Text if#C==0 or A.EditBoxCopying then return end C=C
:gsub('\t','    ')B.Text=''A:AppendText(C)end)end,function(A)local B,C=A.
GuiElems.LinesFrame,A.Lines B.InputBegan:Connect(function(D)if n(D,'StartAndEnd'
)then local E,F,G,H=math.ceil(A.FontSize/2),A.FontSize,l.X-B.AbsolutePosition.X,
l.Y-B.AbsolutePosition.Y local I,J,K,L,M,N,O=math.round(G/E)+A.ViewX,math.floor(
H/F)+A.ViewY,0,0 J=math.min(#C-1,J)local P=C[J+1]or''I=math.min(#P,I+A:
TabAdjust(I,J))A.SelectionRange={{-1,-1},{-1,-1}}A:MoveCursor(I,J)A.FloatCursorX
=I local Q=function()local Q,R=l.X-B.AbsolutePosition.X,l.Y-B.AbsolutePosition.Y
local S,T=math.max(0,math.round(Q/E)+A.ViewX),math.max(0,math.floor(R/F)+A.ViewY
)T=math.min(#C-1,T)local U=C[T+1]or''S=math.min(#U,S+A:TabAdjust(S,T))if T<J or(
T==J and S<I)then A.SelectionRange={{S,T},{I,J}}else A.SelectionRange={{I,J},{S,
T}}end A:MoveCursor(S,T)A.FloatCursorX=S A:Refresh()end M=h.InputEnded:Connect(
function(R)if n(R,'StartAndEnd')then M:Disconnect()N:Disconnect()O:Disconnect()A
:SetCopyableSelection()end end)N=h.InputChanged:Connect(function(R)if n(R,
'Movement')then local S,T,U,V=l.Y-B.AbsolutePosition.Y,l.Y-B.AbsolutePosition.Y-
B.AbsoluteSize.Y,l.X-B.AbsolutePosition.X,l.X-B.AbsolutePosition.X-B.
AbsoluteSize.X K=0 L=0 if T>0 then K=math.floor(T*0.05)+1 elseif S<0 then K=math
.ceil(S*0.05)-1 end if V>0 then L=math.floor(V*0.05)+1 elseif U<0 then L=math.
ceil(U*0.05)-1 end Q()end end)O=i.RenderStepped:Connect(function()if K~=0 or L~=
0 then A:ScrollDelta(L,K)Q()end end)A:Refresh()end end)end function s.
MakeEditorFrame(G)local H=o'TextButton'H.BackgroundTransparency=1 H.
TextTransparency=1 H.BackgroundColor3=Color3.fromRGB(40,40,40)H.BorderSizePixel=
0 H.Size=UDim2.fromOffset(100,100)H.Visible=true local I,J={},o'Frame'J.Name=
'Lines'J.BackgroundTransparency=1 J.Size=UDim2.new(1,0,1,0)J.ClipsDescendants=
true J.Parent=H local K=o'TextLabel'K.Name='LineNumbers'K.BackgroundTransparency
=1 K.FontFace=G.FontFace K.TextXAlignment=Enum.TextXAlignment.Right K.
TextYAlignment=Enum.TextYAlignment.Top K.ClipsDescendants=true K.RichText=true K
.Parent=H r.Name='Cursor'r.BackgroundColor3=Color3.fromRGB(220,220,220)r.
BorderSizePixel=0 r.Parent=H local L=o'TextBox'L.Name='EditBox'L.MultiLine=true
L.Visible=false L.Parent=H L.TextSize=G.FontSize L.FontFace=G.FontFace C.Invis=j
:Create(r,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
BackgroundTransparency=1})C.Vis=j:Create(r,TweenInfo.new(0,Enum.EasingStyle.
Quart,Enum.EasingDirection.Out),{BackgroundTransparency=0})local M=o'Frame'M.
BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945)M
.BorderSizePixel=0 M.Name='ScrollCorner'M.Position=UDim2.new(1,-10,1,-10)M.Size=
UDim2.new(0,10,0,10)M.Visible=false I.ScrollCorner=M I.LinesFrame=J I.
LineNumbersLabel=K I.Cursor=r I.EditBox=L I.ScrollCorner.Parent=H J.InputBegan:
Connect(function(N)if n(N,'StartAndEnd')then G:SetEditing(true,N)end end)G.Frame
=H G.Gui=H G.GuiElems=I E(G)F(G)return H end s.GetSelectionText=function(G)if
not G:IsValidRange()then return''end local H=G.SelectionRange local I,J,K,L=H[1]
[1],H[1][2],H[2][1],H[2][2]local M,N=L-J,G.Lines if not N[J+1]or not N[L+1]then
return''end if M==0 then return G:ConvertText(N[J+1]:sub(I+1,K),false)end local
O,P=N[J+1]:sub(I+1),N[L+1]:sub(1,K)local Q=O..'\n'for R=J+1,L-1 do Q=Q..N[R+1]..
'\n'end Q=Q..P return G:ConvertText(Q,false)end s.SetCopyableSelection=function(
G)local H,I=G:GetSelectionText(),G.GuiElems.EditBox G.EditBoxCopying=true I.Text
=H I.SelectionStart=1 I.CursorPosition=#I.Text+1 G.EditBoxCopying=false end s.
ConnectEditBoxEvent=function(G)if G.EditBoxEvent then G.EditBoxEvent:Disconnect(
)end G.EditBoxEvent=h.InputBegan:Connect(function(H)if H.UserInputType~=Enum.
UserInputType.Keyboard then return end local I,J,K=Enum.KeyCode,H.KeyCode,
function(I,J)local K,L K=h.InputEnded:Connect(function(M)if M.KeyCode~=I then
return end K:Disconnect()L=true end)J()q.FastWait(0.5)while not L do J()q.
FastWait(0.03)end end if J==I.Down then K(I.Down,function()G.CursorX=G.
FloatCursorX G.CursorY=G.CursorY+1 G:UpdateCursor()G:JumpToCursor()end)elseif J
==I.Up then K(I.Up,function()G.CursorX=G.FloatCursorX G.CursorY=G.CursorY-1 G:
UpdateCursor()G:JumpToCursor()end)elseif J==I.Left then K(I.Left,function()local
L=G.Lines[G.CursorY+1]or''G.CursorX=G.CursorX-1-(L:sub(G.CursorX-3,G.CursorX)==A
and 3 or 0)if G.CursorX<0 then G.CursorY=G.CursorY-1 local M=G.Lines[G.CursorY+1
]or''G.CursorX=#M end G.FloatCursorX=G.CursorX G:UpdateCursor()G:JumpToCursor()
end)elseif J==I.Right then K(I.Right,function()local L=G.Lines[G.CursorY+1]or''G
.CursorX=G.CursorX+1+(L:sub(G.CursorX+1,G.CursorX+4)==A and 3 or 0)if G.CursorX>
#L then G.CursorY=G.CursorY+1 G.CursorX=0 end G.FloatCursorX=G.CursorX G:
UpdateCursor()G:JumpToCursor()end)elseif J==I.Backspace then K(I.Backspace,
function()local L,M if G:IsValidRange()then L=G.SelectionRange[1]M=G.
SelectionRange[2]else M={G.CursorX,G.CursorY}end if not L then local N=G.Lines[G
.CursorY+1]or''G.CursorX=G.CursorX-1-(N:sub(G.CursorX-3,G.CursorX)==A and 3 or 0
)if G.CursorX<0 then G.CursorY=G.CursorY-1 local O=G.Lines[G.CursorY+1]or''G.
CursorX=#O end G.FloatCursorX=G.CursorX G:UpdateCursor()L=L or{G.CursorX,G.
CursorY}end G:DeleteRange({L,M},false,true)G:ResetSelection(true)G:JumpToCursor(
)end)elseif J==I.Delete then K(I.Delete,function()local L,M if G:IsValidRange()
then L=G.SelectionRange[1]M=G.SelectionRange[2]else L={G.CursorX,G.CursorY}end
if not M then local N=G.Lines[G.CursorY+1]or''local O,P=G.CursorX+1+(N:sub(G.
CursorX+1,G.CursorX+4)==A and 3 or 0),G.CursorY if O>#N then P=P+1 O=0 end G:
UpdateCursor()M=M or{O,P}end G:DeleteRange({L,M},false,true)G:ResetSelection(
true)G:JumpToCursor()end)elseif h:IsKeyDown(Enum.KeyCode.LeftControl)then if J==
I.A then G.SelectionRange={{0,5},{#G.Lines[#G.Lines],#G.Lines-1}}G:
SetCopyableSelection()G:Refresh()end end end)end s.DisconnectEditBoxEvent=
function(G)if G.EditBoxEvent then G.EditBoxEvent:Disconnect()r.
BackgroundTransparency=1 s.CursorAnim(G,false)end end s.ResetSelection=function(
G,H)G.SelectionRange={{-1,-1},{-1,-1}}if not H then G:Refresh()end end s.
IsValidRange=function(G,H)local I=H or G.SelectionRange local J,K,L,M=I[1][1],I[
1][2],I[2][1],I[2][2]if J==-1 or(J==L and K==M)then return false end return true
end s.DeleteRange=function(G,H,I,J)H=H or G.SelectionRange if not G:
IsValidRange(H)then return end local K,L,M,N,O=G.Lines,H[1][1],H[1][2],H[2][1],H
[2][2]local P=O-M if not K[M+1]or not K[O+1]then return end local Q,R=K[M+1]:
sub(1,L),K[O+1]:sub(N+1)K[M+1]=Q..R local S=table.remove for T=1,P do S(K,M+2)
end if H==G.SelectionRange then G.SelectionRange={{-1,-1},{-1,-1}}end if J then
G.CursorX=L G.CursorY=M G:UpdateCursor()end if not I then G:ProcessTextChange()
end end s.AppendText=function(G,H)G:DeleteRange(nil,true,true)local I,J,K=G.
Lines,G.CursorX,G.CursorY local L=I[K+1]local M,N=L:sub(1,J),L:sub(J+1)H=H:gsub(
'\r\n','\n')H=G:ConvertText(H,true)local O,P=H:split'\n',table.insert for Q=1,#O
do local R=K+Q if Q>1 then P(I,R,'')end local S,T,U=O[Q],(Q==1 and M or''),(Q==#
O and N or'')I[R]=T..S..U end if#O>1 then J=0 end G:ProcessTextChange()G.CursorX
=J+#O[#O]G.CursorY=K+#O-1 G:UpdateCursor()end s.ScrollDelta=function(G,H,I)G.
ScrollV:ScrollTo(G.ScrollV.Index+I)G.ScrollH:ScrollTo(G.ScrollH.Index+H)end s.
TabAdjust=function(G,H,I)local J=G.Lines local K=J[I+1]H=H+1 if K then local L,M
,N=K:sub(H-1,H-1),K:sub(H,H),K:sub(H+1,H+1)local O=(#L>0 and L or' ')..(#M>0 and
M or' ')..(#N>0 and N or' ')for P,Q in pairs(B)do if O:find(P)then return Q end
end end return 0 end s.SetEditing=function(G,H,I)if I then G:UpdateCursor(I)end
if H then if G.Editable then G.GuiElems.EditBox.Text=''G.GuiElems.EditBox:
CaptureFocus()end else G.GuiElems.EditBox:ReleaseFocus()end end s.CursorAnim=
function(G,H)local I,J=G.GuiElems.Cursor,tick()G.LastAnimTime=J if not H then
return end C.Invis:Cancel()C.Vis:Cancel()I.BackgroundTransparency=0 coroutine.
wrap(function()while G.Editable do q.FastWait(0.5)if G.LastAnimTime~=J then
return end C.Invis:Play()q.FastWait(0.5)if G.LastAnimTime~=J then return end C.
Vis:Play()end end)()end s.MoveCursor=function(G,H,I)G.CursorX=H G.CursorY=I G:
UpdateCursor()G:JumpToCursor()end s.JumpToCursor=function(G)G:Refresh()end s.
UpdateCursor=function(G,H)local I,J=G.GuiElems.LinesFrame,G.GuiElems.Cursor
local K,L=math.max(0,I.AbsoluteSize.X),math.max(0,I.AbsoluteSize.Y)local M,N,O,P
,Q,R=math.ceil(L/G.FontSize),math.ceil(K/math.ceil(G.FontSize/2)),G.ViewX,G.
ViewY,tostring(#G.Lines),math.ceil(G.FontSize/2)local S=#Q*R+4*R if H then local
T=G.GuiElems.LinesFrame local U,V,W,X,Y,Z=T.AbsolutePosition.X,T.
AbsolutePosition.Y,H.Position.X,H.Position.Y,math.ceil(G.FontSize/2),G.FontSize
G.CursorX=G.ViewX+math.round((W-U)/Y)G.CursorY=G.ViewY+math.floor((X-V)/Z)end
local T,U=G.CursorX,G.CursorY local V=G.Lines[U+1]or''if T>#V then T=#V elseif T
<0 then T=0 end if U>=#G.Lines then U=math.max(0,#G.Lines-1)elseif U<0 then U=0
end T=T+G:TabAdjust(T,U)G.CursorX=T G.CursorY=U local W=(T>=O)and(U>=P)and(T<=O+
N)and(U<=P+M)if W then local X,Y=(T-O),(U-P)J.Position=UDim2.new(0,S+X*math.
ceil(G.FontSize/2)-1,0,Y*G.FontSize)J.Size=UDim2.new(0,1,0,G.FontSize+2)J.
Visible=true G:CursorAnim(true)else J.Visible=false end end s.MapNewLines=
function(G)local H,I,J,K,L={},1,G.Text,string.find,1 local M=K(J,'\n',L,true)
while M do H[I]=M I=I+1 L=M+1 M=K(J,'\n',L,true)end G.NewLines=H end s.
PreHighlight=function(G)local H=G.Text:gsub('\\\\','  ')local I,J,K,L,M,N=#H,{},
{},{},string.find,string.sub G.ColoredLines={}local O=function(O,P,Q,R)local S,T
=#J+1,1 local U,V,W=M(O,P,T,R)while U do J[S]=U K[U]=Q if W then L[U]=W end S=S+
1 T=V+1 U,V,W=M(O,P,T,R)end end O(H,'"',1,true)O(H,"'",2,true)O(H,'%[(=*)%[',3)
O(H,'--',4,true)table.sort(J)local P,Q,R,S,T=G.NewLines,0,0,0,{}for U=1,#J do
local V=J[U]if V<=S then continue end local W,X=V,K[V]if X==1 then W=M(H,'"',V+1
,true)while W and N(H,W-1,W-1)=='\\'do W=M(H,'"',W+1,true)end if not W then W=I
end elseif X==2 then W=M(H,"'",V+1,true)while W and N(H,W-1,W-1)=='\\'do W=M(H,
"'",W+1,true)end if not W then W=I end elseif X==3 then _,W=M(H,']'..L[V]..']',V
+1,true)if not W then W=I end elseif X==4 then local Y=K[V+2]if Y==3 then _,W=M(
H,']'..L[V+2]..']',V+1,true)if not W then W=I end else W=M(H,'\n',V+1,true)or I
end end while V>R do Q=Q+1 R=P[Q]or I+1 end while true do local Y=T[Q]if not Y
then Y={}T[Q]=Y end Y[V]={X,W}if W>R then Q=Q+1 R=P[Q]or I+1 else break end end
S=W end G.PreHighlights=T end s.HighlightLine=function(G,H)local I=G.
ColoredLines[H]if I then return I end local J,K,L,M,N,O,P,Q,R,S,T,U,V=string.sub
,string.find,string.match,{},G.PreHighlights[H]or{},G.Lines[H]or'',0,0,false,0,G
.NewLines[H-1]or 0,{}for W,X in next,N do local Y=W-T if Y<1 then Q=X[1]P=X[2]-T
else U[Y]={X[1],X[2]-T}end end for W=1,#O do if W<=P then M[W]=Q continue end
local X=U[W]if X then Q=X[1]P=X[2]M[W]=Q R=false V=nil S=0 else local Y=J(O,W,W)
if K(Y,'[%a_]')then local Z=L(O,'[%a%d_]+',W)local _=(v[Z]and 7)or(w[Z]and 8)P=W
+#Z-1 if _~=7 then if R then local aa=V and w[V]_=(aa and type(aa)=='table'and
aa[Z]and 8)or 10 end if _~=8 then local aa,ab,ac=K(O,'^%s*([%({"\'])',P+1)if aa
then _=(S>0 and ac=='('and 16)or 9 S=0 end end else _=u[Z]or _ S=(Z=='function'
and 1 or 0)end V=Z R=false if S>0 then S=1 end if _ then Q=_ M[W]=Q else Q=nil
end elseif K(Y,'%p')then local aa=(Y=='.')local ab=aa and K(J(O,W+1,W+1),'%d')M[
W]=(ab and 6 or 5)if not ab then local ac=aa and L(O,'%.%.?%.?',W)if ac and#ac>1
then Q=5 P=W+#ac-1 R=false V=nil S=0 else if aa then if R then V=nil else R=true
end else R=false V=nil end S=((aa or Y==':')and S==1 and 2)or 0 end end elseif
K(Y,'%d')then local aa,ab=K(O,'%x+',W)local ac=J(O,ab,ab+1)if(ac=='e+'or ac==
'e-')and K(J(O,ab+2,ab+2),'%d')then ab=ab+1 end Q=6 P=ab M[W]=6 R=false V=nil S=
0 else M[W]=Q local aa,ab=K(O,'%s+',W)if ab then P=ab end end end end G.
ColoredLines[H]=M return M end s.Refresh=function(aa)local ab=aa.Frame.Lines
local ac,G=math.max(0,ab.AbsoluteSize.X),math.max(0,ab.AbsoluteSize.Y)local H,I,
J,K,L,M,N=math.ceil(G/aa.FontSize),math.ceil(ac/math.ceil(aa.FontSize/2)),string
.gsub,string.sub,aa.ViewX,aa.ViewY,''for O=1,H do local P=aa.LineFrames[O]if not
P then P=o'Frame'P.Name='Line'P.Position=UDim2.new(0,0,0,(O-1)*aa.FontSize)P.
Size=UDim2.new(1,0,0,aa.FontSize)P.BorderSizePixel=0 P.BackgroundTransparency=1
local Q=o'Frame'Q.Name='SelectionHighlight'Q.BorderSizePixel=0 Q.
BackgroundColor3=d.Theme.Syntax.SelectionBack Q.Parent=P Q.
BackgroundTransparency=0.7 local R=o'TextLabel'R.Name='Label'R.
BackgroundTransparency=1 R.FontFace=aa.FontFace R.TextSize=aa.FontSize R.Size=
UDim2.new(1,0,0,aa.FontSize)R.RichText=true R.TextXAlignment=Enum.TextXAlignment
.Left R.TextColor3=aa.Colors.Text R.ZIndex=2 R.Parent=P P.Parent=ab aa.
LineFrames[O]=P end local Q=M+O local R,S,T,U,V=aa.Lines[Q]or'','',aa:
HighlightLine(Q),L+1,aa.RichTemplates local W,X,Y=V.Text,V.Selection,T[U]local Z
,_=V[t[Y] ]or W,aa.SelectionRange local ad,ae,af=_[1],_[2],Q-1 if af>=ad[2]and
af<=ae[2]then local ag,ah=math.ceil(aa.FontSize/2),(af==ad[2]and ad[1]or 0)-L
local ai=(af==ae[2]and ae[1]-ah-L or I+L)P.SelectionHighlight.Position=UDim2.
new(0,ah*ag,0,0)P.SelectionHighlight.Size=UDim2.new(0,ai*ag,1,0)P.
SelectionHighlight.Visible=true else P.SelectionHighlight.Visible=false end for
ag=2,I do local ah=L+ag local ai=T[ah]if ai~=Y then local aj=V[t[ai] ]or W if aj
~=Z then local ak=J(K(R,U,ah-1),'[\'"<>&]',y)S=S..(Z~=W and(Z..ak..'</font>')or
ak)U=ah Z=aj end Y=ai end end local ag=J(K(R,U,L+I),'[\'"<>&]',y)if#ag>0 then S=
S..(Z~=W and(Z..ag..'</font>')or ag)end if aa.Lines[Q]then N=N..(Q-1==aa.CursorY
and('<b>'..Q..'</b>\n')or Q..'\n')end P.Label.Text=S end for ad=H+1,#aa.
LineFrames do aa.LineFrames[ad]:Destroy()aa.LineFrames[ad]=nil end aa.Frame.
LineNumbers.Text=N aa:UpdateCursor()end s.UpdateView=function(aa)local ab,ac=
tostring(#aa.Lines),math.ceil(aa.FontSize/2)local ad,ae=#ab*ac+4*ac,aa.Frame.
Lines local af,ag=ae.AbsoluteSize.X,ae.AbsoluteSize.Y local ah,ai,aj,ak=math.
ceil(ag/aa.FontSize),aa.MaxTextCols*ac,aa.ScrollV,aa.ScrollH aj.VisibleSpace=ah
aj.TotalSpace=#aa.Lines+1 ak.VisibleSpace=math.ceil(af/ac)ak.TotalSpace=aa.
MaxTextCols+1 aj.Gui.Visible=#aa.Lines+1>ah ak.Gui.Visible=ai>af local G=aa.
FrameOffsets aa.FrameOffsets=Vector2.new(aj.Gui.Visible and-10 or 0,ak.Gui.
Visible and-10 or 0)if G~=aa.FrameOffsets then aa:UpdateView()else aj:ScrollTo(
aa.ViewY,true)ak:ScrollTo(aa.ViewX,true)if aj.Gui.Visible and ak.Gui.Visible
then aj.Gui.Size=UDim2.new(0,10,1,-10)ak.Gui.Size=UDim2.new(1,-10,0,10)aa.
GuiElems.ScrollCorner.Visible=true else aj.Gui.Size=UDim2.new(0,10,1,0)ak.Gui.
Size=UDim2.new(1,0,0,10)aa.GuiElems.ScrollCorner.Visible=false end aa.ViewY=aj.
Index aa.ViewX=ak.Index aa.Frame.Lines.Position=UDim2.new(0,ad,0,0)aa.Frame.
Lines.Size=UDim2.new(1,-ad+G.X,1,G.Y)aa.Frame.LineNumbers.Position=UDim2.new(0,
ac,0,0)aa.Frame.LineNumbers.Size=UDim2.new(0,#ab*ac,1,G.Y)aa.Frame.LineNumbers.
TextSize=aa.FontSize end end s.ProcessTextChange=function(aa)local ab,ac=0,aa.
Lines for ad=1,#ac do local ae=#ac[ad]if ae>ab then ab=ae end end aa.MaxTextCols
=ab aa:UpdateView()aa.Text=table.concat(aa.Lines,'\n')aa:MapNewLines()aa:
PreHighlight()aa:Refresh()end s.ConvertText=function(aa,ab,ac)if ac then local
ad=ab:gsub('\t','    ')return ad:gsub('\t',(' %s%s '):format(z,z))else return ab
:gsub((' %s%s '):format(z,z),'\t')end end s.GetText=function(aa)local ab=table.
concat(aa.Lines,'\n')return aa:ConvertText(ab,false)end s.SetText=function(aa,ab
)ab=aa:ConvertText(ab,true)local ac=aa.Lines table.clear(ac)local ad=1 for ae in
ab:gmatch'([^\n\r]*)[\n\r]?'do ac[ad]=ae ad=ad+1 end aa:ProcessTextChange()end s
.ClearText=function(aa)local ab,ac=aa:ConvertText('',true),aa.Lines table.clear(
ac)local ad=1 for ae in ab:gmatch'([^\n\r]*)[\n\r]?'do ac[ad]=ae ad=ad+1 end aa:
ProcessTextChange()end s.CompileText=function(aa)local ab=pcall(function()local
ab=table.concat(aa.Lines,'\n')local ac=aa:ConvertText(ab,false)loadstring(ac)()
end)return ab end s.ReturnErrors=function(aa)local ab,ac=pcall(function()local
ab=table.concat(aa.Lines,'\n')local ac=aa:ConvertText(ab,false)loadstring(ac)()
end)return not ab and ac or nil end s.GetVersion=function(aa)return b end s.
MakeRichTemplates=function(aa)local ab,ac=math.floor,{}for ad,ae in pairs(aa.
Colors)do ac[ad]=('<font color="rgb(%s,%s,%s)">'):format(ab(ae.r*255),ab(ae.g*
255),ab(ae.b*255))end aa.RichTemplates=ac end s.ApplyTheme=function(aa)local ab=
d.Theme.Syntax aa.Colors=ab aa.Frame.LineNumbers.TextColor3=ab.Text aa.Frame.
BackgroundColor3=ab.Background end local aa={__index=s}local ab=function(ab)ab=
ab or{}if not x then D()end local ac,ad=q.ScrollBar.new(),q.ScrollBar.new(true)
ad.Gui.Position=UDim2.new(0,0,1,-10)local ae={FontFace=Font.fromEnum(Enum.Font.
Code),FontSize=14,ViewX=0,ViewY=0,Colors=d.Theme.Syntax,ColoredLines={},Lines={
''},LineFrames={},Editable=true,Editing=false,CursorX=0,CursorY=0,FloatCursorX=0
,Text='',PreHighlights={},SelectionRange={{-1,-1},{-1,-1}},NewLines={},
FrameOffsets=Vector2.new(0,0),MaxTextCols=0,ScrollV=ac,ScrollH=ad}local af=m(ae,
ab)local ag=setmetatable(af,aa)s.SetTextMultiplier=(function(ah)ag.FontSize=ah
end)s.GetTextMultiplier=(function()return ag.FontSize end)ac.WheelIncrement=3 ad
.Increment=2 ad.WheelIncrement=7 ac.Scrolled:Connect(function()ag.ViewY=ac.Index
ag:Refresh()end)ad.Scrolled:Connect(function()ag.ViewX=ad.Index ag:Refresh()end)
ag:MakeEditorFrame(ag)ag:MakeRichTemplates()ag:ApplyTheme()ac:SetScrollFrame(ag.
Frame.Lines)ac.Gui.Parent=ag.Frame ad.Gui.Parent=ag.Frame ag:UpdateView()ag:
SetText(af.Text)ag.Frame:GetPropertyChangedSignal'AbsoluteSize':Connect(function
()ag:UpdateView()ag:Refresh()end)return ag end return{new=ab}end)()return q end
function a.b()local aa,ab,ac={Services={},OnInitConnections={}},get_hidden_gui
or gethui,cloneref or function(...)return...end local ad=aa.Services
setmetatable(ad,{__index=function(ae,af)local ag=game:GetService(af)return ac(ag
)end})local ae,af=(ad.CoreGui)function aa:AddOnInit(ag)local ah=self.
OnInitConnections table.insert(ah,ag)end function aa:NewReference(ag)return ac(
ag)end function aa:CallOnInitConnections(ag,...)local ah=self.OnInitConnections
af=ag for ai,aj in next,ah do aj(af,...)end end function aa:SetProperties(ag,ah)
for ai,aj in next,ah do pcall(function()ag[ai]=aj end)end end function aa:
NewClass(ag,ah)ah=ah or{}ag.__index=ag return setmetatable(ah,ag)end function aa
:CheckConfig(ag,ah,ai,aj)if not ag then return end for ak,b in next,ah do if ag[
ak]~=nil then continue end if aj then if table.find(aj,ak)then continue end end
if ai then b=b()end ag[ak]=b end return ag end function aa:ResolveUIParent()
local ag,ah=af.PlayerGui,af.Debug local ai,aj={[1]=function()local ai=ab()if ai.
Parent==ae then return end return ai end,[2]=function()return ae end,[3]=
function()return ag end},af:CreateInstance'ScreenGui'for ak,b in next,ai do
local c,d=pcall(b)if not c or not d then continue end local e=pcall(function()aj
.Parent=d end)if not e then continue end if ah then af:Warn(`Step: {ak} was chosen as the parent!: {
d}`)end return d end af:Warn'The ReGui container does not have a parent defined'
return nil end function aa:GetChildOfClass(ag,ah)local ai=ag:
FindFirstChildOfClass(ah)if not ai then ai=af:CreateInstance(ah,ag)end return ai
end function aa:CheckAssetUrl(ag)if tonumber(ag)then return`rbxassetid://{ag}`
end return ag end function aa:SetPadding(ag,ah)if not ag then return end self:
SetProperties(ag,{PaddingBottom=ah,PaddingLeft=ah,PaddingRight=ah,PaddingTop=ah}
)end return aa end function a.c()local aa,ab=a.load'b',{DefaultTweenInfo=
TweenInfo.new(0.08)}local ac=aa.Services local ad=ac.TweenService function ab:
Tween(ae)local af,ag,ah=self.DefaultTweenInfo,ae.Object,ae.NoAnimation local ai,
aj,ak,b=ae.Tweeninfo or af,ae.EndProperties,ae.StartProperties,ae.Completed if
ak then aa:SetProperties(ag,ak)end if ah then aa:SetProperties(ag,aj)if b then
b()end return end local c for d,e in next,aj do local f={[d]=e}local g,h=pcall(
function()return ad:Create(ag,ai,f)end)if not g then aa:SetProperties(ag,f)
continue end if not c then c=h end h:Play()end if b then if c then c.Completed:
Connect(b)else b()end end return c end function ab:Animate(ae)local af,ag,ah,ai,
aj=ae.NoAnimation,ae.Objects,ae.Tweeninfo,(ae.Completed)for ak,b in next,ag do
local c=self:Tween{NoAnimation=af,Object=ak,Tweeninfo=ah,EndProperties=b}if not
aj then aj=c end end if ai then aj.Completed:Connect(ai)end return aj end
function ab:HeaderCollapseToggle(ae)aa:CheckConfig(ae,{Rotations={Open=90,Closed
=0}})local af,ag,ah,ai,aj=ae.Toggle,ae.NoAnimation,ae.Rotations,ae.Collapsed,ae.
Tweeninfo local ak=ai and ah.Closed or ah.Open self:Tween{Tweeninfo=aj,
NoAnimation=ag,Object=af,EndProperties={Rotation=ak}}end function ab:
HeaderCollapse(ae)local af,ag,ah,ai,aj,ak,b,c,d,e,f=ae.Tweeninfo,ae.Collapsed,ae
.ClosedSize,ae.OpenSize,ae.Toggle,ae.Resize,ae.Hide,ae.NoAnimation,ae.
NoAutomaticSize,ae.IconRotations,ae.Completed if not d then ak.AutomaticSize=
Enum.AutomaticSize.None end if not ag then b.Visible=true end self:
HeaderCollapseToggle{Tweeninfo=af,Collapsed=ag,NoAnimation=c,Toggle=aj,Rotations
=e}local g=self:Tween{Tweeninfo=af,NoAnimation=c,Object=ak,StartProperties={Size
=ag and ai or ah},EndProperties={Size=ag and ah or ai},Completed=function()b.
Visible=not ag if f then f()end if ag then return end if d then return end ak.
Size=UDim2.fromScale(1,0)ak.AutomaticSize=Enum.AutomaticSize.Y end}return g end
return ab end function a.d()local aa={}aa.__index=aa local ab=a.load'b'function
aa:Fire(...)local ac=self:GetConnections()if#ac<=0 then return end for ad,ae in
next,ac do ae(...)end end function aa:GetConnections()local ac=self.Connections
return ac end function aa:Connect(ac)local ad=self:GetConnections()table.insert(
ad,ac)end function aa:DisconnectConnections()local ac=self:GetConnections()table
.clear(ac)end function aa:NewSignal()return ab:NewClass(aa,{Connections={}})end
return aa end function a.e()return function(aa)local ab=aa:Window{Title=
'Configuration saving',Size=UDim2.fromOffset(300,200)}local ac,ad=(ab:Row())ac:
Button{Text='Dump Ini',Callback=function()print(aa:DumpIni(true))end}ac:Button{
Text='Save Ini',Callback=function()ad=aa:DumpIni(true)end}ac:Button{Text=
'Load Ini',Callback=function()if not ad then warn'No save data!'return end aa:
LoadIni(ad,true)end}ab:Separator()ab:SliderInt{IniFlag='MySlider',Value=5,
Minimum=1,Maximum=32}ab:Checkbox{IniFlag='MyCheckbox',Value=true}ab:InputText{
IniFlag='MyInput',Value='Hello world!'}ab:Keybind{IniFlag='MyKeybind',Label=
'Keybind (w/ Q & Left-Click blacklist)',KeyBlacklist={Enum.UserInputType.
MouseButton1,Enum.KeyCode.Q}}local ae=aa:TabsWindow{Title='Tabs window!',Visible
=false,Size=UDim2.fromOffset(300,200)}for af,ag in{'Avocado','Broccoli',
'Cucumber'}do local ah=ae:CreateTab{Name=ag}ah:Label{Text=`This is the {ag} tab!`
}end local af=aa.Elements:Label{Parent=aa.Container.Windows,Visible=false,
UiPadding=UDim.new(0,8),CornerRadius=UDim.new(0,2),Position=UDim2.fromOffset(10,
10),Size=UDim2.fromOffset(250,50),Border=true,BorderThickness=1,BorderColor=aa.
Accent.Gray,BackgroundTransparency=0.4,BackgroundColor3=aa.Accent.Black}game:
GetService'RunService'.RenderStepped:Connect(function(ag)local ah,ai,aj=math.
round(1/ag),DateTime.now():FormatLocalTime('dddd h:mm:ss A','en-us'),`ReGui {aa:
GetVersion()}\n`aj..=`FPS: {ah}\n`aj..=`The time is {ai}`af.Text=aj end)local ag
=aa:Window{Title='Dear ReGui Demo',Size=UDim2.new(0,400,0,300),NoScroll=true}:
Center()local ah=ag:MenuBar()local ai=ah:MenuItem{Text='Menu'}ai:Selectable{Text
='New'}ai:Selectable{Text='Open'}ai:Selectable{Text='Save'}ai:Selectable{Text=
'Save as'}ai:Selectable{Text='Exit',Callback=function()ag:Close()end}local aj=ah
:MenuItem{Text='Examples'}aj:Selectable{Text='Print hello world',Callback=
function()print'Hello world!'end}aj:Selectable{Text='Tabs window',Callback=
function()ae:ToggleVisibility()end}aj:Selectable{Text='Configuration saving',
Callback=function()ab:ToggleVisibility()end}aj:Selectable{Text='Watermark',
Callback=function()af.Visible=not af.Visible end}ag:Label{Text=`Dear ReGui says hello! ({
aa:GetVersion()})`}local ak=ag:ScrollingCanvas{Fill=true,UiPadding=UDim.new(0,0)
}local b=ak:CollapsingHeader{Title='Help'}b:Separator{Text='ABOUT THIS DEMO:'}b:
BulletText{Rows={
[[Sections below are demonstrating many aspects of the library.]]}}b:Separator{
Text='PROGRAMMER GUIDE:'}b:BulletText{Rows={
[[See example FAQ, examples, and documentation at https://depso.gitbook.io/regui]]
}}b:Indent():BulletText{Rows={'See example applications in the /demo folder.'}}
local c=ak:CollapsingHeader{Title='Configuration'}local d=c:TreeNode{Title=
'Backend Flags'}d:Checkbox{Label='ReGui:IsMobileDevice',Disabled=true,Value=aa:
IsMobileDevice()}d:Checkbox{Label='ReGui:IsConsoleDevice',Disabled=true,Value=aa
:IsConsoleDevice()}local e=c:TreeNode{Title='Style'}e:Combo{Selected='DarkTheme'
,Label='Colors',Items=aa.ThemeConfigs,Callback=function(f,g)ag:SetTheme(g)end}
local f,g=ak:CollapsingHeader{Title='Window options'}:Table{MaxColumns=3}:
NextRow(),{NoResize=false,NoTitleBar=false,NoClose=false,NoCollapse=false,
OpenOnDoubleClick=true,NoBringToFrontOnFocus=false,NoMove=false,NoSelect=false,
NoScrollBar=false,NoBackground=false}for h,i in pairs(g)do local j=f:NextColumn(
)j:Checkbox{Value=i,Label=h,Callback=function(k,l)ag:UpdateConfig{[h]=l}end}end
local h,i,m=ak:CollapsingHeader{Title='Widgets'},{'Basic','Tooltips',
'Tree Nodes','Collapsing Headers','Bullets','Text','Images','Videos','Combo',
'Tabs','Plot widgets','Multi-component Widgets','Progress Bars','Picker Widgets'
,'Code editor','Console','List layout','Indent','Viewport','Keybinds','Input',
'Text Input'},{Basic=function(h)h:Separator{Text='General'}local i=h:Row()local
j=i:Label{Text='Thanks for clicking me!',Visible=false,LayoutOrder=2}i:Button{
Callback=function()j.Visible=not j.Visible end}h:Checkbox()local k=h:Row()k:
Radiobox{Label='radio a'}k:Radiobox{Label='radio b'}k:Radiobox{Label='radio c'}
local l=h:Row()for m=1,7 do local n=m/7 l:Button{Text='Click',BackgroundColor3=
Color3.fromHSV(n,0.6,0.6)}end local m=h:Button{Text='Tooltip'}aa:SetItemTooltip(
m,function(n)n:Label{Text='I am a tooltip'}end)h:Separator{Text='Inputs'}h:
InputText{Value='Hello world!'}h:InputText{Placeholder='Enter text here',Label=
'Input text (w/ hint)',Value=''}h:InputInt{Value=50}h:InputInt{Label=
'Input Int (w/ limit)',Value=5,Maximum=10,Minimum=1}h:Separator{Text='Drags'}h:
DragInt()h:DragInt{Maximum=100,Minimum=0,Label='Drag Int 0..100',Format='%d%%'}h
:DragFloat{Maximum=1,Minimum=0,Value=0.5}h:Separator{Text='Sliders'}h:SliderInt{
Format='%.d/%s',Value=5,Minimum=1,Maximum=32,ReadOnly=false}:SetValue(8)h:
SliderInt{Label='Slider Int (w/ snap)',Value=1,Minimum=1,Maximum=8,Type='Snap'}h
:SliderFloat{Label='Slider Float',Minimum=0,Maximum=1,Format='Ratio = %.3f'}h:
SliderFloat{Label='Slider Angle',Minimum=-360,Maximum=360,Format='%.f deg'}h:
SliderEnum{Items={'Fire','Earth','Air','Water'},Value=2}h:SliderEnum{Items={
'Fire','Earth','Air','Water'},Value=2,Disabled=true,Label='Disabled Enum'}h:
SliderProgress{Label='Progress Slider',Value=8,Minimum=1,Maximum=32}h:Separator{
Text='Selectors/Pickers'}h:InputColor3{Value=aa.Accent.Light,Label='Color 1'}h:
SliderColor3{Value=aa.Accent.Light,Label='Color 2'}h:InputCFrame{Value=CFrame.
new(1,1,1),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(200,100,50),Label=
'CFrame 1'}h:SliderCFrame{Value=CFrame.new(1,1,1),Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50),Label='CFrame 2'}h:Combo{Selected=1,Items={'AAAA'
,'BBBB','CCCC','DDDD','EEEE','FFFF','GGGG','HHHH','IIIIIII','JJJJ','KKKKKKK'}}
end,Tooltips=function(h)h:Separator{Text='General'}local i=h:Button{Text='Basic'
,Size=UDim2.fromScale(1,0)}aa:SetItemTooltip(i,function(j)j:Label{Text=
'I am a tooltip'}end)local j=h:Button{Text='Fancy',Size=UDim2.fromScale(1,0)}aa:
SetItemTooltip(j,function(k)k:Label{Text='I am a fancy tooltip'}k:Image{Image=
18395893036}local l=k:Label()while wait()do l.Text=`Sin(time) = {math.sin(tick()
)}`end end)local k=h:Button{Text='Double tooltip',Size=UDim2.fromScale(1,0)}for
l=1,3 do aa:SetItemTooltip(k,function(m)m:Label{Text=`I am tooltip {l}`}end)end
end,Videos=function(h)local i=h:VideoPlayer{Video=5608327482,Looped=true,Ratio=
1.7777777777777777,RatioAspectType=Enum.AspectType.FitWithinMaxSize,RatioAxis=
Enum.DominantAxis.Width,Size=UDim2.fromScale(1,1)}i:Play()local k=h:Row{Expanded
=true}k:Button{Text='Pause',Callback=function()i:Pause()end}k:Button{Text='Play'
,Callback=function()i:Play()end}if not i.IsLoaded then i.Loaded:Wait()end local
l=k:SliderInt{Format='%.f',Value=0,Minimum=0,Maximum=i.TimeLength,Callback=
function(l,m)i.TimePosition=m end}game:GetService'RunService'.RenderStepped:
Connect(function(m)l:SetValue(i.TimePosition)end)end,['Tree Nodes']=function(h)
for i=1,5 do local k=h:TreeNode{Title=`Child {i}`,Collapsed=i~=1}local l=k:Row()
l:Label{Text='Blah blah'}l:SmallButton{Text='Button'}end h:TreeNode{Title=`With icon & NoArrow`
,NoArrow=true,Icon=aa.Icons.Image}end,['Collapsing Headers']=function(h)local i
h:Checkbox{Value=true,Label='Show 2nd header',Callback=function(k,l)if i then i:
SetVisible(l)end end}h:Checkbox{Value=true,Label='2nd has arrow',Callback=
function(k,l)if i then i:SetArrowVisible(l)end end}local k=h:CollapsingHeader{
Title='Header'}for l=1,5 do k:Label{Text=`Some content {l}`}end i=h:
CollapsingHeader{Title='Second Header'}for l=1,5 do i:Label{Text=`More content {
l}`}end end,Bullets=function(h)h:BulletText{Rows={'Bullet point 1',
'Bullet point 2\nOn multiple lines'}}h:TreeNode():BulletText{Rows={
'Another bullet point'}}h:Bullet():Label{Text='Bullet point 3 (two calls)'}h:
Bullet():SmallButton()end,Text=function(h)local i=h:TreeNode{Title=
'Colorful Text'}i:Label{TextColor3=Color3.fromRGB(255,0,255),Text='Pink',NoTheme
=true}i:Label{TextColor3=Color3.fromRGB(255,255,0),Text='Yellow',NoTheme=true}i:
Label{TextColor3=Color3.fromRGB(59,59,59),Text='Disabled',NoTheme=true}local k=h
:TreeNode{Title='Word Wrapping'}k:Label{Text=
[[This text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.]]
,TextWrapped=true}local l k:SliderInt{Label='Wrap width',Value=400,Minimum=20,
Maximum=600,Callback=function(m,n)if not l then return end l.Size=UDim2.
fromOffset(n,0)end}k:Label{Text='Test paragraph:'}l=k:Label{Text=
[[The lazy dog is a good dog. This paragraph should fit. Testing a 1 character word. The quick brown fox jumps over the lazy dog.]]
,TextWrapped=true,Border=true,BorderColor=Color3.fromRGB(255,255,0),
AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromOffset(400,0)}end,Images=
function(h)h:Label{TextWrapped=true,Text=
[[Below we are displaying the icons (which are the ones builtin to ReGui in this demo). Hover the texture for a zoomed view!]]
}h:Label{TextWrapped=true,Text=`There is a total of {aa:GetDictSize(aa.Icons)} icons in this demo!`
}local i,k,l=(h:List{Border=true})aa:SetItemTooltip(i,function(m)k=m:Label()l=m:
Image{Size=UDim2.fromOffset(50,50)}end)for m,n in aa.Icons do local o=i:Image{
Image=n,Size=UDim2.fromOffset(30,30)}aa:DetectHover(o,{MouseEnter=true,OnInput=
function()k.Text=m l.Image=n end})end end,Tabs=function(h)local i=h:TreeNode{
Title='Basic'}local k,l=i:TabSelector(),{'Avocado','Broccoli','Cucumber'}for m,n
in next,l do k:CreateTab{Name=n}:Label{Text=`This is the {n} tab!\nblah blah blah blah blah`
}end local m=h:TreeNode{Title='Advanced & Close Button'}local n,o=m:TabSelector(
),{'Artichoke','Beetroot','Celery','Daikon'}for p,q in next,o do local r=n:
CreateTab{Name=q,Closeable=true}r:Label{Text=`This is the {q} tab!\nblah blah blah blah blah`
}end m:Button{Text='Add tab',Callback=function()n:CreateTab{Closeable=true}:
Label{Text='I am an odd tab.'}end}end,['Plot widgets']=function(h)local i=h:
PlotHistogram{Points={0.6,0.1,1,0.5,0.92,0.1,0.2}}h:Button{Text=
'Generate new graph',Callback=function()local m={}for n=1,math.random(5,10)do
table.insert(m,math.random(1,10))end i:PlotGraph(m)end}end,[
'Multi-component Widgets']=function(h)h:Separator{Text='2-wide'}h:InputInt2{
Value={10,50},Minimum={0,0},Maximum={20,100},Callback=function(i,m)print('1:',m[
1],'2:',m[2])end}h:SliderInt2()h:SliderFloat2()h:DragInt2()h:DragFloat2()h:
Separator{Text='3-wide'}h:InputInt3()h:SliderInt3()h:SliderFloat3()h:DragInt3()h
:DragFloat3()h:Separator{Text='4-wide'}h:InputInt4()h:SliderInt4()h:
SliderFloat4()h:DragInt4()h:DragFloat4()end,['Progress Bars']=function(h)local i
=h:ProgressBar{Label='Loading...',Value=80}spawn(function()local m=0 while wait(
0.02)do m+=1 i:SetPercentage(m%100)end end)end,['Picker Widgets']=function(h)h:
Separator{Text='Color pickers'}h:DragColor3{Value=aa.Accent.Light}h:SliderColor3
{Value=aa.Accent.Red}h:InputColor3{Value=aa.Accent.Green}h:Separator{Text=
'CFrame pickers'}h:DragCFrame{Value=CFrame.new(1,1,1),Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50)}h:SliderCFrame()h:InputCFrame()end,['Code editor'
]=function(h)h:CodeEditor{Text='print("Hello from ReGui\'s editor!")',Editable=
true}end,Console=function(h)local i=h:TreeNode{Title='Basic'}local m,n=i:Console
{ReadOnly=true,AutoScroll=true,MaxLines=50},h:TreeNode{Title=
'Advanced & RichText'}local o,p=n:Console{ReadOnly=true,AutoScroll=true,RichText
=true,MaxLines=50},h:TreeNode{Title='Editor'}p:Console{Value=
"print('Hello world!')",LineNumbers=true}coroutine.wrap(function()while wait()do
local q=DateTime.now():FormatLocalTime('h:mm:ss A','en-us')o:AppendText(`<font color="rgb(240, 40, 10)">[Random]</font>`
,math.random())m:AppendText(`[{q}] Hello world!`)end end)()end,Combo=function(h)
h:Combo{WidthFitPreview=true,Label='WidthFitPreview',Selected=1,Items={
'AAAAAAAAAAAA','BBBBBBBB','CCCCC','DDD'}}h:Separator{Text='One-liner variants'}h
:Combo{Label='Combo 1 (array)',Selected=1,Items={'AAAA','BBBB','CCCC','DDDD',
'EEEE','FFFF','GGGG','HHHH','IIIIIII','JJJJ','KKKKKKK'}}h:Combo{Label=
'Combo 1 (dict)',Selected='AAA',Items={AAA='Apple',BBB='Banana',CCC='Orange'},
Callback=print}h:Combo{Label='Combo 2 (function)',Selected=1,GetItems=function()
return{'aaa','bbb','ccc'}end}end,Indent=function(h)h:Label{Text=
'This is not indented'}local i=h:Indent{Offset=30}i:Label{Text=
'This is indented by 30 pixels'}local m=i:Indent{Offset=30}m:Label{Text=
'This is indented by 30 more pixels'}end,Viewport=function(h)local i=aa:
InsertPrefab'R15 Rig'local m=h:Viewport{Size=UDim2.new(1,0,0,200),Clone=true,
Model=i}local n=m.Model n:PivotTo(CFrame.new(0,-2.5,-5))local o=game:GetService
'RunService'o.RenderStepped:Connect(function(p)local q=CFrame.Angles(0,math.rad(
30*p),0)local r=n:GetPivot()*q n:PivotTo(r)end)end,['List layout']=function(h)
local i=h:List()for m=1,10 do i:Button{Text=`Resize the window! {m}`}end end,
Keybinds=function(h)local i=h:Checkbox{Value=true}h:Keybind{Label=
'Toggle checkbox',IgnoreGameProcessed=false,OnKeybindSet=function(m,n)warn(
'[OnKeybindSet] .Value ->',n)end,Callback=function(m,n)print(n)i:Toggle()end}h:
Keybind{Label='Keybind (w/ Q & Left-Click blacklist)',KeyBlacklist={Enum.
UserInputType.MouseButton1,Enum.KeyCode.Q}}h:Keybind{Label=
'Toggle UI visibility',Value=Enum.KeyCode.E,Callback=function()ag:
ToggleVisibility()end}end,Input=function(h)h:InputText{Label='One Line Text'}h:
InputTextMultiline{Label='Multiline Text'}h:InputInt{Label='Input int'}end,[
'Text Input']=function(h)local i=h:TreeNode{Title='Multiline'}i:
InputTextMultiline{Size=UDim2.new(1,0,0,117),Value=
'/*The Pentium FOOF bug, shorthand for FO OF C7 C8,\r\n    the hexadecimal encoding of one offending instruction,\r\n    more formally, the invalid operand with locked CMPXCHG8B\r\n    instruction bug, is a design flaw in the majority of\r\n    Intel Pentium, Pentium MMX, and Pentium OverDrive\r\n    processors (all in the P5 microarchitecture).#\r\n    */'
}end}for n,o in i do local p,q=h:TreeNode{Title=o},m[o]if q then task.spawn(q,p)
end end local n=ak:CollapsingHeader{Title='Popups & child windows'}local o=n:
TreeNode{Title='Popups'}local p=o:Row()local q=p:Label{Text='<None>',LayoutOrder
=2}p:Button{Text='Select..',Callback=function(r)local s,t={'Bream','Haddock',
'Mackerel','Pollock','Tilefish'},o:PopupCanvas{RelativeTo=r,MaxSizeX=200}t:
Separator{Text='Aquarium'}for u,v in s do t:Selectable{Text=v,Callback=function(
w)q.Text=v t:ClosePopup()end}end end}local r=n:TreeNode{Title='Child windows'}
local s=r:Window{Size=UDim2.fromOffset(300,200),NoMove=true,NoClose=true,
NoCollapse=true,NoResize=true}s:Label{Text='Hello, world!'}s:Button{Text='Save'}
s:InputText{Label='string'}s:SliderFloat{Label='float',Minimum=0,Maximum=1}local
t=n:TreeNode{Title='Modals'}t:Label{Text=
[[Modal windows are like popups but the user cannot close them by clicking outside.]]
,TextWrapped=true}t:Button{Text='Delete..',Callback=function()local u=t:
PopupModal{Title='Delete?'}u:Label{Text=
[[All those beautiful files will be deleted.
This operation cannot be undone!]],
TextWrapped=true}u:Separator()u:Checkbox{Value=false,Label=
"Don't ask me next time"}local v=u:Row{Expanded=true}v:Button{Text='Okay',
Callback=function()u:ClosePopup()end}v:Button{Text='Cancel',Callback=function()u
:ClosePopup()end}end}t:Button{Text='Stacked modals..',Callback=function()local u
=t:PopupModal{Title='Stacked 1'}u:Label{Text=`Hello from Stacked The First\nUsing Theme["ModalWindowDimBg"] behind it.`
,TextWrapped=true}u:Combo{Items={'aaaa','bbbb','cccc','dddd','eeee'}}u:
DragColor3{Value=Color3.fromRGB(102,178,0)}u:Button{Text='Add another modal..',
Callback=function()local v=t:PopupModal{Title='Stacked 2'}v:Label{Text=
'Hello from Stacked The Second!',TextWrapped=true}v:DragColor3{Value=Color3.
fromRGB(102,178,0)}v:Button{Text='Close',Callback=function()v:ClosePopup()end}
end}u:Button{Text='Close',Callback=function()u:ClosePopup()end}end}local u=ak:
CollapsingHeader{Title='Tables & Columns'}local v=u:TreeNode{Title='Basic'}local
w=v:Table()for x=1,3 do local y=w:Row()for z=1,3 do local A=y:Column()for B=1,4
do A:Label{Text=`Row {B} Column {z}`}end end end local x=u:TreeNode{Title=
'Borders, background'}local y=x:Table{RowBackground=true,Border=true,MaxColumns=
3}for z=1,5 do local A=y:NextRow()for B=1,3 do local C=A:NextColumn()C:Label{
Text=`Hello {B},{z}`}end end local z=u:TreeNode{Title='With headers'}local A,B=z
:Table{Border=true,RowBackground=true,MaxColumns=3},{'One','Two','Three'}for C=1
,7 do if C==1 then p=A:HeaderRow()else p=A:Row()end for D,E in B do if C==1 then
local F=p:Column()F:Label{Text=E}continue end local F=p:NextColumn()F:Label{Text
=`Hello {D},{C}`}end end end end function a.f()return{Dot=
'rbxasset://textures/whiteCircle.png',Arrow=
'rbxasset://textures/ui/AvatarContextMenu_Arrow.png',Close=
'rbxasset://textures/loading/cancelButton.png',Checkmark=
'rbxasset://textures/ui/Lobby/Buttons/nine_slice_button.png',Cat=
'rbxassetid://16211812161',Script='rbxassetid://11570895459',Settings=
'rbxassetid://9743465390',Info='rbxassetid://18754976792',Move=
'rbxassetid://6710235139',Roblox='rbxassetid://7414445494',Warning=
'rbxassetid://11745872910',Audio='rbxassetid://302250236',Shop=
'rbxassetid://6473525198',CharacterDance='rbxassetid://11932783331',Pants=
'rbxassetid://10098755331',Home='rbxassetid://4034483344',Robux=
'rbxassetid://5986143282',Badge='rbxassetid://16170504068',SpawnLocation=
'rbxassetid://6400507398',Sword='rbxassetid://7485051715',Clover=
'rbxassetid://11999300014',Star='rbxassetid://3057073083',Code=
'rbxassetid://11348555035',Paw='rbxassetid://13001190533',Shield=
'rbxassetid://7461510428',Shield2='rbxassetid://7169354142',File=
'rbxassetid://7276823330',Book='rbxassetid://16061686835',Location=
'rbxassetid://13549782519',Puzzle='rbxassetid://8898417863',Discord=
'rbxassetid://84828491431270',Premium='rbxassetid://6487178625',Friend=
'rbxassetid://10885655986',User='rbxassetid://18854794412',Duplicate=
'rbxassetid://11833749507',ChatBox='rbxassetid://15839118471',ChatBox2=
'rbxassetid://15839116089',Devices='rbxassetid://4458812712',Weight=
'rbxassetid://9855685269',Image='rbxassetid://123311808092347',Profile=
'rbxassetid://13585614795',Admin='rbxassetid://11656483170',PaintBrush=
'rbxassetid://12111879608',Speed='rbxassetid://12641434961',NoConnection=
'rbxassetid://9795340967',Connection='rbxassetid://119759670842477',Globe=
'rbxassetid://18870359747',Box='rbxassetid://140217940575618',Crown=
'rbxassetid://18826490498',Control='rbxassetid://18979524646',Send=
'rbxassetid://18940312887',FastForward='rbxassetid://112963221295680',Pause=
'rbxassetid://109949100737970',Reload='rbxassetid://11570018242',Joystick=
'rbxassetid://18749336354',Controller='rbxassetid://11894535915',Lock=
'rbxassetid://17783082088',Calculator='rbxassetid://85861816563977',Sun=
'rbxassetid://13492317832',Moon='rbxassetid://8498174594',Prohibited=
'rbxassetid://5248916036',Flag='rbxassetid://251346532',Website=
'rbxassetid://98455290625865',Telegram='rbxassetid://115860270107061',MusicNote=
'rbxassetid://18187351229',Music='rbxassetid://253830398',Headphones=
'rbxassetid://1311321471',Phone='rbxassetid://8411963035',Smartphone=
'rbxassetid://14040313879',Desktop='rbxassetid://3120635703',Desktop2=
'rbxassetid://4728059490',Laptop='rbxassetid://4728059725',Server=
'rbxassetid://9692125126',Wedge='rbxassetid://9086583059',Drill=
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}end function a.g
()return{Light=Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),
ExtraDark=Color3.fromRGB(28,39,53),White=Color3.fromRGB(240,240,240),Gray=Color3
.fromRGB(172,171,175),Black=Color3.fromRGB(15,19,24),Yellow=Color3.fromRGB(230,
180,0),Orange=Color3.fromRGB(230,150,0),Green=Color3.fromRGB(130,188,91),Red=
Color3.fromRGB(255,69,69),ImGui={Light=Color3.fromRGB(66,150,250),Dark=Color3.
fromRGB(41,74,122),Black=Color3.fromRGB(15,15,15),Gray=Color3.fromRGB(36,36,36)}
}end function a.h()local aa,ab=a.load'g',{}ab.DarkTheme={Values={
AnimationTweenInfo=TweenInfo.new(0.08),TextFont=Font.fromEnum(Enum.Font.
RobotoMono),TextSize=14,Text=aa.White,TextDisabled=aa.Gray,ErrorText=aa.Red,
FrameBg=aa.Dark,FrameBgTransparency=0.4,FrameBgActive=aa.Light,
FrameBgTransparencyActive=0.4,FrameRounding=UDim.new(0,0),SliderGrab=aa.Light,
ButtonsBg=aa.Light,CollapsingHeaderBg=aa.Light,CollapsingHeaderText=aa.White,
CheckMark=aa.Light,ResizeGrab=aa.Light,HeaderBg=aa.Gray,HeaderBgTransparency=0.7
,HistogramBar=aa.Yellow,ProgressBar=aa.Yellow,RegionBg=aa.Dark,
RegionBgTransparency=0.1,Separator=aa.Gray,SeparatorTransparency=0.5,
ConsoleLineNumbers=aa.White,LabelPaddingTop=UDim.new(0,0),LabelPaddingBottom=
UDim.new(0,0),MenuBar=aa.ExtraDark,MenuBarTransparency=0.1,PopupCanvas=aa.Black,
TabTextPaddingTop=UDim.new(0,3),TabTextPaddingBottom=UDim.new(0,8),TabText=aa.
Gray,TabBg=aa.Dark,TabTextActive=aa.White,TabBgActive=aa.Light,TabsBarBg=Color3.
fromRGB(36,36,36),TabsBarBgTransparency=1,TabPagePadding=UDim.new(0,8),
ModalWindowDimBg=Color3.fromRGB(230,230,230),ModalWindowDimTweenInfo=TweenInfo.
new(0.2),WindowBg=aa.Black,WindowBgTransparency=0.05,Border=aa.Gray,
BorderTransparency=0.8,BorderTransparencyActive=0.5,Title=aa.White,TitleAlign=
Enum.TextXAlignment.Left,TitleBarBg=aa.Black,TitleBarTransparency=0,TitleActive=
aa.White,TitleBarBgActive=aa.Dark,TitleBarTransparencyActive=0.05,
TitleBarBgCollapsed=Color3.fromRGB(0,0,0),TitleBarTransparencyCollapsed=0.6}}ab.
LightTheme={BaseTheme=ab.DarkTheme,Values={Text=aa.Black,TextFont=Font.fromEnum(
Enum.Font.Ubuntu),TextSize=14,FrameBg=aa.Gray,FrameBgTransparency=0.4,
FrameBgActive=aa.Light,FrameBgTransparencyActive=0.6,SliderGrab=aa.Light,
ButtonsBg=aa.Light,CollapsingHeaderText=aa.Black,Separator=aa.Black,
ConsoleLineNumbers=aa.Yellow,MenuBar=Color3.fromRGB(219,219,219),PopupCanvas=aa.
White,TabText=aa.Black,TabTextActive=aa.Black,WindowBg=aa.White,Border=aa.Gray,
ResizeGrab=aa.Gray,Title=aa.Black,TitleAlign=Enum.TextXAlignment.Center,
TitleBarBg=aa.Gray,TitleActive=aa.Black,TitleBarBgActive=Color3.fromRGB(186,186,
186),TitleBarBgCollapsed=aa.Gray}}ab.ImGui={BaseTheme=ab.DarkTheme,Values={
AnimationTweenInfo=TweenInfo.new(0),Text=Color3.fromRGB(255,255,255),FrameBg=aa.
ImGui.Dark,FrameBgTransparency=0.4,FrameBgActive=aa.ImGui.Light,
FrameBgTransparencyActive=0.5,FrameRounding=UDim.new(0,0),ButtonsBg=aa.ImGui.
Light,CollapsingHeaderBg=aa.ImGui.Light,CollapsingHeaderText=aa.White,CheckMark=
aa.ImGui.Light,ResizeGrab=aa.ImGui.Light,MenuBar=aa.ImGui.Gray,
MenuBarTransparency=0,PopupCanvas=aa.ImGui.Black,TabText=aa.Gray,TabBg=aa.ImGui.
Dark,TabTextActive=aa.White,TabBgActive=aa.ImGui.Light,WindowBg=aa.ImGui.Black,
WindowBgTransparency=0.05,Border=aa.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=aa.White,TitleBarBg=aa.ImGui.Black,
TitleBarTransparency=0,TitleBarBgActive=aa.ImGui.Dark,TitleBarTransparencyActive
=0}}return ab end function a.i()local aa,ab=(a.load'b')aa:AddOnInit(function(ad)
ab=ad end)return{{Properties={'Center'},Callback=function(ad,ae,af)local ag=ae.
Position aa:SetProperties(ae,{Position=UDim2.new(af:find'X'and 0.5 or ag.X.Scale
,ag.X.Offset,af:find'Y'and 0.5 or ag.Y.Scale,ag.Y.Offset),AnchorPoint=Vector2.
new(af:find'X'and 0.5 or 0,af:find'Y'and 0.5 or 0)})end},{Properties={
'ElementStyle'},Callback=function(ad,ae,af)ab:ApplyStyle(ae,af)end},{Properties=
{'ColorTag'},Callback=function(ad,ae,af)local ag,ah=ad.Class,ad.WindowClass
local aj=ag.NoAutoTheme if not ah then return end if aj then return end ab:
UpdateColors{Object=ae,Tag=af,NoAnimation=true,Theme=ah.Theme}end},{Properties={
'Animation'},Callback=function(ad,ae,af)local ag=ad.Class.NoAnimation if ag then
return end ab:SetAnimation(ae,af)end},{Properties={'Image'},Callback=function(ad
,ae,af)local ag=ad.WindowClass ae.Image=aa:CheckAssetUrl(af)ab:DynamicImageTag(
ae,af,ag)end},{Properties={'Icon','IconSize','IconRotation','IconPadding'},
Callback=function(ad,ae,af)local ag=ae:FindFirstChild('Icon',true)if not ag then
ab:Warn('No icon for',ae)return end local ah=ad.Class aa:CheckConfig(ah,{Icon=''
,IconSize=UDim2.fromScale(1,1),IconRotation=0,IconPadding=UDim2.new(0,2)})local
aj=ag.Parent:FindFirstChild'UIPadding'aa:SetPadding(aj,ah.IconPadding)local ak=
ah.Icon ak=aa:CheckAssetUrl(ak)local b=ad.WindowClass ab:DynamicImageTag(ag,ak,b
)aa:SetProperties(ag,{Visible=ag~='',Image=aa:CheckAssetUrl(ak),Size=ah.IconSize
,Rotation=ah.IconRotation})end},{Properties={'BorderThickness','Border',
'BorderColor'},Callback=function(ad,ae,af)local ag=ad.Class local ah=ag.Border==
true aa:CheckConfig(ag,{BorderTransparency=ad:GetThemeKey
'BorderTransparencyActive',BorderColor=ad:GetThemeKey'Border',BorderThickness=1,
BorderStrokeMode=Enum.ApplyStrokeMode.Border})local aj=aa:GetChildOfClass(ae,
'UIStroke')aa:SetProperties(aj,{Transparency=ag.BorderTransparency,Thickness=ag.
BorderThickness,Color=ag.BorderColor,ApplyStrokeMode=ag.BorderStrokeMode,Enabled
=ah})end},{Properties={'Ratio'},Callback=function(ad,ae,af)local ag=ad.Class aa:
CheckConfig(ag,{Ratio=1.3333333333333333,RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize})local ah,aj,ak,b=ag.Ratio,
ag.RatioAxis,ag.RatioAspectType,aa:GetChildOfClass(ae,'UIAspectRatioConstraint')
aa:SetProperties(b,{DominantAxis=aj,AspectType=ak,AspectRatio=ah})end},{
Properties={'FlexMode'},Callback=function(ad,ae,af)local ag=aa:GetChildOfClass(
ae,'UIFlexItem')ag.FlexMode=af end},{Properties={'CornerRadius'},Callback=
function(ad,ae,af)local ag=aa:GetChildOfClass(ae,'UICorner')ag.CornerRadius=af
end},{Properties={'Fill'},Callback=function(ad,ae,af)if af~=true then return end
local ag=ad.Class aa:CheckConfig(ag,{Size=UDim2.fromScale(1,1),UIFlexMode=Enum.
UIFlexMode.Fill,AutomaticSize=Enum.AutomaticSize.None})local ah=aa:
GetChildOfClass(ae,'UIFlexItem')ah.FlexMode=ag.UIFlexMode ae.Size=ag.Size ae.
AutomaticSize=ag.AutomaticSize end},{Properties={'Label'},Callback=function(ad,
ae,af)local ag,ah=ad.Class,ae:FindFirstChild'Label'if not ah then return end ah.
Text=tostring(af)function ag:SetLabel(aj)ah.Text=aj return self end end},{
Properties={'NoGradient'},WindowProperties={'NoGradients'},Callback=function(ad,
ae,af)local ag=ae:FindFirstChildOfClass'UIGradient'if not ag then return end ag.
Enabled=af end},{Properties={'UiPadding','PaddingBottom','PaddingTop',
'PaddingRight','PaddingTop'},Callback=function(ad,ae,af)af=af or 0 if typeof(af)
=='number'then af=UDim.new(0,af)end local ag=ad.Class local ah=ag.UiPadding if
ah then aa:CheckConfig(ag,{PaddingBottom=af,PaddingLeft=af,PaddingRight=af,
PaddingTop=af})end local aj=aa:GetChildOfClass(ae,'UIPadding')aa:SetProperties(
aj,{PaddingBottom=ag.PaddingBottom,PaddingLeft=ag.PaddingLeft,PaddingRight=ag.
PaddingRight,PaddingTop=ag.PaddingTop})end},{Properties={'Callback'},Callback=
function(ad,ae)local af=ad.Class function af:SetCallback(ag)self.Callback=ag
return self end function af:FireCallback(ag)self.Callback(ae)return self end end
},{Properties={'Value'},Callback=function(ad,ae)local af=ad.Class aa:
CheckConfig(af,{GetValue=function(ag)return af.Value end})end}}end function a.j(
)local aa={}aa.Coloring={MenuBar={BackgroundColor3='MenuBar',
BackgroundTransparency='MenuBarTransparency'},FrameRounding={CornerRadius=
'FrameRounding'},PopupCanvas={BackgroundColor3='PopupCanvas'},ModalWindowDim={
BackgroundColor3='ModalWindowDimBg'},Selectable='Button',MenuButton='Button',
Separator={BackgroundColor3='Separator',BackgroundTransparency=
'SeparatorTransparency'},Region={BackgroundColor3='RegionBg',
BackgroundTransparency='RegionBgTransparency'},Label={TextColor3='Text',FontFace
='TextFont',TextSize='TextSize'},ImageFollowsText={ImageColor3='Text'},
ConsoleLineNumbers={TextColor3='ConsoleLineNumbers',FontFace='TextFont',TextSize
='TextSize'},ConsoleText='Label',LabelDisabled={TextColor3='TextDisabled',
FontFace='TextFont',TextSize='TextSize'},Plot={BackgroundColor3='HistogramBar'},
Header={BackgroundColor3='HeaderBg',BackgroundTransparency=
'HeaderBgTransparency'},WindowTitle={TextXAlignment='TitleAlign',FontFace=
'TextFont',TextSize='TextSize'},TitleBar={BackgroundColor3='TitleBarBgActive'},
Window={BackgroundColor3='WindowBg',BackgroundTransparency=
'WindowBgTransparency'},TitleBarBgCollapsed={BackgroundColor3=
'TitleBarBgCollapsed',BackgroundTransparency='TitleBarTransparencyCollapsed'},
TitleBarBgActive={BackgroundColor3='TitleBarBgActive',BackgroundTransparency=
'TitleBarTransparencyActive'},TitleBarBg={BackgroundColor3='TitleBarBg',
BackgroundTransparency='TitleBarTransparency'},TabsBar={BackgroundColor3=
'TabsBarBg',BackgroundTransparency='TabsBarBgTransparency'},Border={Color=
'Border',Transparency='BorderTransparency'},ResizeGrab={TextColor3='ResizeGrab'}
,BorderActive={Transparency='BorderTransparencyActive'},Frame={BackgroundColor3=
'FrameBg',BackgroundTransparency='FrameBgTransparency',TextColor3='Text',
FontFace='TextFont',TextSize='TextSize'},FrameActive={BackgroundColor3=
'FrameBgActive',BackgroundTransparency='FrameBgTransparencyActive'},SliderGrab={
BackgroundColor3='SliderGrab'},Button={BackgroundColor3='ButtonsBg',TextColor3=
'Text',FontFace='TextFont',TextSize='TextSize'},CollapsingHeader={FontFace=
'TextFont',TextSize='TextSize',TextColor3='CollapsingHeaderText',
BackgroundColor3='CollapsingHeaderBg'},Checkbox={BackgroundColor3='FrameBg'},
CheckMark={ImageColor3='CheckMark',BackgroundColor3='CheckMark'},RadioButton={
BackgroundColor3='ButtonsBg',TextColor3='Text',FontFace='TextFont',TextSize=
'TextSize'}}aa.Styles={RadioButton={Animation='RadioButtons',CornerRadius=UDim.
new(1,0)},Button={Animation='Buttons'},CollapsingHeader={Animation='Buttons'},
TreeNode={Animation='TransparentButtons'},TransparentButton={Animation=
'TransparentButtons'}}aa.Animations={Invisible={Connections={MouseEnter={Visible
=true},MouseLeave={Visible=false}},Init='MouseLeave'},Buttons={Connections={
MouseEnter={BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0.7}}
,Init='MouseLeave'},TextButtons={Connections={MouseEnter={TextTransparency=0.3},
MouseLeave={TextTransparency=0.7}},Init='MouseLeave'},TransparentButtons={
Connections={MouseEnter={BackgroundTransparency=0.3},MouseLeave={
BackgroundTransparency=1}},Init='MouseLeave'},RadioButtons={Connections={
MouseEnter={BackgroundTransparency=0.5},MouseLeave={BackgroundTransparency=1}},
Init='MouseLeave'},Inputs={Connections={MouseEnter={BackgroundTransparency=0},
MouseLeave={BackgroundTransparency=0.5}},Init='MouseLeave'},Plots={Connections={
MouseEnter={BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0}},
Init='MouseLeave'},Border={Connections={Selected={Transparency=0,Thickness=1},
Deselected={Transparency=0.7,Thickness=1}},Init='Selected'}}return aa end end
local aa,ab,ad,ae,af={Version='1.4.7',Author='Depso',License='MIT',Repository=
'https://github.com/depthso/Dear-ReGui/',Debug=false,PrefabsId=71968920594655,
DefaultTitle='ReGui',ContainerName='ReGui',DoubleClickThreshold=0.3,
TooltipOffset=15,IniToSave={'Value'},ClassIgnored={'Visible','Text'},Container=
nil,Prefabs=nil,FocusedWindow=nil,HasTouchScreen=false,Services=nil,Elements={},
_FlagCache={},_ErrorCache={},Windows={},ActiveTooltips={},IniSettings={},
AnimationConnections={}},a.load'a',a.load'b',a.load'c',a.load'd'aa.DemoWindow=a.
load'e'aa.Services=ad.Services aa.Animation=ae aa.Icons=a.load'f'aa.Accent=a.
load'g'aa.ThemeConfigs=a.load'h'aa.ElementFlags=a.load'i'local ag=a.load'j'aa.
ElementColors=ag.Coloring aa.Animations=ag.Animations aa.Styles=ag.Styles ad:
CallOnInitConnections(aa)aa.DynamicImages={[aa.Icons.Arrow]='ImageFollowsText',[
aa.Icons.Close]='ImageFollowsText',[aa.Icons.Dot]='ImageFollowsText'}local ah=aa
.Services local aj,ak,b,c,d=ah.HttpService,ah.Players,ah.UserInputService,ah.
RunService,ah.InsertService local e=ad:NewReference(ak.LocalPlayer)aa.PlayerGui=
ad:NewReference(e.PlayerGui)aa.Mouse=ad:NewReference(e:GetMouse())local f=
function()end function GetAndRemove(g,h)local i=h[g]if i then h[g]=nil end
return i end function MoveTableItem(g,h,i)local m=table.find(g,h)if not m then
return end local n=table.remove(g,m)table.insert(g,i,n)end function Merge(g,h)
for i,m in next,h do g[i]=m end end function Copy(g,h)local i=table.clone(g)if h
then Merge(i,h)end return i end function aa:Warn(...)warn('[ReGui]::',...)end
function aa:Error(...)local g=aa:Concat({...},' ')local h=`\n[ReGui]:: {g}`
coroutine.wrap(error)(h)end function aa:IsDoubleClick(g)local h=self.
DoubleClickThreshold return g<h end function aa:StyleContainers()local g=self.
Container local h,i=g.Overlays,g.Windows self:SetProperties(i,{OnTopOfCoreBlur=
true})self:SetProperties(h,{OnTopOfCoreBlur=true})end function aa:Init(g)g=g or{
}if self.Initialised then return end Merge(self,g)Merge(self,{Initialised=true,
HasGamepad=self:IsConsoleDevice(),HasTouchScreen=self:IsMobileDevice()})self:
CheckConfig(self,{ContainerParent=function()return ad:ResolveUIParent()end,
Prefabs=function()return self:LoadPrefabs()end},true)self:CheckConfig(self,{
Container=function()return self:InsertPrefab('Container',{Parent=self.
ContainerParent,Name=self.ContainerName})end},true)local h,i,m=self.Container,
self.TooltipOffset,self.ActiveTooltips local n,o=h.Overlays,0 self:
StyleContainers()self.TooltipsContainer=self.Elements:Overlay{Parent=n}b.
InputBegan:Connect(function(p)if not self:IsMouseEvent(p,true)then return end
local q=tick()local r=q-o local s=self:IsDoubleClick(r)o=s and 0 or q self:
UpdateWindowFocuses()end)local p=function()local p,q=self.TooltipsContainer,#m>0
p.Visible=q if not q then return end local r,s=aa:GetMouseLocation()local t=n.
AbsolutePosition p.Position=UDim2.fromOffset(r-t.X+i,s-t.Y+i)end c.RenderStepped
:Connect(p)end function aa:CheckImportState()if self.Initialised then return end
local g=self.PrefabsId local h=ad:CheckAssetUrl(g)local i,m=pcall(function()
return ad:NewReference(d:LoadLocalAsset(h))end)self:Init{Prefabs=i and m or nil}
end function aa:GetVersion()return self.Version end function aa:IsMobileDevice()
return b.TouchEnabled end function aa:IsConsoleDevice()return b.GamepadEnabled
end function aa:GetScreenSize()return workspace.CurrentCamera.ViewportSize end
function aa:LoadPrefabs()local g,h=self.PlayerGui,'ReGui-Prefabs'local i=script:
WaitForChild(h,2)if i then return i end local m=g:WaitForChild(h,2)if m then
return m end return nil end function aa:CheckConfig(g,h,i,m)return ad:
CheckConfig(g,h,i,m)end function aa:CreateInstance(g,h,i)local m=Instance.new(g,
h)if i then local n=i.UsePropertiesList if not n then self:SetProperties(m,i)
else self:ApplyFlags{Object=m,Class=i}end end return m end function aa:
ConnectMouseEvent(g,h)local i,m,n,o,p=h.Callback,h.DoubleClick,h.
OnlyMouseHovering,0 if n then p=self:DetectHover(n)end g.Activated:Connect(
function(...)local q=tick()local r=q-o if p and not p.Hovering then return end
if m then if not aa:IsDoubleClick(r)then o=q return end o=0 end i(...)end)end
function aa:GetAnimation(g)return g and self.Animation or TweenInfo.new(0)end
function aa:DynamicImageTag(g,h,i)local m=self.DynamicImages local n=m[h]if not
n then return end if not i then return end i:TagElements{[g]=n}end function aa:
GetDictSize(g)local h=0 for i,m in g do h+=1 end return h end function aa:
RemoveAnimations(g)local h=self:GetAnimationData(g)local i=h.Connections for m,n
in next,i do n:Disconnect()end end function aa:GetAnimationData(g)local h=self.
AnimationConnections local i=h[g]if i then return i end local m={Connections={}}
h[g]=m return m end function aa:AddAnimationSignal(g,h)local i=self:
GetAnimationData(g)local m=i.Connections table.insert(m,h)end function aa:
SetAnimationsEnabled(g)self.NoAnimations=not g end function aa:SetAnimation(g,h,
i)i=i or g local m,n,o=self.Animations,self.HasTouchScreen,h if typeof(h)~=
'table'then o=m[h]end assert(o,`No animation data for Class {h}!`)self:
RemoveAnimations(i)local p,q,r,s,t=o.Init,o.Connections,o.Tweeninfo,o.
NoAnimation,self:GetAnimationData(g)local u,v,x,y,z,A=t.State,true,{},{}function
y:Reset(B)if not z then return end z(B)end function y:FireSignal(B,C)x[B](C)end
function y:Refresh(B)if not A then return end x[A](B)end function y:SetEnabled(B
)v=B end for B,C in next,q do local D,E=function(D)D=D==true A=B local E=self.
NoAnimations if E then return end if not v then return end t.State=B ae:Tween{
NoAnimation=D or s,Object=g,Tweeninfo=r,EndProperties=C}end,i[B]if not n then
local F=E:Connect(D)self:AddAnimationSignal(i,F)end x[B]=D if B==p then z=D end
end if u then y:FireSignal(u)else y:Reset(true)end return y end function aa:
ConnectDrag(g,h)self:CheckConfig(h,{DragStart=f,DragEnd=f,DragMovement=f,
OnDragStateChange=f})local i,m,n,o,p,q=h.DragStart,h.DragEnd,h.DragMovement,h.
OnDragStateChange,{StartAndEnd={Enum.UserInputType.MouseButton1,Enum.
UserInputType.Touch},Movement={Enum.UserInputType.MouseMovement,Enum.
UserInputType.Touch}},false local r,s,t=function(r,s)local t=r.UserInputType
return table.find(p[s],t)end,function(r)local s=r.Position return Vector2.new(s.
X,s.Y)end,function(r)self._DraggingDisabled=r q=r o(r)end local u=function(u)
local v,x,y=u.IsDragging,u.InputType,u.Callback return function(z)if u.
DraggingRequired~=q then return end if u.CheckDraggingDisabled and self.
_DraggingDisabled then return end if not r(z,x)then return end if u.UpdateState
then t(v)end local A=s(z)y(A)end end g.InputBegan:Connect(u{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=i})b.InputEnded:Connect(u{DraggingRequired
=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',Callback=m})b.
InputChanged:Connect(u{DraggingRequired=true,InputType='Movement',Callback=n})
end function aa:MakeDraggable(g)local h,i,m,n,o,p=g.Move,g.Grab,g.
OnDragStateChange,{}function n:SetEnabled(q)local r=g.StateChanged self.Enabled=
q if r then r(self)end end function n:CanDrag(q)return self.Enabled end local q,
r,s,t,u=function(q)if not n:CanDrag()then return end local r=g.DragBegin p=q r(p
)end,function(q)if not n:CanDrag()then return end local r,s=q-p,g.OnUpdate s(r)
end,function(q)o=h.Position end,function(q)local r=UDim2.new(o.X.Scale,o.X.
Offset+q.X,o.Y.Scale,o.Y.Offset+q.Y)g:SetPosition(r)end,function(q,r)ae:Tween{
Object=h,EndProperties={Position=r}}end self:CheckConfig(g,{Enabled=true,
OnUpdate=t,SetPosition=u,DragBegin=s})self:ConnectDrag(i,{DragStart=q,
DragMovement=r,OnDragStateChange=m})local v=g.Enabled n:SetEnabled(v)return n
end function aa:MakeResizable(g)aa:CheckConfig(g,{MinimumSize=Vector2.new(160,90
),MaximumSize=Vector2.new(math.huge,math.huge)})local h,i,m,n,o=g.MaximumSize,g.
MinimumSize,g.Resize,(g.OnUpdate)local p=aa:InsertPrefab('ResizeGrab',{Parent=m}
)local q,r,s=function(q)p.Visible=q.Enabled end,function(q)local r=o+q local s=
UDim2.fromOffset(math.clamp(r.X,i.X,h.X),math.clamp(r.Y,i.Y,h.Y))if n then n(s)
return end ae:Tween{Object=m,EndProperties={Size=s}}end,function(q)o=m.
AbsoluteSize end local t=self:MakeDraggable{Grab=p,OnUpdate=r,DragBegin=s,
StateChanged=q}t.Grab=p return t end function aa:IsMouseEvent(g,h)local i=g.
UserInputType.Name if h and i:find'Movement'then return end return i:find'Touch'
or i:find'Mouse'end function aa:DetectHover(g,h)local i=h or{}i.Hovering=false
local m,n,o,p,q,r=i.OnInput,i.OnHoverChange,i.Anykey,i.MouseMove,i.MouseEnter,i.
MouseOnly local s=function(s,t,u)if s and r then if not aa:IsMouseEvent(s,true)
then return end end if t~=nil then local v=i.Hovering i.Hovering=t if t~=v and n
then n(t)end end if not q and u then return end if m then local v=i.Hovering m(v
,s)return end end local t={g.MouseEnter:Connect(function()s(nil,true,true)end),g
.MouseLeave:Connect(function()s(nil,false,true)end)}if o or r then table.insert(
t,b.InputBegan:Connect(function(u)s(u)end))end if p then local u=g.MouseMoved:
Connect(function()s()end)table.insert(t,u)end function i:Disconnect()for u,v in
next,t do v:Disconnect()end end return i end function aa:StackWindows()local g,h
=self.Windows,20 for i,m in next,g do local n,o=m.WindowFrame,UDim2.fromOffset(h
*i,h*i)m:Center()n.Position+=o end end function aa:GetElementFlags(g)local h=
self._FlagCache return h[g]end function aa:UpdateColors(g)local h,i,m,n,o,p,q=g.
Object,g.Tag,g.NoAnimation,g.TagsList,g.Theme,g.Tweeninfo,self.ElementColors
local r,s,t=self:GetElementFlags(h),self.Debug,q[i]if typeof(t)=='string'then t=
q[t]end if typeof(i)=='table'then t=i elseif n then n[h]=i end if not t then
return end local u={}for v,x in next,t do local y=self:GetThemeKey(o,x)if r and
r[v]then continue end if not y then if s then self:Warn(`Color: '{x}' does not exist!`
)end continue end u[v]=y end ae:Tween{Tweeninfo=p,Object=h,NoAnimation=m,
EndProperties=u}end function aa:MultiUpdateColors(g)local h=g.Objects for i,m in
next,h do self:UpdateColors{TagsList=g.TagsList,Theme=g.Theme,NoAnimation=not g.
Animate,Tweeninfo=g.Tweeninfo,Object=i,Tag=m}end end function aa:ApplyStyle(g,h)
local i=self.Styles local m=i[h]if not m then return end self:ApplyFlags{Object=
g,Class=m}end function aa:ClassIgnores(g)local h=self.ClassIgnored local i=table
.find(h,g)return i and true or false end function aa:MergeMetatables(g,h)local i
,m=self.Debug,{}m.__index=function(n,o)local p,q=self:ClassIgnores(o),g[o]if q~=
nil and not p then return q end local r,s=pcall(function()local r=h[o]return
self:PatchSelf(h,r)end)return r and s or nil end m.__newindex=function(n,o,p)
local q,r=self:ClassIgnores(o),typeof(p)=='function'local s=g[o]~=nil or r if s
and not q then g[o]=p return end xpcall(function()h[o]=p end,function(t)if i
then self:Warn(`Newindex Error: {h}.{o} = {p}\n{t}`)end g[o]=p end)end return
setmetatable({},m)end function aa:Concat(g,h)local i=''for m,n in next,g do i..=
tostring(n)..(m~=#g and h or'')end return i end function aa:GetValueFromAliases(
g,h)for i,m in g do local n=h[m]if n~=nil then return n end end return nil end
function aa:RecursiveCall(g,h)for i,m in next,g:GetDescendants()do h(m)end end
function aa:ApplyFlags(g)local h,i,m,n=self.ElementFlags,g.Object,g.Class,g.
WindowClass function g:GetThemeKey(o)if n then return n:GetThemeKey(o)else
return aa:GetThemeKey(nil,o)end end self:SetProperties(i,m)for o,p in next,h do
local q,r,s,t=p.Properties,p.Callback,p.Recursive,p.WindowProperties local u=
self:GetValueFromAliases(q,m)if n and t and u==nil then u=self:
GetValueFromAliases(t,n)end if u==nil then continue end r(g,i,u)if s then self:
RecursiveCall(i,function(v)r(g,v,u)end)end end end function aa:SetProperties(g,h
)return ad:SetProperties(g,h)end function aa:InsertPrefab(g,h)local i=self.
Prefabs local m=i.Prefabs local n=ad:NewReference(m:WaitForChild(g):Clone())if h
then local o=h.UsePropertiesList if not o then self:SetProperties(n,h)else self:
ApplyFlags{Object=n,Class=h}end end return n end function aa:GetContentSize(g,h)
local i,m,n,o=g:FindFirstChildOfClass'UIListLayout',g:FindFirstChildOfClass
'UIPadding',(g:FindFirstChildOfClass'UIStroke')if i and not h then o=i.
AbsoluteContentSize else o=g.AbsoluteSize end if m then local p,q,r,s=m.
PaddingTop.Offset,m.PaddingBottom.Offset,m.PaddingLeft.Offset,m.PaddingRight.
Offset o+=Vector2.new(r+s,p+q)end if n then local p=n.Thickness o+=Vector2.new(p
/2,p/2)end return o end function aa:PatchSelf(g,h,...)if typeof(h)~='function'
then return h,...end return function(i,...)return h(g,...)end end function aa:
MakeCanvas(g)local h,i,m,n,o,p,q=self.Elements,self.Debug,g.Element,g.
WindowClass,g.Class,g.OnChildChange,af:NewSignal()if p then q:Connect(p)end if
not n and i then self:Warn(`No WindowClass for {m}`)self:Warn(g)end local r=ad:
NewClass(h,{Class=o,RawObject=m,WindowClass=n or false,OnChildChange=q,Elements=
{}})local s={__index=function(s,t)local u=r[t]if u~=nil then return self:
PatchSelf(r,u)end local v=o[t]if v~=nil then return self:PatchSelf(o,v)end local
x=m[t]return self:PatchSelf(m,x)end,__newindex=function(s,t,u)local v=o[t]~=nil
if v then o[t]=u else m[t]=u end end}return setmetatable({},s)end function aa:
GetIniData(g)local h,i=self.IniToSave,{}for m,n in next,h do i[n]=g[n]end return
i end function aa:DumpIni(g)local h,i=self.IniSettings,{}for m,n in next,h do i[
m]=self:GetIniData(n)end if g then return aj:JSONEncode(i)end return i end
function aa:LoadIniIntoElement(g,h)local i={Value=function(i)g:SetValue(i)end}
for m,n in next,h do local o=i[m]if o then o(n)continue end g[m]=n end end
function aa:LoadIni(g,h)local i=self.IniSettings assert(g,
'No Ini configuration was passed')if h then g=aj:JSONDecode(g)end for m,n in
next,g do local o=i[m]self:LoadIniIntoElement(o,n)end end function aa:AddIniFlag
(g,h)local i=self.IniSettings i[g]=h end function aa:OnElementCreate(g)local h,i
,m,n,o=self._FlagCache,g.Flags,g.Object,g.Canvas,g.Class local p,q,r,s,t,u=n.
WindowClass,i.NoAutoTag,i.NoAutoFlags,i.ColorTag,i.NoStyle,i.IniFlag h[m]=i if u
then self:AddIniFlag(u,o)end if t then return end if not q and p then p:
TagElements{[m]=s}end if p then p:LoadStylesIntoElement(g)end if not r then self
:ApplyFlags{Object=m,Class=i,WindowClass=p}end end function aa:VisualError(g,h,i
)local m=self.Initialised and g.Error if not m then self:Error('Class:',i)return
end g:Error{Parent=h,Text=i}end function aa:WrapGeneration(g,h)local i,m,n=self.
_ErrorCache,h.Base,h.IgnoreDefaults return function(o,p,...)p=p or{}self:
CheckConfig(p,m)local q=p.CloneTable if q then p=table.clone(p)end local r,s,t=o
.RawObject,o.Elements,o.OnChildChange self:CheckConfig(p,{Parent=r,Name=p.
ColorTag},nil,n)if o==self then o=self.Elements end local u,v,x=pcall(g,o,p,...)
if u==false then if r then if i[r]then return end i[r]=v end self:VisualError(o,
r,v)self:Error('Class:',v)self:Error(debug.traceback())end if x==nil then x=v
end if t then t:Fire(v)end if x then if s then table.insert(s,x)end self:
OnElementCreate{Object=x,Flags=p,Class=v,Canvas=o}end return v,x end end
function aa:DefineElement(g,h)local i,m,n=self.Elements,self.ThemeConfigs,self.
ElementColors local o,p,q,r,s,t=m.DarkTheme,h.Base,h.Create,h.Export,h.ThemeTags
,h.ColorData self:CheckConfig(p,{ColorTag=g,ElementStyle=g})if s then Merge(o,s)
end if t then Merge(n,t)end local u=self:WrapGeneration(q,h)if r then self[g]=u
end i[g]=u return u end function aa:DefineGlobalFlag(g)local h=self.ElementFlags
table.insert(h,g)end function aa:DefineTheme(g,h)local i=self.ThemeConfigs self:
CheckConfig(h,{BaseTheme=i.DarkTheme})local m=GetAndRemove('BaseTheme',h)local n
={BaseTheme=m,Values=h}i[g]=n return n end function aa:GetMouseLocation()local g
=self.Mouse return g.X,g.Y end function aa:SetWindowFocusesEnabled(g)self.
WindowFocusesEnabled=g end function aa:UpdateWindowFocuses()local g,h=self.
Windows,self.WindowFocusesEnabled if not h then return end for i,m in g do local
n=m.HoverConnection if not n then continue end local o=n.Hovering if o then self
:SetFocusedWindow(m)return end end self:SetFocusedWindow(nil)end function aa:
WindowCanFocus(g)if g.NoSelect then return false end if g.Collapsed then return
false end if g._SelectDisabled then return false end return true end function aa
:GetFocusedWindow()return self.FocusedWindow end function aa:BringWindowToFront(
g)local h,i=self.Windows,g.NoBringToFrontOnFocus if i then return end
MoveTableItem(h,g,1)end function aa:SetFocusedWindow(g)local h,i=self:
GetFocusedWindow(),self.Windows if h==g then return end self.FocusedWindow=g if
g then local m=self:WindowCanFocus(g)if not m then return end self:
BringWindowToFront(g)end local m=#i for n,o in i do local p,q=self:
WindowCanFocus(o),o.WindowFrame if not p then continue end m-=1 if m then q.
ZIndex=m end local r=o==g o:SetFocused(r,m)end end function aa:SetItemTooltip(g,
h)local i,m,n=self.Elements,self.TooltipsContainer,self.ActiveTooltips local o,p
=m:Canvas{Visible=false,UiPadding=UDim.new()}task.spawn(h,o)aa:DetectHover(g,{
MouseMove=true,MouseEnter=true,OnHoverChange=function(q)if q then table.insert(n
,o)return end local r=table.find(n,o)table.remove(n,r)end,OnInput=function(q,r)p
.Visible=q end})end function aa:CheckFlags(g,h)for i,m in next,g do local n=h[i]
if not n then continue end m(n)end end function aa:GetThemeKey(g,h)local i=self.
ThemeConfigs if typeof(g)=='string'then g=i[g]end local m=i.DarkTheme g=g or m
local n,o=g.BaseTheme,g.Values local p=o[h]if p then return p end if n then
return self:GetThemeKey(n,h)end return end function aa:SelectionGroup(g)local h,
i,m=false,function(h,i)for m,n in next,g do if typeof(n)=='Instance'then
continue end if n==i then continue end h(n)end end local n=function(n)if h then
return end h=true local o=m m=n:GetValue()if not o then o=m end i(function(p)p:
SetValue(o)end,n)h=false end i(function(o)o.Callback=n end)end local g=aa.
Elements g.__index=g function g:GetObject()return self.RawObject end function g:
ApplyFlags(h,i)local m=self.WindowClass aa:ApplyFlags{WindowClass=m,Object=h,
Class=i}end function g:Remove()local h,i,m=self.OnChildChange,self:GetObject(),
self.Class local n=m.Remove if n then return n(m)end if h then h:Fire(m or self)
end if m then table.clear(m)end i:Destroy()table.clear(self)end function g:
GetChildElements()local h=self.Elements return h end function g:
ClearChildElements()local h=self:GetChildElements()for i,m in next,h do m:
Destroy()end end function g:TagElements(h)local i,m=self.WindowClass,aa.Debug if
not i then if m then aa:Warn('No WindowClass for TagElements:',h)end return end
i:TagElements(h)end function g:GetThemeKey(h)local i=self.WindowClass if i then
return i:GetThemeKey(h)end return aa:GetThemeKey(nil,h)end function g:
SetColorTags(h,i)local m=self.WindowClass if not m then return end local n,o=m.
TagsList,m.Theme aa:MultiUpdateColors{Animate=i,Theme=o,TagsList=n,Objects=h}end
function g:SetElementFocused(h,i)local m,n,o,p=self.WindowClass,aa.
HasTouchScreen,i.Focused,i.Animation aa:SetAnimationsEnabled(not o)if not o and
p then p:Refresh()end if not m then return end if not n then return end local q=
m.ContentCanvas q.Interactable=not o end aa:DefineElement('Dropdown',{Base={
ColorTag='PopupCanvas',Disabled=false,AutoClose=true,OnSelected=f},Create=
function(h,i)i.Parent=aa.Container.Overlays local m,n,o,p,q=i.Selected,i.Items,i
.OnSelected,h:PopupCanvas(i)local r,s,t=aa:MergeMetatables(i,p),{},function(r)o(
r)end function i:ClearEntries()for u,v in s do v:Remove()end end function i:
SetItems(u,v)local x=u[1]self:ClearEntries()for y,z in u do local A,B=x and z or
y,y==v or z==v local C=p:Selectable{Text=tostring(A),Selected=B,ZIndex=6,
Callback=function()return t(A)end}table.insert(s,C)end end if n then i:SetItems(
n,m)end return r,q end})aa:DefineElement('OverlayScroll',{Base={ElementClass=
'OverlayScroll',Spacing=UDim.new(0,4)},Create=function(h,i)local m,n,o=h.
WindowClass,i.ElementClass,i.Spacing local p=aa:InsertPrefab(n,i)local q,r=p:
FindFirstChild'ContentFrame'or p,p:FindFirstChild('UIListLayout',true)r.Padding=
o local s=aa:MergeMetatables(h,i)local t=aa:MakeCanvas{Element=q,WindowClass=m,
Class=s}function i:GetCanvasSize()return q.AbsoluteCanvasSize end return t,p end
})aa:DefineElement('Overlay',{Base={ElementClass='Overlay'},Create=g.
OverlayScroll})aa:DefineElement('Image',{Base={Image='',Callback=f},Create=
function(h,i)local m=aa:InsertPrefab('Image',i)m.Activated:Connect(function(...)
local n=i.Callback return n(m,...)end)return m end})aa:DefineElement(
'VideoPlayer',{Base={Video='',Callback=f},Create=function(h,i)local m=i.Video i.
Video=ad:CheckAssetUrl(m)local n=aa:InsertPrefab('VideoPlayer',i)return n end})
aa:DefineElement('Button',{Base={Text='Button',DoubleClick=false,Callback=f},
Create=function(h,i)local m=aa:InsertPrefab('Button',i)local n,o=aa:
MergeMetatables(i,m),i.DoubleClick function i:SetDisabled(p)self.Disabled=p end
aa:ConnectMouseEvent(m,{DoubleClick=o,Callback=function(...)if i.Disabled then
return end local p=i.Callback return p(n,...)end})return n,m end})aa:
DefineElement('Selectable',{Base={Text='Selectable',Callback=f,Selected=false,
Disabled=false,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.AutomaticSize.Y,
TextXAlignment=Enum.TextXAlignment.Left,AnimationTags={Selected='Buttons',
Unselected='TransparentButtons'}},Create=function(h,i)local m,n,o,p=h.Class.
AfterClick,i.Selected,i.Disabled,aa:InsertPrefab('Button',i)local q=aa:
MergeMetatables(i,p)p.Activated:Connect(function(...)local r=i.Callback r(p,...)
if m then m(p,...)end end)function i:SetSelected(r)local s=self.AnimationTags
local t=r and s.Selected or s.Unselected self.Selected=r aa:SetAnimation(p,t)
return self end function i:SetDisabled(r)self.Disabled=r p.Interactable=not r
return self end i:SetSelected(n)i:SetDisabled(o)return q,p end})aa:
DefineElement('ImageButton',{Base={ElementStyle='Button',Callback=f},Create=g.
Image})aa:DefineElement('SmallButton',{Base={Text='Button',PaddingTop=UDim.new()
,PaddingBottom=UDim.new(),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),
ColorTag='Button',ElementStyle='Button',Callback=f},Create=g.Button})aa:
DefineElement('Keybind',{Base={Label='Keybind',ColorTag='Frame',Value=nil,
DeleteKey=Enum.KeyCode.Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=
false,Callback=f,OnKeybindSet=f,OnBlacklistedKeybindSet=f,KeyBlacklist={},
UiPadding=UDim.new(),AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.3,0,
0,19)},Create=function(h,i)local m,n,o,p,q=i.Value,i.Label,i.Disabled,i.
KeyBlacklist,aa:InsertPrefab('Button',i)local r,s,t,u=aa:MergeMetatables(i,q),h:
Label{Parent=q,Text=n,Position=UDim2.new(1,4,0.5),AnchorPoint=Vector2.new(0,0.5)
},function(r,...)return r(q,...)end,function(r)return table.find(p,r)end
function i:SetDisabled(v)self.Disabled=v q.Interactable=not v h:SetColorTags({[s
]=v and'LabelDisabled'or'Label'},true)return self end function i:SetValue(v)
local x,y=self.OnKeybindSet,self.DeleteKey if v==y then v=nil end self.Value=v q
.Text=v and v.Name or'Not set't(x,v)return self end function i:WaitForNewKey()
self._WaitingForNewKey=true q.Text='...'q.Interactable=false end local v=
function(v)local x,y=v.KeyCode,v.UserInputType if y~=Enum.UserInputType.Keyboard
then return y end return x end local x=function(x)local y,z,A=i.
OnBlacklistedKeybindSet,i.Value,v(x)if not b.WindowFocused then return end if u(
A)then t(y,A)return end q.Interactable=true i._WaitingForNewKey=false if A.Name
=='Unknown'then return i:SetValue(z)end i:SetValue(A)return end local y=function
(y,z)local A,B,C,D,E,F=i.IgnoreGameProcessed,i.DeleteKey,i.Enabled,i.Value,i.
Callback,v(y)if i._WaitingForNewKey then x(y)return end if not C and q.
Interactable then return end if not A and z then return end if not D then return
end if F==B then return end if F.Name~=D.Name then return end t(E,F)end i:
SetValue(m)i:SetDisabled(o)i.Connection=b.InputBegan:Connect(y)q.Activated:
Connect(function()i:WaitForNewKey()end)aa:SetAnimation(q,'Inputs')return r,q end
})aa:DefineElement('ArrowButton',{Base={Direction='Left',ColorTag='Button',Icon=
aa.Icons.Arrow,Size=UDim2.fromOffset(21,21),IconSize=UDim2.fromScale(1,1),
IconPadding=UDim.new(0,4),Rotations={Left=180,Right=0}},Create=function(h,i)
local m,n=i.Direction,i.Rotations local o=n[m]i.IconRotation=o local p=aa:
InsertPrefab('ArrowButton',i)p.Activated:Connect(function(...)local q=i.Callback
return q(p,...)end)return p end})aa:DefineElement('Label',{Base={Font=
'Inconsolata'},ColorData={LabelPadding={PaddingTop='LabelPaddingTop',
PaddingBottom='LabelPaddingBottom'}},Create=function(h,i)local m,n,o,p,q,r,s,t=i
.Bold,i.Italic,i.Font,i.FontFace,Enum.FontWeight.Medium,Enum.FontWeight.Bold,
Enum.FontStyle.Normal,Enum.FontStyle.Italic local u,v,x=m and r or q,n and t or
s,m or n if not p and x then i.FontFace=Font.fromName(o,u,v)end local y=aa:
InsertPrefab('Label',i)local z=y:FindFirstChildOfClass'UIPadding'h:TagElements{[
z]='LabelPadding'}return y end})aa:DefineElement('Error',{Base={RichText=true,
TextWrapped=true},ColorData={Error={TextColor3='ErrorText',FontFace='TextFont'}}
,Create=function(h,i)local m=i.Text i.Text=`<b>\u{26d4} Error:</b> {m}`return h:
Label(i)end})aa:DefineElement('CodeEditor',{Base={Editable=true,Fill=true,Text=
''},Create=function(h,i)local m,n=h.WindowClass,ab.CodeFrame.new(i)local o=n.Gui
i.Parent=h:GetObject()aa:ApplyFlags{Object=o,WindowClass=m,Class=i}return n,o
end})local h={Engaged=false}h.__index=h function h:SetEngaged(i)local m=self.
WindowClass self.Engaged=i if m then m:SetCanvasInteractable(not i)end end
function h:IsHovering()local i=false self:Foreach(function(m)i=m.Popup:
IsMouseHovering()return i end)return i end function h:Foreach(i)local m=self.
Menus for n,o in next,m do local p=i(o)if p then break end end end function h:
SetFocusedMenu(i)self:Foreach(function(m)local n=m==i m:SetActiveState(n)end)end
function h:Close()self:SetEngaged(false)self:SetFocusedMenu(nil)end function h:
MenuItem(i)local m,n=self.Canvas,self.Menus local o=m:MenuButton(i)local p=m:
PopupCanvas{RelativeTo=o,MaxSizeX=210,Visible=false,AutoClose=false,AfterClick=
function()self:Close()end}local q={Popup=p,Button=o}aa:DetectHover(o,{MouseEnter
=true,OnInput=function()if not self.Engaged then return end self:SetFocusedMenu(
q)end})function q:SetActiveState(r)p:SetPopupVisible(r)o:SetSelected(r)end o.
Activated:Connect(function()self:SetFocusedMenu(q)self:SetEngaged(true)end)table
.insert(n,q)return p,q end aa:DefineElement('MenuBar',{Base={},Create=function(i
,m)local n,o=i.WindowClass,aa:InsertPrefab('MenuBar',m)local p=aa:MakeCanvas{
Element=o,WindowClass=n,Class=m}local q=ad:NewClass(h,{WindowClass=n,Canvas=p,
Object=o,Menus={}})Merge(q,m)aa:DetectHover(o,{MouseOnly=true,OnInput=function()
if not q.Engaged then return end if q:IsHovering()then return end q:Close()end})
local r=aa:MergeMetatables(q,p)return r,o end})aa:DefineElement('MenuButton',{
Base={Text='MenuButton',PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
Size=UDim2.fromOffset(0,19),AutomaticSize=Enum.AutomaticSize.XY},Create=g.
Selectable})local i={ColorTags={BGSelected={[true]='SelectedTab',[false]=
'DeselectedTab'},LabelSelected={[true]='SelectedTabLabel',[false]=
'DeselectedTabLabel'}}}function i:SetButtonSelected(m,n)if m.IsSelected==n then
return end m.IsSelected=n local o,p,q=self.NoAnimation,self.WindowClass,self.
ColorTags local r,s,t,u,v=p.Theme,p.TagsList,q.BGSelected,q.LabelSelected,m.
TabButton local x=v.Button local y=x.Label aa:MultiUpdateColors{Animate=not o,
Theme=r,TagsList=s,Objects={[x]=t[n],[y]=u[n]}}end function i:CompareTabs(m,n)if
not m then return false end return m.MatchBy==n or m==n end function i:
ForEachTab(m,n)local o,p=typeof(m)=='string',self.Tabs for q,r in p do local s,t
=r.Name,false if o then t=s==m else t=self:CompareTabs(r,m)end n(r,t,q)end end
function i:RemoveTab(m)local n,o=self.OnTabRemove,self.Tabs self:ForEachTab(m,
function(p,q,r)if not q then return end local s,t=p.TabButton,p.OnClosure table.
remove(o,r)s:Destroy()n(self,p)t(p)end)return self end function i:CreateTab(m)m=
m or{}aa:CheckConfig(m,{Name='Tab',AutoSize='Y',Focused=false,OnClosure=f})local
n,o,p,q,r,s,t,u,v=self.AutoSelectNewTabs,self.WindowClass,self.ParentCanvas,self
.Tabs,self.TabsFrame,self.OnTabCreate,m.Focused,m.Name,m.Icon local x,y=t or#q<=
0 and n,aa:InsertPrefab('TabButton',m)y.Parent=r local z=y.Button local A,B=z:
FindFirstChildOfClass'UIPadding',z.Label B.Text=tostring(u)Merge(m,{TabButton=y}
)local C,D=function()self:SetActiveTab(m)end,{Closeable=function()local C=p:
RadioButton{Parent=z,Visible=not self.NoClose,Icon=aa.Icons.Close,IconSize=UDim2
.fromOffset(11,11),LayoutOrder=3,ZIndex=2,UsePropertiesList=true,Callback=
function()self:RemoveTab(m)end}local D=C.Icon aa:SetAnimation(D,{Connections={
MouseEnter={ImageTransparency=0},MouseLeave={ImageTransparency=1}},Init=
'MouseLeave'},y)end}z.Activated:Connect(C)aa:CheckFlags(D,m)table.insert(q,m)if
o then o:TagElements{[A]='TabPadding'}end aa:SetAnimation(z,'Buttons')self:
SetButtonSelected(m,x)p:ApplyFlags(y,m)local E=s(self,m)if x then self:
SetActiveTab(m)end return E or m end function i:SetActiveTab(m)local n,o,p,q,r=
self.Tabs,self.NoAnimation,self.ActiveTab,self.OnActiveTabChange,typeof(m)==
'string'self:ForEachTab(m,function(s,t,u)if t then MatchedTab=s end self:
SetButtonSelected(s,t)end)if not MatchedTab then return self end if self:
CompareTabs(MatchedTab,p)then return self end self.ActiveTab=MatchedTab q(self,
MatchedTab,p)return self end aa:DefineElement('TabBar',{Base={AutoSelectNewTabs=
true,OnActiveTabChange=f,OnTabCreate=f,OnTabRemove=f},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabsBarSeparator={
BackgroundColor3='TabBgActive'},TabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabPagePadding={PaddingBottom=
'TabPagePadding',PaddingLeft='TabPagePadding',PaddingRight='TabPagePadding',
PaddingTop='TabPagePadding'}},Create=function(m,n)local o,p,q=m.WindowClass,aa:
InsertPrefab('TabsBar',n),ad:NewClass(i)local r,s=p.Separator,p.TabsFrame local
t=aa:MakeCanvas{Element=s,WindowClass=o,Class=q}Merge(q,n)Merge(q,{ParentCanvas=
m,Object=p,TabsFrame=s,WindowClass=o,Tabs={}})m:TagElements{[p]='TabsBar',[r]=
'TabsBarSeparator'}local u=aa:MergeMetatables(t,p)return u,p end})aa:
DefineElement('TabSelector',{Base={NoTabsBar=false,OnActiveTabChange=f,
OnTabCreate=f,OnTabRemove=f},Create=function(m,n)local o,p,q,r=m.WindowClass,n.
NoTabsBar,n.NoAnimation,aa:InsertPrefab('TabSelector',n)local s=r.Body local t=s
.PageTemplate t.Visible=false local u,v=function(u,v,...)local x,y,z=v.AutoSize,
v.Name,t:Clone()local A=ad:GetChildOfClass(z,'UIPadding')aa:SetProperties(z,{
Parent=s,Name=y,AutomaticSize=Enum.AutomaticSize[x],Size=UDim2.fromScale(x=='Y'
and 1 or 0,x=='X'and 1 or 0)})m:TagElements{[A]='TabPagePadding'}local B=aa:
MakeCanvas{Element=z,WindowClass=o,Class=v}n.OnTabCreate(u,v,...)Merge(v,{Page=z
,MatchBy=B})return B end,function(u,v,...)u:ForEachTab(v,function(x,y,z)local A=
x.Page A.Visible=y if not y then return end local B=m:GetThemeKey
'AnimationTweenInfo'ae:Tween{Object=A,Tweeninfo=B,NoAnimation=q,StartProperties=
{Position=UDim2.fromOffset(0,4)},EndProperties={Position=UDim2.fromOffset(0,0)}}
end)n.OnActiveTabChange(u,v,...)end local x=m:TabBar{Parent=r,Visible=not p,
OnTabCreate=u,OnActiveTabChange=v,OnTabRemove=function(x,y,...)y.Page:Remove()n.
OnTabRemove(...)end}local y=aa:MergeMetatables(x,r)return y,r end})aa:
DefineElement('RadioButton',{Base={Callback=f},Create=function(m,n)local o=aa:
InsertPrefab('RadioButton',n)o.Activated:Connect(function(...)local p=n.Callback
return p(o,...)end)return o end})aa:DefineElement('Checkbox',{Base={Label=
'Checkbox',IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.
fromScale(1,1),UntickedImageSize=UDim2.fromScale(0,0),Callback=f,Disabled=false}
,Create=function(m,n)local o,p,q,r,s,t,u=n.IsRadio,n.Value,n.Label,n.
TickedImageSize,n.UntickedImageSize,n.Disabled,aa:InsertPrefab('CheckBox',n)
local v,x=aa:MergeMetatables(n,u),u.Tickbox local y=x.Tick y.Image=aa.Icons.
Checkmark local z,A,B,C=x:FindFirstChildOfClass'UIPadding',ad:GetChildOfClass(x,
'UICorner'),m:Label{Text=q,Parent=u,LayoutOrder=2},UDim.new(0,3)if o then y.
ImageTransparency=1 y.BackgroundTransparency=0 A.CornerRadius=UDim.new(1,0)else
C=UDim.new(0,2)end aa:SetProperties(z,{PaddingBottom=C,PaddingLeft=C,
PaddingRight=C,PaddingTop=C})local D,E=function(...)local D=n.Callback return D(
v,...)end,function(D,E)local F,G=m:GetThemeKey'AnimationTweenInfo',D and r or s
ae:Tween{Object=y,Tweeninfo=F,NoAnimation=E,EndProperties={Size=G}}end function
n:SetDisabled(F)self.Disabled=F u.Interactable=not F m:SetColorTags({[B]=F and
'LabelDisabled'or'Label'},true)return self end function n:SetValue(F,G)self.
Value=F E(F,G)D(F)return self end function n:SetTicked(...)aa:Warn
'Checkbox:SetTicked is deprecated, please use :SetValue'return self:SetValue(...
)end function n:Toggle()local F=not self.Value self.Value=F self:SetValue(F)
return self end local F=function()n:Toggle()end u.Activated:Connect(F)x.
Activated:Connect(F)n:SetValue(p,true)n:SetDisabled(t)aa:SetAnimation(x,
'Buttons',u)m:TagElements{[y]='CheckMark',[x]='Checkbox'}return v,u end})aa:
DefineElement('Radiobox',{Base={IsRadio=true,CornerRadius=UDim.new(1,0)},Create=
g.Checkbox})aa:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label=
'Histogram'},Create=function(m,n)local o,p,q=n.Label,n.Points,aa:InsertPrefab(
'Histogram',n)local r,s=aa:MergeMetatables(n,q),q.Canvas local t=s.PointTemplate
t.Visible=false m:Label{Text=o,Parent=q,Position=UDim2.new(1,4)}local u aa:
SetItemTooltip(q,function(v)u=v:Label()end)Merge(n,{_Plots={},_Cache={}})
function n:GetBaseValues()local v,x=self.Minimum,self.Maximum if v and x then
return v,x end local y=self._Plots for z,A in y do local B=A.Value if not v or B
<v then v=B end if not x or B>x then x=B end end return v,x end function n:
UpdateGraph()local v,x,y=self._Plots,self:GetBaseValues()if not x or not y then
return end local z=y-x for A,B in v do local C,D=B.Point,B.Value local E=(D-x)/z
E=math.clamp(E,0.05,1)C.Size=UDim2.fromScale(1,E)end return self end function n:
Plot(v)local x,y,z=self._Plots,{},t:Clone()local A=z.Bar aa:SetProperties(z,{
Parent=s,Visible=true})local B,C=aa:DetectHover(z,{MouseEnter=true,OnInput=
function()y:UpdateTooltip()end}),{Object=z,Point=A,Value=v}function y:
UpdateTooltip()local D=y:GetPointIndex()u.Text=`{D}:\t{C.Value}`end function y:
SetValue(D)C.Value=D n:UpdateGraph()if B.Hovering then self:UpdateTooltip()end
end function y:GetPointIndex()return table.find(x,C)end function y:Remove(D)
table.remove(x,self:GetPointIndex())z:Remove()n:UpdateGraph()end table.insert(x,
C)self:UpdateGraph()aa:SetAnimation(A,'Plots',z)m:TagElements{[A]='Plot'}return
y end function n:PlotGraph(v)local x=self._Cache local y=#x-#v if y>=1 then for
z=1,y do local A=table.remove(x,z)if A then A:Remove()end end end for z,A in v
do local B=x[z]if B then B:SetValue(A)continue end x[z]=self:Plot(A)end return
self end if p then n:PlotGraph(p)end return r,q end})aa:DefineElement('Viewport'
,{Base={IsRadio=true},Create=function(m,n)local o,p,q=n.Model,n.Camera,aa:
InsertPrefab('Viewport',n)local r,s=aa:MergeMetatables(n,q),q.Viewport local t=s
.WorldModel if not p then p=aa:CreateInstance('Camera',s)p.CFrame=CFrame.new(0,0
,0)end Merge(n,{Camera=p,WorldModel=t,Viewport=s})function n:SetCamera(u)self.
Camera=u s.CurrentCamera=u return self end function n:SetModel(u,v)local x=self.
Clone t:ClearAllChildren()if x then u=u:Clone()end if v then u:PivotTo(v)end u.
Parent=t self.Model=u return u end if o then n:SetModel(o)end n:SetCamera(p)
return r,q end})aa:DefineElement('InputText',{Base={Value='',Placeholder='',
Label='Input text',Callback=f,MultiLine=false,NoAutoTag=true,Disabled=false},
Create=function(m,n)local o,p,q,r,s,t=n.MultiLine,n.Placeholder,n.Label,n.
Disabled,n.Value,aa:InsertPrefab('InputBox',n)local u=t.Frame local v,x=u.Input,
aa:MergeMetatables(n,t)m:Label{Parent=t,Text=q,AutomaticSize=Enum.AutomaticSize.
X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=2}aa:
SetProperties(v,{PlaceholderText=p,MultiLine=o})local y=function(...)local y=n.
Callback y(x,...)end function n:SetValue(z)v.Text=tostring(z)self.Value=z return
self end function n:SetDisabled(z)self.Disabled=z t.Interactable=not z m:
SetColorTags({[q]=z and'LabelDisabled'or'Label'},true)return self end function n
:Clear()v.Text=''return self end local z=function()local z=v.Text n.Value=z y(z)
end v:GetPropertyChangedSignal'Text':Connect(z)n:SetDisabled(r)n:SetValue(s)m:
TagElements{[v]='Frame'}return x,t end})aa:DefineElement('InputInt',{Base={Value
=0,Increment=1,Placeholder='',Label='Input Int',Callback=f},Create=function(m,n)
local o,p,q,r,s,t=n.Value,n.Placeholder,n.Label,n.Disabled,n.NoButtons,aa:
InsertPrefab('InputBox',n)local u,v=aa:MergeMetatables(n,t),t.Frame local x=v.
Input x.PlaceholderText=p local y,z,A,B=m:Button{Text='-',Parent=v,LayoutOrder=2
,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),Visible=not s,Callback=function()n:Decrease()end},m:
Button{Text='+',Parent=v,LayoutOrder=3,Ratio=1,AutomaticSize=Enum.AutomaticSize.
None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not s,
Callback=function()n:Increase()end},m:Label{Parent=t,Text=q,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=
4},function(...)local y=n.Callback y(u,...)end function n:Increase()local C,D=
self.Value,self.Increment n:SetValue(C+D)end function n:Decrease()local C,D=self
.Value,self.Increment n:SetValue(C-D)end function n:SetDisabled(C)self.Disabled=
C t.Interactable=not C m:SetColorTags({[A]=C and'LabelDisabled'or'Label'},true)
return self end function n:SetValue(C)local D,E,F=self.Value,self.Minimum,self.
Maximum C=tonumber(C)if not C then C=D end if E and F then C=math.clamp(C,E,F)
end x.Text=C n.Value=C B(C)return self end local C=function()local C=x.Text n:
SetValue(C)end n:SetValue(o)n:SetDisabled(r)x.FocusLost:Connect(C)m:TagElements{
[z]='Button',[y]='Button',[x]='Frame'}return u,t end})aa:DefineElement(
'InputTextMultiline',{Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,
ColorTag='Frame'},Create=function(m,n)return m:Console(n)end})aa:DefineElement(
'Console',{Base={Enabled=true,Value='',TextWrapped=false,Border=true,MaxLines=
300,LinesFormat='%s',Callback=f},Create=function(m,n)local o,p,q,r,s=n.ReadOnly,
n.LineNumbers,n.Value,n.Placeholder,aa:InsertPrefab('Console',n)local t,u,v=aa:
MergeMetatables(n,s),s.Source,s.Lines v.Visible=p function n:CountLines(x)local
y=u.Text:split'\n'local z=#y if z==1 and y[1]==''then return 0 end return z end
function n:UpdateLineNumbers()local x,y=self.LineNumbers,self.LinesFormat if not
x then return end local z=self:CountLines()v.Text=''for A=1,z do local B,C=y:
format(A),A~=z and'\n'or''v.Text..=`{B}{C}`end local A=v.AbsoluteSize.X u.Size=
UDim2.new(1,-A,0,0)return self end function n:CheckLineCount()local x=n.MaxLines
if not x then return end local y=u.Text local z=y:split'\n'if#z>x then local A=`{
z[1]}\\n`local B=y:sub(#A)self:SetValue(B)end return self end function n:
UpdateScroll()local x=s.AbsoluteCanvasSize s.CanvasPosition=Vector2.new(0,x.Y)
return self end function n:SetValue(x)if not self.Enabled then return end u.Text
=tostring(x)self:Update()return self end function n:GetValue()return u.Text end
function n:Clear()u.Text=''self:Update()return self end function n:AppendText(
...)local x,y=self:CountLines(true),aa:Concat({...},' ')if x==0 then return self
:SetValue(y)end local z=self:GetValue()local A=`{z}\n{y}`self:SetValue(A)return
self end function n:Update()local x=self.AutoScroll self:CheckLineCount()self:
UpdateLineNumbers()if x then self:UpdateScroll()end end local x=function()local
x=n:GetValue()n:Update()n:Callback(x)end n:SetValue(q)aa:SetProperties(u,n)aa:
SetProperties(u,{TextEditable=not o,Parent=s,PlaceholderText=r})m:TagElements{[u
]='ConsoleText',[v]='ConsoleLineNumbers'}u:GetPropertyChangedSignal'Text':
Connect(x)return t,s end})aa:DefineElement('Table',{Base={VerticalAlignment=Enum
.VerticalAlignment.Top,RowBackground=false,RowBgTransparency=0.87,Border=false,
Spacing=UDim.new(0,4)},Create=function(m,n)local o,p,q,r,s,t,u,v=m.WindowClass,n
.RowBgTransparency,n.RowBackground,n.Border,n.VerticalAlignment,n.MaxColumns,n.
Spacing,aa:InsertPrefab('Table',n)local x,y,z,A,B=aa:MergeMetatables(n,v),v.
RowTemp,0,{},r and q function n:Row(C)C=C or{}local D,E,F,G=C.IsHeader,0,{},y:
Clone()aa:SetProperties(G,{Name='Row',Visible=true,Parent=v})local H=G:
FindFirstChildOfClass'UIListLayout'aa:SetProperties(H,{VerticalAlignment=s,
Padding=not B and u or UDim.new(0,1)})if D then m:TagElements{[G]='Header'}else
z+=1 end if q and not D then local I=z%2~=1 and p or 1 G.BackgroundTransparency=
I end local I={}local J=aa:MergeMetatables(I,G)function I:Column(K)K=K or{}aa:
CheckConfig(K,{HorizontalAlign=Enum.HorizontalAlignment.Left,VerticalAlignment=
Enum.VerticalAlignment.Top})local L=G.ColumnTemp:Clone()local M=L:
FindFirstChildOfClass'UIListLayout'aa:SetProperties(M,K)local N=L:
FindFirstChildOfClass'UIStroke'N.Enabled=r local O=L:FindFirstChildOfClass
'UIPadding'if not B then O:Destroy()end aa:SetProperties(L,{Parent=G,Visible=
true,Name='Column'})return aa:MakeCanvas{Element=L,WindowClass=o,Class=J}end
function I:NextColumn()E+=1 local K=E%t+1 local L=F[K]if not L then L=self:
Column()F[K]=L end return L end table.insert(A,I)return J end function n:NextRow
()return self:Row()end function n:HeaderRow()return self:Row{IsHeader=true}end
function n:ClearRows()z=0 for C,D in next,v:GetChildren()do if not D:IsA'Frame'
then continue end if D==y then continue end D:Destroy()end return n end return x
,v end})aa:DefineElement('List',{Base={Spacing=4,HorizontalFlex=Enum.
UIFlexAlignment.None,VerticalFlex=Enum.UIFlexAlignment.None,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,
FillDirection=Enum.FillDirection.Horizontal},Create=function(m,n)local o,p,q,r,s
,t,u,v=m.WindowClass,n.Spacing,n.HorizontalFlex,n.VerticalFlex,n.
HorizontalAlignment,n.VerticalAlignment,n.FillDirection,aa:InsertPrefab('List',n
)local x,y=aa:MergeMetatables(n,v),v.UIListLayout aa:SetProperties(y,{Padding=
UDim.new(0,p),HorizontalFlex=q,VerticalFlex=r,HorizontalAlignment=s,
VerticalAlignment=t,FillDirection=u})local z=aa:MakeCanvas{Element=v,WindowClass
=o,Class=x}return z,v end})aa:DefineElement('CollapsingHeader',{Base={Title=
'Collapsing Header',CollapseIcon=aa.Icons.Arrow,Collapsed=true,Offset=0,
NoAutoTag=true,NoAutoFlags=true,IconPadding=UDim.new(0,4),Activated=f},Create=
function(m,n)local o,p,q,r,s,t,u,v,x,y,z,A=n.Title,n.Collapsed,n.ElementStyle,n.
Offset,n.TitleBarProperties,n.OpenOnDoubleClick,n.OpenOnArrow,n.CollapseIcon,n.
IconPadding,n.Icon,n.NoArrow,aa:InsertPrefab('CollapsingHeader',n)local B=A.
TitleBar local C,D=B.Collapse,B.Icon m:ApplyFlags(D,{Image=y})local E,F=C.
CollapseIcon,C.UIPadding ad:SetPadding(F,x)m:ApplyFlags(E,{Image=v})local G,H,I=
m:Label{ColorTag='CollapsingHeader',Parent=B,LayoutOrder=2},m:Indent{Class=n,
Parent=A,Offset=r,LayoutOrder=2,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.None,PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,1)}local J=
function()local J=n.Activated J(H)end function n:Remove()A:Destroy()table.clear(
self)end function n:SetArrowVisible(K)E.Visible=K end function n:SetTitle(K)G.
Text=K end function n:SetVisible(K)A.Visible=K end function n:SetIcon(K)local L=
K and K~=''D.Visible=L if L then D.Image=ad:CheckAssetUrl(K)end end function n:
SetCollapsed(K)self.Collapsed=K local L,M,N=aa:GetContentSize(I),H:GetThemeKey
'AnimationTweenInfo',UDim2.fromScale(1,0)local O=N+UDim2.fromOffset(0,L.Y)ae:
HeaderCollapse{Tweeninfo=M,Collapsed=K,Toggle=E,Resize=I,Hide=I,ClosedSize=N,
OpenSize=O}return self end local K=function()n:SetCollapsed(not n.Collapsed)end
if s then H:ApplyFlags(B,s)end if not u then aa:ConnectMouseEvent(B,{DoubleClick
=t,Callback=K})end E.Activated:Connect(K)B.Activated:Connect(J)n:SetCollapsed(p)
n:SetTitle(o)n:SetArrowVisible(not z)aa:ApplyStyle(B,q)H:TagElements{[B]=
'CollapsingHeader'}return H,A end})aa:DefineElement('TreeNode',{Base={Offset=21,
IconPadding=UDim.new(0,2),TitleBarProperties={Size=UDim2.new(1,0,0,13)}},Create=
g.CollapsingHeader})aa:DefineElement('Separator',{Base={NoAutoTag=true,
NoAutoTheme=true},Create=function(m,n)local o,p=n.Text,aa:InsertPrefab(
'SeparatorText',n)m:Label{Text=tostring(o),Visible=o~=nil,Parent=p,LayoutOrder=2
,Size=UDim2.new(),PaddingLeft=UDim.new(0,4),PaddingRight=UDim.new(0,4)}m:
TagElements{[p.Left]='Separator',[p.Right]='Separator'}return p end})aa:
DefineElement('Canvas',{Base={},Create=function(m,n)local o,p,q=m.WindowClass,n.
Scroll,n.Class or n local r=p and'ScrollingCanvas'or'Canvas'local s=aa:
InsertPrefab(r,n)local t=aa:MakeCanvas{Element=s,WindowClass=o,Class=q}return t,
s end})aa:DefineElement('ScrollingCanvas',{Base={Scroll=true},Create=g.Canvas})
aa:DefineElement('Region',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y
},Create=function(m,n)local o,p=m.WindowClass,n.Scroll local q=p and
'ScrollingCanvas'or'Canvas'local r=aa:InsertPrefab(q,n)local s=aa:MakeCanvas{
Element=r,WindowClass=o,Class=n}return s,r end})aa:DefineElement('Group',{Base={
Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(m,n)local o,p=m
.WindowClass,aa:InsertPrefab('Group',n)local q=aa:MakeCanvas{Element=p,
WindowClass=o,Class=n}return q,p end})aa:DefineElement('Indent',{Base={Offset=15
,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),PaddingRight=UDim.new()},Create=
function(m,n)local o=n.Offset n.PaddingLeft=UDim.new(0,o)return m:Canvas(n)end})
aa:DefineElement('BulletText',{Base={},Create=function(m,n)local o=n.Rows for p,
q in next,o do local r=m:Bullet(n)r:Label{Text=tostring(q),LayoutOrder=2,Size=
UDim2.fromOffset(0,14)}end end})aa:DefineElement('Bullet',{Base={Padding=3,Icon=
aa.Icons.Dot,IconSize=UDim2.fromOffset(5,5)},Create=function(m,n)local o,p,q=m.
WindowClass,n.Padding,aa:InsertPrefab('Bullet',n)local r,s=aa:MakeCanvas{Element
=q,WindowClass=o,Class=m},q.UIListLayout s.Padding=UDim.new(0,p)return r,q end})
aa:DefineElement('Row',{Base={Spacing=4,Expanded=false,HorizontalFlex=Enum.
UIFlexAlignment.None,VerticalFlex=Enum.UIFlexAlignment.None},Create=function(m,n
)local o,p,q,r,s,t=m.WindowClass,n.Spacing,n.Expanded,n.HorizontalFlex,n.
VerticalFlex,aa:InsertPrefab('Row',n)local u,v=aa:MergeMetatables(n,t),t:
FindFirstChildOfClass'UIListLayout'v.Padding=UDim.new(0,p)v.HorizontalFlex=r v.
VerticalFlex=s local x=aa:MakeCanvas{Element=t,WindowClass=o,Class=u}function n:
Expand()v.HorizontalFlex=Enum.UIFlexAlignment.Fill return self end if q then n:
Expand()end return x,t end})aa:DefineElement('SliderBase',{Base={Format='%.f',
Label='',Type='Slider',Callback=f,NoGrab=false,NoClick=false,Minimum=0,Maximum=
100,ColorTag='Frame',Disabled=false},Create=function(m,n)local o,p,q,r,s,t,u,v,x
=n.Value or n.Minimum,n.Format,n.Label,n.NoAnimation,n.NoGrab,n.NoClick,n.Type,n
.Disabled,aa:InsertPrefab'Slider'local y=x.Track local z,A,B=y.Grab,y.ValueText,
aa:MergeMetatables(n,x)local C,D,E=z.AbsoluteSize,aa:SetAnimation(x,'Inputs'),m:
Label{Parent=x,Text=q,Position=UDim2.new(1,4),Size=UDim2.fromScale(0,1)}Merge(n,
{Grab=z,Name=q})if u=='Slider'then y.Position=UDim2.fromOffset(C.X/2,0)y.Size=
UDim2.new(1,-C.X,1,0)end local F,G={Slider=function(F)return{AnchorPoint=Vector2
.new(0.5,0.5),Position=UDim2.fromScale(F,0.5)}end,Progress=function(F)return{
Size=UDim2.fromScale(F,1)}end,Snap=function(F,G,H,I)local J=(math.round(G)-H)/I
return{Size=UDim2.fromScale(1/I,1),Position=UDim2.fromScale(J,0.5)}end},function
(...)local F=n.Callback return F(B,...)end function n:SetDisabled(H)self.
Disabled=H x.Interactable=not H m:SetColorTags({[E]=H and'LabelDisabled'or
'Label'},true)return self end function n:SetValueText(H)A.Text=tostring(H)end
function n:SetValue(H,I)local J,K,L,M=m:GetThemeKey'AnimationTweenInfo',n.
Minimum,n.Maximum,H local N=L-K if not I then M=(H-K)/N else H=K+(N*M)end M=math
.clamp(M,0,1)local O=F[u](M,H,K,L)ae:Tween{Object=z,Tweeninfo=J,NoAnimation=r,
EndProperties=O}self.Value=H self:SetValueText(p:format(H,L))G(H)return self end
local H,I=function(H)m:SetColorTags({[x]=H and'FrameActive'or'Frame'},true)m:
SetElementFocused(x,{Focused=H,Animation=D})end,function()if n.Disabled then
return end if n.ReadOnly then return end return true end local J=function(J)if
not I()then return end local K,L,M=y.AbsolutePosition.X,y.AbsoluteSize.X,J.X
local N=M-K local O=math.clamp(N/L,0,1)n:SetValue(O,true)end local K,L=function(
...)if not I()then return end H(true)if not t then J(...)end end,function()H(
false)end z.Visible=not s n:SetValue(o)n:SetDisabled(v)m:TagElements{[A]='Label'
,[z]='SliderGrab'}aa:ConnectDrag(y,{DragStart=K,DragMovement=J,DragEnd=L})return
B,x end})aa:DefineElement('SliderEnum',{Base={Items={},Label='Slider Enum',Type=
'Snap',Minimum=1,Maximum=10,Value=1,Callback=f,ColorTag='Frame'},Create=function
(m,n)local o,p=n.Callback,n.Value local q=function(q,r)r=math.round(r)local s=q.
Items q.Maximum=#s return s[r]end n.Callback=function(r,s)local t=q(r,s)r:
SetValueText(t)n.Value=t return o(r,t)end q(n,p)return m:SliderBase(n)end})aa:
DefineElement('SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create=g.
SliderBase})aa:DefineElement('SliderFloat',{Base={Label='Slider Float',Format=
'%.3f',ColorTag='Frame'},Create=g.SliderBase})aa:DefineElement('DragInt',{Base={
Format='%.f',Label='Drag Int',Callback=f,Minimum=0,Maximum=100,ColorTag='Frame',
Disabled=false},Create=function(m,n)local o,p,q,r,s=n.Value or n.Minimum,n.
Format,n.Label,n.Disabled,aa:InsertPrefab'Slider'local t,u=aa:MergeMetatables(n,
s),s.Track local v,x=u.ValueText,u.Grab x.Visible=false local y,z,A,B,C,D=m:
Label{Parent=s,Text=q,Position=UDim2.new(1,7),Size=UDim2.fromScale(0,1)},0,0,aa:
SetAnimation(s,'Inputs'),function(...)local y=n.Callback return y(t,...)end
function n:SetValue(E,F)local G,H=self.Minimum,self.Maximum local I=H-G if not F
then z=((E-G)/I)*100 else E=G+(I*(z/100))end E=math.clamp(E,G,H)self.Value=E v.
Text=p:format(E,H)C(E)return self end function n:SetDisabled(E)self.Disabled=E m
:SetColorTags({[y]=E and'LabelDisabled'or'Label'},true)return self end local E,F
=function(E)m:SetColorTags({[s]=E and'FrameActive'or'Frame'},true)m:
SetElementFocused(s,{Focused=E,Animation=B})end,function()if n.Disabled then
return end if n.ReadOnly then return end return true end local G,H,I=function(G)
if not F()then return end E(true)D=G A=z end,function(G)if not F()then return
end local H=G.X-D.X local I=A+(H/2)z=math.clamp(I,0,100)n:SetValue(z,true)end,
function()E(false)end n:SetValue(o)n:SetDisabled(r)aa:ConnectDrag(u,{DragStart=G
,DragEnd=I,DragMovement=H})m:TagElements{[v]='Label'}return t,s end})aa:
DefineElement('DragFloat',{Base={Format='%.3f',Label='Drag Float',ColorTag=
'Frame'},Create=g.DragInt})aa:DefineElement('MultiElement',{Base={Callback=f,
Label='',Disabled=false,BaseInputConfig={},InputConfigs={},Value={},Minimum={},
Maximum={},MultiCallback=f},Create=function(m,n)local o,p,q,r,s,t,u,v=n.Label,n.
BaseInputConfig,n.InputConfigs,n.InputType,n.Disabled,n.Value,n.Minimum,n.
Maximum assert(r,'No input type provided for MultiElement')local x,y=m:Row{
Spacing=4}local z,A,B,C,D=x:Row{Size=UDim2.fromScale(0.65,0),Expanded=true},x:
Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=o},aa:MergeMetatables(n,x)
,{},false local E=function()local E={}for F,G in C do E[F]=G:GetValue()end n.
Value=E return E end local function F(...)local G=n.MultiCallback G(B,...)end
local G=function()if#C~=#q then return end if not D then return end local G=E()
F(G)end function n:SetDisabled(H)self.Disabled=H m:SetColorTags({[A]=H and
'LabelDisabled'or'Label'},true)for I,J in C do J:SetDisabled(H)end end function
n:SetValue(H)D=false for I,J in H do local K=C[I]assert(K,`No input object for index: {
I}`)K:SetValue(J)end D=true F(H)end p=Copy(p,{Size=UDim2.new(1,0,0,19),Label='',
Callback=G})for H,I in q do local J=Copy(p,I)aa:CheckConfig(J,{Minimum=u[H],
Maximum=v[H]})local K=z[r](z,J)table.insert(C,K)end Merge(n,{Row=z,Inputs=C})D=
true n:SetDisabled(s)n:SetValue(t)return B,y end})local m=function(m,n,o,p)aa:
DefineElement(m,{Base={Label=m,Callback=f,InputType=n,InputConfigs=table.create(
o,{}),BaseInputConfig={}},Create=function(q,r)local s=(r.BaseInputConfig)if p
then Merge(s,p)end aa:CheckConfig(s,{ReadOnly=r.ReadOnly,Format=r.Format})r.
MultiCallback=function(...)local t=r.Callback t(...)end return q:MultiElement(r)
end})end local n=function(n,o)aa:DefineElement(n,{Base={Label=n,Callback=f,Value
=aa.Accent.Light,Disabled=false,Minimum={0,0,0},Maximum={255,255,255,100},
BaseInputConfig={},InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]
={Format='B: %.f'}}},Create=function(p,q)local r,s=q.Value,Copy(q,{Value={1,1,1}
,Callback=function(r,...)if q.ValueChanged then q:ValueChanged(...)end end})
local t,u=p[o](p,s)local v,x=aa:MergeMetatables(q,t),t.Row local y,z=x:Button{
BackgroundTransparency=0,Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=
1,ColorTag='',ElementStyle=''},function(...)local y=q.Callback return y(v,...)
end local A=function(A)y.BackgroundColor3=A z(A)end function q:ValueChanged(B)
local C,D,E=B[1],B[2],B[3]local F=Color3.fromRGB(C,D,E)self.Value=F A(F)end
function q:SetValue(B)self.Value=B A(B)t:SetValue{math.round(B.R*255),math.
round(B.G*255),math.round(B.B*255)}end q:SetValue(r)return v,u end})end local o=
function(o,p)aa:DefineElement(o,{Base={Label=o,Callback=f,Disabled=false,Value=
CFrame.new(10,10,10),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),
BaseInputConfig={},InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]
={Format='Z: %.f'}}},Create=function(q,r)local s,t,u=r.Value,r.Maximum,r.Minimum
local v=Copy(r,{Maximum={t.X,t.Y,t.Z},Minimum={u.X,u.Y,u.Z},Value={s.X,s.Y,s.Z},
Callback=function(v,...)if r.ValueChanged then r:ValueChanged(...)end end})local
x,y=q[p](q,v)local z=aa:MergeMetatables(r,x)local A=function(...)local A=r.
Callback return A(z,...)end function r:ValueChanged(B)local C,D,E=B[1],B[2],B[3]
local F=CFrame.new(C,D,E)self.Value=F A(F)end function r:SetValue(B)self.Value=B
x:SetValue{math.round(B.X),math.round(B.Y),math.round(B.Z)}end r:SetValue(s)
return z,y end})end aa:DefineElement('SliderProgress',{Base={Label=
'Slider Progress',Type='Progress',ColorTag='Frame'},Create=g.SliderBase})aa:
DefineElement('ProgressBar',{Base={Label='Progress Bar',Type='Progress',ReadOnly
=true,MinValue=0,MaxValue=100,Format='% i%%',Interactable=false,ColorTag='Frame'
},Create=function(p,q)function q:SetPercentage(r)q:SetValue(r)end local r,s=p:
SliderBase(q)local t=r.Grab p:TagElements{[t]={BackgroundColor3='ProgressBar'}}
return r,s end})aa:DefineElement('Combo',{Base={Value='',Placeholder='',Callback
=f,Items={},Disabled=false,WidthFitPreview=false,Label='Combo'},Create=function(
p,q)local r,s,t,u,v,x,y=q.Placeholder,q.NoAnimation,q.Selected,q.Label,q.
Disabled,q.WidthFitPreview,aa:InsertPrefab('Combo',q)local z,A,B=aa:
MergeMetatables(q,y),(y.Combo)local C,D,E=p:Label{Text=tostring(r),Parent=A,Name
='ValueText'},p:ArrowButton{Parent=A,Interactable=false,Size=UDim2.fromOffset(19
,19),LayoutOrder=2},p:Label{Text=u,Parent=y,LayoutOrder=2}if x then aa:
SetProperties(y,{AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.new(0,0,0,0)})aa
:SetProperties(A,{AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.fromScale(0,1)}
)end local F,G=function(F,...)q:SetOpen(false)return q.Callback(z,F,...)end,
function(F,G)local H=p:GetThemeKey'AnimationTweenInfo'y.Interactable=not F ae:
HeaderCollapseToggle{Tweeninfo=H,NoAnimation=G,Collapsed=not F,Toggle=D.Icon}end
local function H()local I,J=q.GetItems,q.Items if I then return I()end return J
end function q:SetValueText(I)C.Text=tostring(I)end function q:ClosePopup()if
not B then return end B:ClosePopup(true)end function q:SetDisabled(I)self.
Disabled=I y.Interactable=not I p:SetColorTags({[E]=I and'LabelDisabled'or
'Label'},true)return self end function q:SetValue(I)local J=H()local K=J[I]local
L=K or I self.Selected=I self.Value=L self:ClosePopup()if typeof(I)=='number'
then self:SetValueText(L)else self:SetValueText(I)end F(I,L)return self end
function q:SetOpen(I)local J=self.Selected self.Open=I G(I,s)if not I then self:
ClosePopup()return end B=p:Dropdown{RelativeTo=A,Items=H(),Selected=J,OnSelected
=function(...)q:SetValue(...)end,OnClosed=function()self:SetOpen(false)end}
return self end local I=function()local I=q.Open q:SetOpen(not I)end A.Activated
:Connect(I)G(false,true)q:SetDisabled(v)if t then q:SetValue(t)end aa:
SetAnimation(A,'Inputs')p:TagElements{[A]='Frame'}return z,y end})local p={
TileBarConfig={Close={Image=aa.Icons.Close,IconPadding=UDim.new(0,3)},Collapse={
Image=aa.Icons.Arrow,IconPadding=UDim.new(0,3)}},CloseCallback=f,Collapsible=
true,Open=true,Focused=false}function p:Tween(q)aa:CheckConfig(q,{Tweeninfo=self
:GetThemeKey'AnimationTweenInfo'})return ae:Tween(q)end function p:TagElements(q
)local r,s=self.TagsList,self.Theme aa:MultiUpdateColors{Theme=s,TagsList=r,
Objects=q}end function p:MakeTitleBarCanvas()local q=self.TitleBar local r=aa:
MakeCanvas{WindowClass=self,Element=q}self.TitleBarCanvas=r return r end
function p:AddDefaultTitleButtons()local q=self.TileBarConfig local r,s,t=q.
Collapse,q.Close,self.TitleBarCanvas if not t then t=self:MakeTitleBarCanvas()
end aa:CheckConfig(self,{Toggle=t:RadioButton{Icon=r.Image,IconPadding=r.
IconPadding,LayoutOrder=1,Ratio=1,Size=UDim2.new(0,0),Callback=function()self:
ToggleCollapsed()end},CloseButton=t:RadioButton{Icon=s.Image,IconPadding=s.
IconPadding,LayoutOrder=3,Ratio=1,Size=UDim2.new(0,0),Callback=function()self:
SetVisible(false)end},TitleLabel=t:Label{ColorTag='Title',LayoutOrder=2,Size=
UDim2.new(1,0),Active=false,Fill=true,ClipsDescendants=true,AutomaticSize=Enum.
AutomaticSize.XY}})self:TagElements{[self.TitleLabel]='WindowTitle'}end function
p:Close()local q=self.CloseCallback if q then local r=q(self)if r==false then
return end end self:Remove()end function p:SetVisible(q)local r,s=self.
WindowFrame,self.NoFocusOnAppearing self.Visible=q r.Visible=q if q and not s
then aa:SetFocusedWindow(self)end return self end function p:ToggleVisibility(q)
local r=self.Visible self:SetVisible(not r)end function p:GetWindowSize()return
self.WindowFrame.AbsoluteSize end function p:GetTitleBarSizeY()local q=self.
TitleBar return q.Visible and q.AbsoluteSize.Y or 0 end function p:SetTitle(q)
self.TitleLabel.Text=tostring(q)return self end function p:SetPosition(q)self.
WindowFrame.Position=q return self end function p:SetSize(q,r)local s=self.
WindowFrame if typeof(q)=='Vector2'then q=UDim2.fromOffset(q.X,q.Y)end s.Size=q
self.Size=q return self end function p:SetCanvasInteractable(q)local r=self.Body
r.Interactable=q end function p:Center()local q=self:GetWindowSize()/2 local r=
UDim2.new(0.5,-q.X,0.5,-q.Y)self:SetPosition(r)return self end function p:
LoadStylesIntoElement(q)local r,s,t=q.Flags,q.Object,q.Canvas local u={
FrameRounding=function()if r.CornerRadius then return end if not t then return
end local u=s:FindFirstChild('FrameRounding',true)if not u then return end t:
TagElements{[u]='FrameRounding'}end}for v,x in u do local y=self:GetThemeKey(v)
if y==nil then continue end task.spawn(x,y)end end function p:SetTheme(q)local r
,s,t=aa.ThemeConfigs,self.TagsList,self.WindowState q=q or self.Theme assert(r[q
],`{q} is not a valid theme!`)self.Theme=q aa:MultiUpdateColors{Animate=false,
Theme=q,Objects=s}self:SetFocusedColors(t)return self end function p:
SetFocusedColors(q)local r,s,t,u,v=self.WindowFrame,self.TitleBar,self.Theme,
self.TitleLabel,self:GetThemeKey'AnimationTweenInfo'local x=r:
FindFirstChildOfClass'UIStroke'local y={Focused={[x]='BorderActive',[s]=
'TitleBarBgActive',[u]={TextColor3='TitleActive'}},UnFocused={[x]='Border',[s]=
'TitleBarBg',[u]={TextColor3='Title'}},Collapsed={[x]='Border',[s]=
'TitleBarBgCollapsed',[u]={TextColor3='Title'}}}aa:MultiUpdateColors{Tweeninfo=v
,Animate=true,Objects=y[q],Theme=t}end function p:SetFocused(q)q=q==nil and true
or q local r,s=self.Collapsed,self.WindowState if q then aa:SetFocusedWindow(
self)end local t=r and'Collapsed'or q and'Focused'or'UnFocused'if t==s then
return end self.Focused=q self.WindowState=t self:SetFocusedColors(t)end
function p:GetThemeKey(q)return aa:GetThemeKey(self.Theme,q)end function p:
SetCollapsible(q)self.Collapsible=q return self end function p:ToggleCollapsed(q
)local r,s=self.Collapsed,self.Collapsible if not q and not s then return self
end self:SetCollapsed(not r)return self end function p:SetCollapsed(q,r)local s,
t,u,v,x,y,z,A,B=self.WindowFrame,self.Body,self.Toggle,self.ResizeGrab,self.Size
,self.AutoSize,self:GetThemeKey'AnimationTweenInfo',self:GetWindowSize(),self:
GetTitleBarSizeY()local C,D=u.Icon,UDim2.fromOffset(A.X,B)self.Collapsed=q self:
SetCollapsible(false)self:SetFocused(not q)ae:HeaderCollapse{Tweeninfo=z,
NoAnimation=r,Collapsed=q,Toggle=C,Resize=s,NoAutomaticSize=not y,Hide=t,
ClosedSize=D,OpenSize=x,Completed=function()self:SetCollapsible(true)end}self:
Tween{Object=v,NoAnimation=r,EndProperties={TextTransparency=q and 1 or 0.6,
Interactable=not q}}return self end function p:UpdateConfig(q)local r={
NoTitleBar=function(r)local s=self.TitleBar s.Visible=not r end,NoClose=function
(r)local s=self.CloseButton s.Visible=not r end,NoCollapse=function(r)local s=
self.Toggle s.Visible=not r end,NoTabsBar=function(r)local s=self.
WindowTabSelector if not s then return end local t=s.TabsBar t.Visible=not r end
,NoScrollBar=function(r)local s,t,u,v=r and 0 or 9,self.NoScroll,self.
WindowTabSelector,self.ContentCanvas if u then u.Body.ScrollBarThickness=s end
if not t then v.ScrollBarThickness=s end end,NoScrolling=function(r)local s,t,u=
self.NoScroll,self.WindowTabSelector,self.ContentCanvas if t then t.Body.
ScrollingEnabled=not r end if not s then u.ScrollingEnabled=not r end end,NoMove
=function(r)local s=self.DragConnection s:SetEnabled(not r)end,NoResize=function
(r)local s=self.ResizeConnection s:SetEnabled(not r)end,NoBackground=function(r)
local s,t=self:GetThemeKey'WindowBgTransparency',self.CanvasFrame t.
BackgroundTransparency=r and 1 or s end}Merge(self,q)for s,t in q do local u=r[s
]if u then u(t)end end return self end function p:Remove()local q,r,s=self.
WindowFrame,self.WindowClass,aa.Windows local t=table.find(s,r)if t then table.
remove(s,t)end q:Destroy()end function p:MenuBar(q,...)local r,s=self.
ContentCanvas,self.ContentFrame q=q or{}Merge(q,{Parent=s,Layout=-1})return r:
MenuBar(q,...)end aa:DefineElement('Window',{Export=true,Base={Theme='DarkTheme'
,NoSelect=false,NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize
=false,MinimumSize=Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,
NoWindowRegistor=false,NoBringToFrontOnFocus=false,IsDragging=false},Create=
function(q,r)aa:CheckImportState()local s,t=aa.Windows,aa.Container.Windows aa:
CheckConfig(r,{Parent=t,Title=aa.DefaultTitle})local u,v,x,y,z,A,B,C,D,E,F=r.
NoDefaultTitleBarButtons,r.Collapsed,r.MinimumSize,r.Title,r.NoTabs,r.NoScroll,r
.Theme,r.AutomaticSize,r.NoWindowRegistor,r.AutoSelectNewTabs,r.Parent~=t local
G={Scroll=not A,Fill=not C and true or nil,UiPadding=UDim.new(0,z and 8 or 0),
AutoSelectNewTabs=E}if C then Merge(G,{AutomaticSize=C,Size=UDim2.new(1,0)})end
local H=aa:InsertPrefab('Window',r)local I=H.Content local J,K=I.TitleBar,ad:
NewClass(p)local L,M,N,O=(aa:MakeCanvas{Element=I,WindowClass=K,Class=K})local P
,Q=L:Canvas(Copy(G,{Parent=I,CornerRadius=UDim.new(0,0)}))local R=aa:
MakeResizable{MinimumSize=x,Resize=H,OnUpdate=function(R)K:SetSize(R,true)end}
Merge(K,r)Merge(K,{WindowFrame=H,ContentFrame=I,CanvasFrame=Q,ResizeGrab=R.Grab,
TitleBar=J,Elements=g,TagsList={},_SelectDisabled=F,ResizeConnection=R,
HoverConnection=aa:DetectHover(I),DragConnection=aa:MakeDraggable{Grab=I,Move=H,
SetPosition=function(S,T)local U=M:GetThemeKey'AnimationTweenInfo'ae:Tween{
Tweeninfo=U,Object=S.Move,EndProperties={Position=T}}end,OnDragStateChange=
function(S)K.IsDragging=S Q.Interactable=not S if S then aa:SetFocusedWindow(O)
end aa:SetWindowFocusesEnabled(not S)end}})if z then M,N=P,Q else M,N=P:
TabSelector(G)K.WindowTabSelector=M end O=aa:MergeMetatables(K,M)Merge(K,{
ContentCanvas=M,WindowClass=O,Body=N})aa:ConnectMouseEvent(I,{DoubleClick=true,
OnlyMouseHovering=J,Callback=function(...)if not K.OpenOnDoubleClick then return
end if K.NoCollapse then return end K:ToggleCollapsed()end})if not u then K:
AddDefaultTitleButtons()end K:SetTitle(y)K:SetCollapsed(v,true)K:SetTheme(B)K:
UpdateConfig(r)K:SetFocused()if not D then table.insert(s,O)end local S=R.Grab
aa:SetAnimation(S,'TextButtons')aa:SetFocusedWindow(O)O:TagElements{[S]=
'ResizeGrab',[J]='TitleBar',[Q]='Window'}return O,H end})aa:DefineElement(
'TabsWindow',{Export=true,Base={NoTabs=false,AutoSelectNewTabs=true},Create=
function(q,r)return q:Window(r)end})aa:DefineElement('PopupCanvas',{Base={
AutoClose=false,Scroll=false,Visible=true,Spacing=UDim.new(0,1),AutomaticSize=
Enum.AutomaticSize.XY,MaxSizeY=150,MinSizeX=100,MaxSizeX=math.huge,OnClosed=f},
Create=function(q,r)local s,t,u,v,x,y,z=r.RelativeTo,r.MaxSizeY,r.MinSizeX,r.
MaxSizeX,r.Visible,r.AutoClose,r.NoAnimation r.Parent=aa.Container.Overlays
local A,B=q:OverlayScroll(r)local C=B.UIStroke local D,E,F,G,H,I,J=C.Thickness,B
.Parent.AbsolutePosition,(aa:DetectHover(B,{MouseOnly=true,OnInput=function(D,E)
if D then return end if not B.Visible then return end r:OnFocusLost()end}))
function r:FetchScales()local K=A:GetCanvasSize()G=s.AbsolutePosition H=s.
AbsoluteSize I=math.clamp(K.Y,H.Y,t)J=math.clamp(H.X,u,v)end function r:
UpdatePosition()B.Position=UDim2.fromOffset(G.X-E.X+D,G.Y-E.Y+H.Y)end function r
:GetScale(K)local L,M=UDim2.fromOffset(J,I),UDim2.fromOffset(J,0)return K and L
or M end function r:IsMouseHovering()return F.Hovering end function r:
OnFocusLost()local K=self.OnClosed self:SetPopupVisible(false)K(self)if y then
self:ClosePopup()end end function r:ClosePopup(K)self:SetPopupVisible(false,z,K)
F:Disconnect()B:Remove()end function r:SetPopupVisible(K,L)if B.Visible==K then
return end s.Interactable=not K self:UpdateScales(K,z,L)self.Visible=K end
function r:UpdateScales(K,L,M)local N=A:GetThemeKey'AnimationTweenInfo'K=K==nil
and B.Visible or K r:FetchScales()r:UpdatePosition()local O=ae:Tween{Tweeninfo=N
,Object=B,NoAnimation=L,EndProperties={Size=r:GetScale(K),Visible=K}}if O and M
then O.Completed:Wait()end end r:UpdateScales(false,true)r:SetPopupVisible(x)A.
OnChildChange:Connect(r.UpdateScales)return A,B end})aa:DefineElement(
'PopupModal',{Export=true,Base={NoAnimation=false,NoCollapse=true,NoClose=true,
NoResize=true,NoSelect=true,NoAutoFlags=true,NoWindowRegistor=true,NoScroll=true
},Create=function(q,r)local s,t,u=q.WindowClass,(r.NoAnimation)r.Parent=aa.
Container.Overlays if s then u=s:GetThemeKey'ModalWindowDimTweenInfo'r.Theme=s.
Theme end local v=aa:InsertPrefab('ModalEffect',r)local x=q:Window(Copy(r,{
NoAutoFlags=false,Parent=v,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(372,38),AutomaticSize=Enum.
AutomaticSize.Y}))function r:ClosePopup()ae:Tween{Object=v,Tweeninfo=u,
NoAnimation=t,EndProperties={BackgroundTransparency=1},Completed=function()v:
Destroy()end}x:Close()end ae:Tween{Object=v,Tweeninfo=u,NoAnimation=t,
StartProperties={BackgroundTransparency=1},EndProperties={BackgroundTransparency
=0.8}}q:TagElements{[v]='ModalWindowDim'}local y=aa:MergeMetatables(r,x)return y
,v end})m('InputInt2','InputInt',2,{NoButtons=true})m('InputInt3','InputInt',3,{
NoButtons=true})m('InputInt4','InputInt',4,{NoButtons=true})m('SliderInt2',
'SliderInt',2)m('SliderInt3','SliderInt',3)m('SliderInt4','SliderInt',4)m(
'SliderFloat2','SliderFloat',2)m('SliderFloat3','SliderFloat',3)m('SliderFloat4'
,'SliderFloat',4)m('DragInt2','DragInt',2)m('DragInt3','DragInt',3)m('DragInt4',
'DragInt',4)m('DragFloat2','DragFloat',2)m('DragFloat3','DragFloat',3)m(
'DragFloat4','DragFloat',4)n('InputColor3','InputInt3')n('SliderColor3',
'SliderInt3')n('DragColor3','DragInt3')o('InputCFrame','InputInt3')o(
'SliderCFrame','SliderInt3')o('DragCFrame','DragInt3')return aa end function __DIST.a():typeof(__modImpl())local v=__DIST.cache.a if not v then v={c=__modImpl()}__DIST.cache.a=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function(aliases)
    for _, alias in ipairs(aliases) do
        local index = getfenv(0)
    
        for segment in string.gmatch(alias, "[^%.]+") do
            index = index and index[segment]
            if index == nil then break end
        end
    
        if not index then
            return false, alias 
        end
    end

    return true
end end function __DIST.b():typeof(__modImpl())local v=__DIST.cache.b if not v then v={c=__modImpl()}__DIST.cache.b=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not cache or not cache.invalidate  then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
    local badgeService = game:GetService("BadgeService")

    if badgeService ~= game:GetService("BadgeService") then
        return {
            status = 500,
            message = "Did a cosmic ray just hit your computer? This should never evaluate"
        }
    end

    cache.invalidate(badgeService)

    if badgeService == game:GetService("BadgeService") then
        return {
            status = 500,
            message = "Reference to service object retained"
        }
    elseif typeof(badgeService) ~= "Instance" then
        return {
            status = 500,
            message = "Reference type wasn't retained"
        }
    end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.c():typeof(__modImpl())local v=__DIST.cache.c if not v then v={c=__modImpl()}__DIST.cache.c=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not cache or not cache.iscached then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not cache.invalidate then
		return {
			status = 401,
			message = "Dependency 'cache.invalidate' missing",
		}
	end

	--// Functionality test
	local part = Instance.new("Part")

	if not cache.iscached(part) then
		return {
			status = 500,
			message = "Cached part assumed uncached"
		}
	end

	cache.invalidate(part)

	if cache.iscached(part) then
		return {
			status = 500,
			message = "Uncached part assumed cached"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.d():typeof(__modImpl())local v=__DIST.cache.d if not v then v={c=__modImpl()}__DIST.cache.d=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not cache or not cache.replace then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local inst1 = game:GetService("BadgeService")
	local inst2 = game:GetService("Stats")

	if inst1 == inst2 then
		return {
			status = 500,
			message = "Did a cosmic ray just hit your computer? This should never evaluate"
		}
	end

	cache.replace(inst1, inst2)

	if inst1 == inst2 then
		return {
			status = 500,
			message = "Reference is old reference"
		}
	elseif inst1 == game:GetService("Stats") then
		return {
			status = 500,
			message = "Reference is old references object"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.e():typeof(__modImpl())local v=__DIST.cache.e if not v then v={c=__modImpl()}__DIST.cache.e=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not islclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end
	local cClosure = print

	if not islclosure(luaClosure) then
		return {
			status = 500,
			message = "Failed to identify lua closure",
		}
	elseif islclosure(cClosure) then
		return {
			status = 500,
			message = "Identified C closure as lua closure",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.f():typeof(__modImpl())local v=__DIST.cache.f if not v then v={c=__modImpl()}__DIST.cache.f=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not iscclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end
	local cClosure1 = print
	local cClosure2 = newcclosure(function()
		return 1
	end)

	if iscclosure(luaClosure) then
		return {
			status = 500,
			message = "Lua closure identified as C closure",
		}
	elseif not iscclosure(cClosure1) then
		return {
			status = 500,
			message = "C closure not identified as C closure",
		}
	elseif not iscclosure(cClosure2) then
		return {
			status = 500,
			message = "C closure not identified as C closure",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.g():typeof(__modImpl())local v=__DIST.cache.g if not v then v={c=__modImpl()}__DIST.cache.g=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isexecutorclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end

	if not isexecutorclosure(isexecutorclosure)	then
		return {
			status = 500,
			message = "Failed to identify an executor closure",
		}
	elseif not isexecutorclosure(luaClosure) then
		return {
			status = 500,
			message = "Did not identify an lua closure as an executor closure",
		}
	elseif isexecutorclosure(print) then
		return {
			status = 500,
			message = "Identified a lua standard closure as an executor closure",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"checkclosure",
		"isourclosure"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.h():typeof(__modImpl())local v=__DIST.cache.h if not v then v={c=__modImpl()}__DIST.cache.h=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
    if not newcclosure then
		return {
			status = 400,
			message = "Global not found",
		}
    elseif not iscclosure then
        return {
            status = 500,
            message = "iscclosure required to test newcclosure",
        }
	end
        
    local originalFunction = function(...)
        return ...
    end
    local cFunction = newcclosure(originalFunction)

    if iscclosure(originalFunction) then
        return {
            status = 500,
            message = "iscclosure returned true a lua closure",
        }
    elseif not iscclosure(cFunction) then
        return {
            status = 500,
            message = "Returned false for a C closure",
        }
    elseif cFunction(1) ~= 1 then
        return {
            status = 500,
            message = "C closure did not return the expected value",
        }
    end

    --// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end end function __DIST.i():typeof(__modImpl())local v=__DIST.cache.i if not v then v={c=__modImpl()}__DIST.cache.i=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not clonefunction then
		return {
			status = 400,
			message = "Global not found",
		}
	end


	local function originalFunction()
		return 1
	end
	local clonedFunction = clonefunction(originalFunction)

	if clonedFunction == originalFunction then
		return {
			status = 500,
			message = "Cloned function is the same as the original",
		}
	elseif clonedFunction() ~= 1 then
		return {
			status = 500,
			message = "Cloned function behavior mismatch",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.j():typeof(__modImpl())local v=__DIST.cache.j if not v then v={c=__modImpl()}__DIST.cache.j=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not hookfunction then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function originalFunc1()
		return 1
	end

	local function1 = originalFunc1

	local function function2()
		return 2
	end

	if function1() ~= 1 then
		return {
			status = 500,
			message = "This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
		}
	end
	
	local original = hookfunction(function1, function2)

	if function1() ~= 2 then
		return {
			status = 500,
			message = "Hooked function did not return the expected value",
		}
	elseif original() ~= 1 then
		return {
			status = 500,
			message = "Old function did not return the expected value",
		}
	end

	hookfunction(function1, original)

	if function1() ~= 1 then
		return {
			status = 500,
			message = "Restored function did not return the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"hookfunc",
		"replaceclosure",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.k():typeof(__modImpl())local v=__DIST.cache.k if not v then v={c=__modImpl()}__DIST.cache.k=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not restorefunction then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not hookfunction then
		return {
			status = 401,
			message = "'hookfunction' needed to test this",
		}
	end

	local function originalFunc1()
		return 1
	end

	local function1 = originalFunc1

	local function function2()
		return 2
	end

	if function1() ~= 1 then
		return {
			status = 500,
			message = "This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
		}
	end
	
	local original = hookfunction(function1, function2)

	if function1() ~= 2 then
		return {
			status = 500,
			message = "Hooked function did not return the expected value",
		}
	elseif original() ~= 1 then
		return {
			status = 500,
			message = "Old function did not return the expected value",
		}
	end

	restorefunction(function1)

	if function1() ~= 1 then
		hookfunction(function1, original)
		return {
			status = 500,
			message = "Restored function did not return the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"restorefunc",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.l():typeof(__modImpl())local v=__DIST.cache.l if not v then v={c=__modImpl()}__DIST.cache.l=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getfunctionhash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function hexEncoded(hash)
		return #hash == 96 and hash:match("^[0-9a-fA-F]+$") ~= nil
	end
	
	local function1 = function() end
	local function2 = function(...) end
	local function3 = function() end
	local function4 = function() return 1 end
	local function5 = function() return 2 end
	local cHashSuccess = pcall(function()
		getfunctionhash(print)
	end)

	if not hexEncoded(getfunctionhash(function1)) then
		return {
			status = 500,
			message = "Hash is not hex encoded",
		}
	elseif getfunctionhash(function1) == getfunctionhash(function2) then
		return {
			status = 500,
			message = "Unequal functions returned equal hashes",
		}
	elseif getfunctionhash(function1) ~= getfunctionhash(function3) then
		return {
			status = 500,
			message = "Equal functions returned unequal hashes",
		}
	elseif getfunctionhash(function4) == getfunctionhash(function5) then
		return {
			status = 500,
			message = "Unequal returns gave equal returns",
		}
	elseif cHashSuccess then
		return {
			status = 500,
			message = "Passed when given a lua standard C closure",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.m():typeof(__modImpl())local v=__DIST.cache.m if not v then v={c=__modImpl()}__DIST.cache.m=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not checkcaller then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not hookmetamethod then
		return {
			status = 401,
			message = "Dependency 'hookmetamethod' missing",
		}
	end

	local callerFromThread = checkcaller()

	local fromHook
	local original
	original = hookmetamethod(game, "__namecall", function(...)
		if fromHook == nil then
			fromHook = checkcaller()
		end
		return original(...)
	end)

	tostring(game)

	task.wait(0.1)

	hookmetamethod(game, "__namecall", original)

	if callerFromThread ~= true then
		return {
			status = 500,
			message = "Returned false in executor thread",
		}
	elseif fromHook ~= false then
		return {
			status = 500,
			message = "Did not return false in a hook",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end end function __DIST.n():typeof(__modImpl())local v=__DIST.cache.n if not v then v={c=__modImpl()}__DIST.cache.n=v end return v.c end end do local function __modImpl()-- @original: https://gist.github.com/Reselim/40d62b17d138cc74335a1b0709e19ce2

local Alphabet = {}
local Indexes = {}
-- A-Z
for Index = 65, 90 do
	table.insert(Alphabet, Index)
end
-- a-z
for Index = 97, 122 do
	table.insert(Alphabet, Index)
end
-- 0-9
for Index = 48, 57 do
	table.insert(Alphabet, Index)
end
table.insert(Alphabet, 43) -- +
table.insert(Alphabet, 47) -- /
for Index, Character in ipairs(Alphabet) do
	Indexes[Character] = Index
end
local Base64 = {}
local bit32_rshift = bit32.rshift
local bit32_lshift = bit32.lshift
local bit32_band = bit32.band
--[[**
	Encodes a string in Base64.
	@param [t:string] Input The input string to encode.
	@returns [t:string] The string encoded in Base64.
**--]]
function Base64.Encode(Input)
	local Output = {}
	local Length = 0
	for Index = 1, #Input, 3 do
		local C1, C2, C3 = string.byte(Input, Index, Index + 2)
		local A = bit32_rshift(C1, 2)
		local B = bit32_lshift(bit32_band(C1, 3), 4) + bit32_rshift(C2 or 0, 4)
		local C = bit32_lshift(bit32_band(C2 or 0, 15), 2) + bit32_rshift(C3 or 0, 6)
		local D = bit32_band(C3 or 0, 63)
		Length = Length + 1
		Output[Length] = Alphabet[A + 1]
		Length = Length + 1
		Output[Length] = Alphabet[B + 1]
		Length = Length + 1
		Output[Length] = C2 and Alphabet[C + 1] or 61
		Length = Length + 1
		Output[Length] = C3 and Alphabet[D + 1] or 61
	end
	local NewOutput = {}
	local NewLength = 0
	local IndexAdd4096Sub1
	for Index = 1, Length, 4096 do
		NewLength = NewLength + 1
		IndexAdd4096Sub1 = Index + 4096 - 1
		NewOutput[NewLength] = string.char(table.unpack(
			Output,
			Index,
			IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1
		))
	end
	return table.concat(NewOutput)
end
--[[**
	Decodes a string from Base64.
	@param [t:string] Input The input string to decode.
	@returns [t:string] The newly decoded string.
**--]]
function Base64.Decode(Input)
	local Output = {}
	local Length = 0
	for Index = 1, #Input, 4 do
		local C1, C2, C3, C4 = string.byte(Input, Index, Index + 3)
		local I1 = Indexes[C1] - 1
		local I2 = Indexes[C2] - 1
		local I3 = (Indexes[C3] or 1) - 1
		local I4 = (Indexes[C4] or 1) - 1
		local A = bit32_lshift(I1, 2) + bit32_rshift(I2, 4)
		local B = bit32_lshift(bit32_band(I2, 15), 4) + bit32_rshift(I3, 2)
		local C = bit32_lshift(bit32_band(I3, 3), 6) + I4
		Length = Length + 1
		Output[Length] = A
		if C3 ~= 61 then
			Length = Length + 1
			Output[Length] = B
		end
		if C4 ~= 61 then
			Length = Length + 1
			Output[Length] = C
		end
	end
	local NewOutput = {}
	local NewLength = 0
	local IndexAdd4096Sub1
	for Index = 1, Length, 4096 do
		NewLength = NewLength + 1
		IndexAdd4096Sub1 = Index + 4096 - 1
		NewOutput[NewLength] = string.char(table.unpack(
			Output,
			Index,
			IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1
		))
	end
	return table.concat(NewOutput)
end
return Base64 end function __DIST.o():typeof(__modImpl())local v=__DIST.cache.o if not v then v={c=__modImpl()}__DIST.cache.o=v end return v.c end end do local function __modImpl()--!strict
--!nolint
-- metatablecat 2022


local lz4 = {}























local function plainFind(str, pat)
	return string.find(str, pat, 0, true)
end

local function streamer(str): Streamer__DARKLUA_TYPE_a
	local Stream = {}
	Stream.Offset = 0
	Stream.Source = str
	Stream.Length = string.len(str)
	Stream.IsFinished = false	
	Stream.LastUnreadBytes = 0

	function Stream.read(self: Streamer__DARKLUA_TYPE_a, len: number?, shift: boolean?): string
		local len = len or 1
		local shift = if shift ~= nil then shift else true
		local dat = string.sub(self.Source, self.Offset + 1, self.Offset + len)

		local dataLength = string.len(dat)
		local unreadBytes = len - dataLength

		if shift then
			self:seek(len)
		end

		self.LastUnreadBytes = unreadBytes
		return dat
	end

	function Stream.seek(self: Streamer__DARKLUA_TYPE_a, len: number)
		local len = len or 1

		self.Offset = math.clamp(self.Offset + len, 0, self.Length)
		self.IsFinished = self.Offset >= self.Length
	end

	function Stream.append(self: Streamer__DARKLUA_TYPE_a, newData: string)
		-- adds new data to the end of a stream
		self.Source ..= newData
		self.Length = string.len(self.Source)
		self:seek(0) --hacky but forces a recalculation of the isFinished flag
	end

	function Stream.toEnd(self: Streamer__DARKLUA_TYPE_a)
		self:seek(self.Length)
	end

	return Stream
end

function lz4.compress(str: string): string
	local blocks: BlockData__DARKLUA_TYPE_b = {}
	local iostream = streamer(str)

	if iostream.Length > 12 then
		local firstFour = iostream:read(4)

		local processed = firstFour
		local lit = firstFour
		local match = ""
		local LiteralPushValue = ""
		local pushToLiteral = true

		repeat
			pushToLiteral = true
			local nextByte = iostream:read()

			if plainFind(processed, nextByte) then
				local next3 = iostream:read(3, false)

				if string.len(next3) < 3 then
					--push bytes to literal block then break
					LiteralPushValue = nextByte .. next3
					iostream:seek(3)
				else
					match = nextByte .. next3

					local matchPos = plainFind(processed, match)
					if matchPos then
						iostream:seek(3)
						repeat
							local nextMatchByte = iostream:read(1, false)
							local newResult = match .. nextMatchByte

							local repos = plainFind(processed, newResult) 
							if repos then
								match = newResult
								matchPos = repos
								iostream:seek(1)
							end
						until not plainFind(processed, newResult) or iostream.IsFinished

						local matchLen = string.len(match)
						local pushMatch = true

						if iostream.Length - iostream.Offset <= 5 then
							LiteralPushValue = match
							pushMatch = false
							--better safe here, dont bother pushing to match ever
						end

						if pushMatch then
							pushToLiteral = false

							-- gets the position from the end of processed, then slaps it onto processed
							local realPosition = string.len(processed) - matchPos
							processed = processed .. match

							table.insert(blocks, {
								Literal = lit,
								LiteralLength = string.len(lit),
								MatchOffset = realPosition + 1,
								MatchLength = matchLen,
							})
							lit = ""
						end
					else
						LiteralPushValue = nextByte
					end
				end
			else
				LiteralPushValue = nextByte
			end

			if pushToLiteral then
				lit = lit .. LiteralPushValue
				processed = processed .. nextByte
			end
		until iostream.IsFinished
		table.insert(blocks, {
			Literal = lit,
			LiteralLength = string.len(lit)
		})
	else
		local str = iostream.Source
		blocks[1] = {
			Literal = str,
			LiteralLength = string.len(str)
		}
	end

	-- generate the output chunk
	-- %s is for adding header
	local output = string.rep("\x00", 4)
	local function write(char)
		output = output .. char
	end
	-- begin working through chunks
	for chunkNum, chunk in blocks do
		local litLen = chunk.LiteralLength
		local matLen = (chunk.MatchLength or 4) - 4

		-- create token
		local tokenLit = math.clamp(litLen, 0, 15)
		local tokenMat = math.clamp(matLen, 0, 15)

		local token = bit32.lshift(tokenLit, 4) + tokenMat
		write(string.pack("<I1", token))

		if litLen >= 15 then
			litLen = litLen - 15
			--begin packing extra bytes
			repeat
				local nextToken = math.clamp(litLen, 0, 0xFF)
				write(string.pack("<I1", nextToken))
				if nextToken == 0xFF then
					litLen = litLen - 255
				end
			until nextToken < 0xFF
		end

		-- push raw lit data
		write(chunk.Literal)

		if chunkNum ~= #blocks then
			-- push offset as u16
			write(string.pack("<I2", chunk.MatchOffset))

			-- pack extra match bytes
			if matLen >= 15 then
				matLen = matLen - 15

				repeat
					local nextToken = math.clamp(matLen, 0, 0xFF)
					write(string.pack("<I1", nextToken))
					if nextToken == 0xFF then
						matLen = matLen - 255
					end
				until nextToken < 0xFF
			end
		end
	end
	--append chunks
	local compLen = string.len(output) - 4
	local decompLen = iostream.Length

	return string.pack("<I4", compLen) .. string.pack("<I4", decompLen) .. output
end

function lz4.decompress(lz4data: string): string
	local inputStream = streamer(lz4data)

	local compressedLen = string.unpack("<I4", inputStream:read(4))
	local decompressedLen = string.unpack("<I4", inputStream:read(4))

	if compressedLen == 0 then
		return inputStream:read(decompressedLen)
	end

	local outputStream = streamer("")

	repeat
		local token = string.byte(inputStream:read())
		local litLen = bit32.rshift(token, 4)
		local matLen = bit32.band(token, 15) + 4

		if litLen >= 15 then
			repeat
				local nextByte = string.byte(inputStream:read())
				litLen += nextByte
			until nextByte ~= 0xFF
		end

		local literal = inputStream:read(litLen)
		outputStream:append(literal)
		outputStream:toEnd()
		if outputStream.Length < decompressedLen then
			--match
			local offset = string.unpack("<I2", inputStream:read(2))
			if matLen >= 19 then
				repeat
					local nextByte = string.byte(inputStream:read())
					matLen += nextByte
				until nextByte ~= 0xFF
			end

			outputStream:seek(-offset)
			local pos = outputStream.Offset
			local match = outputStream:read(matLen)
			local unreadBytes = outputStream.LastUnreadBytes
			local extra
			if unreadBytes then
				repeat
					outputStream.Offset = pos
					extra = outputStream:read(unreadBytes)
					unreadBytes = outputStream.LastUnreadBytes
					match ..= extra
				until unreadBytes <= 0
			end

			outputStream:append(match)
			outputStream:toEnd()
		end

	until outputStream.Length >= decompressedLen

	return outputStream.Source
end

return lz4 end function __DIST.p():typeof(__modImpl())local v=__DIST.cache.p if not v then v={c=__modImpl()}__DIST.cache.p=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint

--[[
ADVANCED ENCRYPTION STANDARD (AES)

Implementation of secure symmetric-key encryption specifically in Luau
Includes ECB, CBC, PCBC, CFB, OFB and CTR modes without padding.
Made by @RobloxGamerPro200007 (verify the original asset)

MORE INFORMATION: https://devforum.roblox.com/t/advanced-encryption-standard-in-luau/2009120
]]

-- SUBSTITUTION BOXES

local s_box 	= { 99, 124, 119, 123, 242, 107, 111, 197,  48,   1, 103,  43, 254, 215, 171, 118, 202,
	130, 201, 125, 250,  89,  71, 240, 173, 212, 162, 175, 156, 164, 114, 192, 183, 253, 147,  38,  54,
	 63, 247, 204,  52, 165, 229, 241, 113, 216,  49,  21,   4, 199,  35, 195,  24, 150,   5, 154,   7,
	 18, 128, 226, 235,  39, 178, 117,   9, 131,  44,  26,  27, 110,  90, 160,  82,  59, 214, 179,  41,
	227,  47, 132,  83, 209,   0, 237,  32, 252, 177,  91, 106, 203, 190,  57,  74,  76,  88, 207, 208,
	239, 170, 251,  67,  77,  51, 133,  69, 249,   2, 127,  80,  60, 159, 168,  81, 163,  64, 143, 146,
	157,  56, 245, 188, 182, 218,  33,  16, 255, 243, 210, 205,  12,  19, 236,  95, 151,  68,  23, 196,
	167, 126,  61, 100,  93,  25, 115,  96, 129,  79, 220,  34,  42, 144, 136,  70, 238, 184,  20, 222,
	 94,  11, 219, 224,  50,  58,  10,  73,   6,  36,  92, 194, 211, 172,  98, 145, 149, 228, 121, 231,
	200,  55, 109, 141, 213,  78, 169, 108,  86, 244, 234, 101, 122, 174,   8, 186, 120,  37,  46,  28,
	166, 180, 198, 232, 221, 116,  31,  75, 189, 139, 138, 112,  62, 181, 102,  72,   3, 246,  14,  97,
	 53,  87, 185, 134, 193,  29, 158, 225, 248, 152,  17, 105, 217, 142, 148, 155,  30, 135, 233, 206,
	 85,  40, 223, 140, 161, 137,  13, 191, 230,  66, 104,  65, 153,  45,  15, 176,  84, 187,  22}
local inv_s_box	= { 82,   9, 106, 213,  48,  54, 165,  56, 191,  64, 163, 158, 129, 243, 215, 251, 124,
	227,  57, 130, 155,  47, 255, 135,  52, 142,  67,  68, 196, 222, 233, 203,  84, 123, 148,  50, 166,
	194,  35,  61, 238,  76, 149,  11,  66, 250, 195,  78,   8,  46, 161, 102,  40, 217,  36, 178, 118,
	 91, 162,  73, 109, 139, 209,  37, 114, 248, 246, 100, 134, 104, 152,  22, 212, 164,  92, 204,  93,
	101, 182, 146, 108, 112,  72,  80, 253, 237, 185, 218,  94,  21,  70,  87, 167, 141, 157, 132, 144,
	216, 171,   0, 140, 188, 211,  10, 247, 228,  88,   5, 184, 179,  69,   6, 208,  44,  30, 143, 202,
	 63,  15,   2, 193, 175, 189,   3,   1,  19, 138, 107,  58, 145,  17,  65,  79, 103, 220, 234, 151,
	242, 207, 206, 240, 180, 230, 115, 150, 172, 116,  34, 231, 173,  53, 133, 226, 249,  55, 232,  28,
	117, 223, 110,  71, 241,  26, 113,  29,  41, 197, 137, 111, 183,  98,  14, 170,  24, 190,  27, 252,
	 86,  62,  75, 198, 210, 121,  32, 154, 219, 192, 254, 120, 205,  90, 244,  31, 221, 168,  51, 136,
	  7, 199,  49, 177,  18,  16,  89,  39, 128, 236,  95,  96,  81, 127, 169,  25, 181,  74,  13,  45,
	229, 122, 159, 147, 201, 156, 239, 160, 224,  59,  77, 174,  42, 245, 176, 200, 235, 187,  60, 131,
	 83, 153,  97,  23,  43,   4, 126, 186, 119, 214,  38, 225, 105,  20,  99,  85,  33,  12, 125}

-- ROUND CONSTANTS ARRAY
local rcon = {  0,   1,   2,   4,   8,  16,  32,  64, 128,  27,  54, 108, 216, 171,  77, 154,  47,  94,
	188,  99, 198, 151,  53, 106, 212, 179, 125, 250, 239, 197, 145,  57}
-- MULTIPLICATION OF BINARY POLYNOMIAL
local function xtime(x)
	local i = bit32.lshift(x, 1)
	return if bit32.band(x, 128) == 0 then i else bit32.bxor(i, 27) % 256
end

-- TRANSFORMATION FUNCTIONS
local function subBytes		(s, inv) 		-- Processes State using the S-box
	inv = if inv then inv_s_box else s_box
	for i = 1, 4 do
		for j = 1, 4 do
			s[i][j] = inv[s[i][j] + 1]
		end
	end
end
local function shiftRows		(s, inv) 	-- Processes State by circularly shifting rows
	s[1][3], s[2][3], s[3][3], s[4][3] = s[3][3], s[4][3], s[1][3], s[2][3]
	if inv then
		s[1][2], s[2][2], s[3][2], s[4][2] = s[4][2], s[1][2], s[2][2], s[3][2]
		s[1][4], s[2][4], s[3][4], s[4][4] = s[2][4], s[3][4], s[4][4], s[1][4]
	else
		s[1][2], s[2][2], s[3][2], s[4][2] = s[2][2], s[3][2], s[4][2], s[1][2]
		s[1][4], s[2][4], s[3][4], s[4][4] = s[4][4], s[1][4], s[2][4], s[3][4]
	end
end
local function addRoundKey	(s, k) 			-- Processes Cipher by adding a round key to the State
	for i = 1, 4 do
		for j = 1, 4 do
			s[i][j] = bit32.bxor(s[i][j], k[i][j])
		end
	end
end
local function mixColumns	(s, inv) 		-- Processes Cipher by taking and mixing State columns
	local t, u
	if inv then
		for i = 1, 4 do
			t = xtime(xtime(bit32.bxor(s[i][1], s[i][3])))
			u = xtime(xtime(bit32.bxor(s[i][2], s[i][4])))
			s[i][1], s[i][2] = bit32.bxor(s[i][1], t), bit32.bxor(s[i][2], u)
			s[i][3], s[i][4] = bit32.bxor(s[i][3], t), bit32.bxor(s[i][4], u)
		end
	end

	local i
	for j = 1, 4 do
		i = s[j]
		t, u = bit32.bxor		(i[1], i[2], i[3], i[4]), i[1]
		for k = 1, 4 do
			i[k] = bit32.bxor	(i[k], t, xtime(bit32.bxor(i[k], i[k + 1] or u)))
		end
	end
end

-- BYTE ARRAY UTILITIES
local function bytesToMatrix	(t, c, inv) -- Converts a byte array to a 4x4 matrix
	if inv then
		table.move		(c[1], 1, 4, 1, t)
		table.move		(c[2], 1, 4, 5, t)
		table.move		(c[3], 1, 4, 9, t)
		table.move		(c[4], 1, 4, 13, t)
	else
		for i = 1, #c / 4 do
			table.clear	(t[i])
			table.move	(c, i * 4 - 3, i * 4, 1, t[i])
		end
	end
	
	return t
end
local function xorBytes		(t, a, b) 		-- Returns bitwise XOR of all their bytes
	table.clear		(t)
	
	for i = 1, math.min(#a, #b) do
		table.insert(t, bit32.bxor(a[i], b[i]))
	end
	return t
end
local function incBytes		(a, inv)		-- Increment byte array by one
	local o = true
	for i = if inv then 1 else #a, if inv then #a else 1, if inv then 1 else - 1 do
		if a[i] == 255 then
			a[i] = 0
		else
			a[i] += 1
			o = false
			break
		end
	end
	
	return o, a
end

-- MAIN ALGORITHM
local function expandKey	(key) 				-- Key expansion
	local kc = bytesToMatrix(if #key == 16 then {{}, {}, {}, {}} elseif #key == 24 then {{}, {}, {}, {}
		, {}, {}} else {{}, {}, {}, {}, {}, {}, {}, {}}, key)
	local is = #key / 4
	local i, t, w = 2, {}, nil
	
	while #kc < (#key / 4 + 7) * 4 do
		w = table.clone	(kc[#kc])
		if #kc % is == 0 then
			table.insert(w, table.remove(w, 1))
			for j = 1, 4 do
				w[j] = s_box[w[j] + 1]
			end
			w[1]	 = bit32.bxor(w[1], rcon[i])
			i 	+= 1
		elseif #key == 32 and #kc % is == 4 then
			for j = 1, 4 do
				w[j] = s_box[w[j] + 1]
			end
		end
		
		table.clear	(t)
		xorBytes	(w, table.move(w, 1, 4, 1, t), kc[#kc - is + 1])
		table.insert(kc, w)
	end
	
	table.clear		(t)
	for i = 1, #kc / 4 do
		table.insert(t, {})
		table.move	(kc, i * 4 - 3, i * 4, 1, t[#t])
	end
	return t
end
local function encrypt	(key, km, pt, ps, r) 	-- Block cipher encryption
	bytesToMatrix	(ps, pt)
	addRoundKey		(ps, km[1])
	
	for i = 2, #key / 4 + 6 do
		subBytes	(ps)
		shiftRows	(ps)
		mixColumns	(ps)
		addRoundKey	(ps, km[i])
	end
	subBytes		(ps)
	shiftRows		(ps)
	addRoundKey		(ps, km[#km])
	
	return bytesToMatrix(r, ps, true)
end
local function decrypt	(key, km, ct, cs, r) 	-- Block cipher decryption
	bytesToMatrix	(cs, ct)
	
	addRoundKey		(cs, km[#km])
	shiftRows		(cs, true)
	subBytes		(cs, true)
	for i = #key / 4 + 6, 2, - 1 do
		addRoundKey	(cs, km[i])
		mixColumns	(cs, true)
		shiftRows	(cs, true)
		subBytes	(cs, true)
	end
	
	addRoundKey		(cs, km[1])
	return bytesToMatrix(r, cs, true)
end

-- INITIALIZATION FUNCTIONS
local function convertType	(a) 					-- Converts data to bytes if possible
	if type(a) == "string" then
		local r = {}

		for i = 1, string.len(a), 7997 do
			table.move({string.byte(a, i, i + 7996)}, 1, 7997, i, r)
		end
		return r
	elseif type(a) == "table" then
		for _, i in ipairs(a) do
			assert(type(i) == "number" and math.floor(i) == i and 0 <= i and i < 256,
				"Unable to cast value to bytes")
		end
		return a
	else
		error("Unable to cast value to bytes")
	end
end
local function init			(key, txt, m, iv, s) 	-- Initializes functions if possible
	key = convertType(key)
	assert(#key == 16 or #key == 24 or #key == 32, "Key must be either 16, 24 or 32 bytes long")
	txt = convertType(txt)
	assert(#txt % (s or 16) == 0, "Input must be a multiple of " .. (if s then "segment size " .. s
		else "16") .. " bytes in length")
	if m then
		if type(iv) == "table" then
			iv = table.clone(iv)
			local l, e 		= iv.Length, iv.LittleEndian
			assert(type(l) == "number" and 0 < l and l <= 16,
				"Counter value length must be between 1 and 16 bytes")
			iv.Prefix 		= convertType(iv.Prefix or {})
			iv.Suffix 		= convertType(iv.Suffix or {})
			assert(#iv.Prefix + #iv.Suffix + l == 16, "Counter must be 16 bytes long")
			iv.InitValue 	= if iv.InitValue == nil then {1} else table.clone(convertType(iv.InitValue
			))
			assert(#iv.InitValue <= l, "Initial value length must be of the counter value")
			iv.InitOverflow = if iv.InitOverflow == nil then table.create(l, 0) else table.clone(
				convertType(iv.InitOverflow))
			assert(#iv.InitOverflow <= l,
				"Initial overflow value length must be of the counter value")
			for _ = 1, l - #iv.InitValue do
				table.insert(iv.InitValue, 1 + if e then #iv.InitValue else 0, 0)
			end
			for _ = 1, l - #iv.InitOverflow do
				table.insert(iv.InitOverflow, 1 + if e then #iv.InitOverflow else 0, 0)
			end
		elseif type(iv) ~= "function" then
			local i, t = if iv then convertType(iv) else table.create(16, 0), {}
			assert(#i == 16, "Counter must be 16 bytes long")
			iv = {Length = 16, Prefix = t, Suffix = t, InitValue = i,
				InitOverflow = table.create(16, 0)}
		end
	elseif m == false then
		iv 	= if iv == nil then  table.create(16, 0) else convertType(iv)
		assert(#iv == 16, "Initialization vector must be 16 bytes long")
	end
	if s then
		s = math.floor(tonumber(s) or 1)
		assert(type(s) == "number" and 0 < s and s <= 16, "Segment size must be between 1 and 16 bytes"
		)
	end
	
	return key, txt, expandKey(key), iv, s
end

-- CIPHER MODES OF OPERATION

return {
	-- Electronic codebook (ECB)
	encrypt_ECB = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c) 									: bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km = init(key, plainText)
		
		local b, k, s, t = {}, {}, {{}, {}, {}, {}}, {}
		for i = 1, #plainText, 16 do
			table.move(plainText, i, i + 15, 1, k)
			table.move(encrypt(key, km, k, s, t), 1, 16, i, b)
		end
		
		return b
	end,
	decrypt_ECB = function(key : bytes__DARKLUA_TYPE_c, cipherText : bytes__DARKLUA_TYPE_c) 								: bytes__DARKLUA_TYPE_c
		local km
		key, cipherText, km = init(key, cipherText)
		
		local b, k, s, t = {}, {}, {{}, {}, {}, {}}, {}
		for i = 1, #cipherText, 16 do
			table.move(cipherText, i, i + 15, 1, k)
			table.move(decrypt(key, km, k, s, t), 1, 16, i, b)
		end
		
		return b
	end,
	-- Cipher block chaining (CBC)
	encrypt_CBC = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?) 			: bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km, initVector = init(key, plainText, false, initVector)
		
		local b, k, p, s, t = {}, {}, initVector, {{}, {}, {}, {}}, {}
		for i = 1, #plainText, 16 do
			table.move(plainText, i, i + 15, 1, k)
			table.move(encrypt(key, km, xorBytes(t, k, p), s, p), 1, 16, i, b)
		end
		
		return b
	end,
	decrypt_CBC = function(key : bytes__DARKLUA_TYPE_c, cipherText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?) 			: bytes__DARKLUA_TYPE_c
		local km
		key, cipherText, km, initVector = init(key, cipherText, false, initVector)
		
		local b, k, p, s, t = {}, {}, initVector, {{}, {}, {}, {}}, {}
		for i = 1, #cipherText, 16 do
			table.move(cipherText, i, i + 15, 1, k)
			table.move(xorBytes(k, decrypt(key, km, k, s, t), p), 1, 16, i, b)
			table.move(cipherText, i, i + 15, 1, p)
		end
		
		return b
	end,
	-- Propagating cipher block chaining (PCBC)
	encrypt_PCBC = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?) 			: bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km, initVector = init(key, plainText, false, initVector)
		
		local b, k, c, p, s, t = {}, {}, initVector, table.create(16, 0), {{}, {}, {}, {}}, {}
		for i = 1, #plainText, 16 do
			table.move(plainText, i, i + 15, 1, k)
			table.move(encrypt(key, km, xorBytes(k, xorBytes(t, c, k), p), s, c), 1, 16, i, b)
			table.move(plainText, i, i + 15, 1, p)
		end
		
		return b
	end,
	decrypt_PCBC = function(key : bytes__DARKLUA_TYPE_c, cipherText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?) 			: bytes__DARKLUA_TYPE_c
		local km
		key, cipherText, km, initVector = init(key, cipherText, false, initVector)
		
		local b, k, c, p, s, t = {}, {}, initVector, table.create(16, 0), {{}, {}, {}, {}}, {}
		for i = 1, #cipherText, 16 do
			table.move(cipherText, i, i + 15, 1, k)
			table.move(xorBytes(p, decrypt(key, km, k, s, t), xorBytes(k, c, p)), 1, 16, i, b)
			table.move(cipherText, i, i + 15, 1, c)
		end
		
		return b
	end,
	-- Cipher feedback (CFB)
	encrypt_CFB = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?, segmentSize : number?)
		: bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km, initVector, segmentSize = init(key, plainText, false, initVector,
			if segmentSize == nil then 1 else segmentSize)
		
		local b, k, p, q, s, t = {}, {}, initVector, {}, {{}, {}, {}, {}}, {}
		for i = 1, #plainText, segmentSize do
			table.move(plainText, i, i + segmentSize - 1, 1, k)
			table.move(xorBytes(q, encrypt(key, km, p, s, t), k), 1, segmentSize, i, b)
			for j = 16, segmentSize + 1, - 1 do
				table.insert(q, 1, p[j])
			end
			table.move(q, 1, 16, 1, p)
		end
		
		return b
	end,
	decrypt_CFB = function(key : bytes__DARKLUA_TYPE_c, cipherText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c, segmentSize : number?)
		: bytes__DARKLUA_TYPE_c
		local km
		key, cipherText, km, initVector, segmentSize = init(key, cipherText, false, initVector,
			if segmentSize == nil then 1 else segmentSize)
		
		local b, k, p, q, s, t = {}, {}, initVector, {}, {{}, {}, {}, {}}, {}
		for i = 1, #cipherText, segmentSize do
			table.move(cipherText, i, i + segmentSize - 1, 1, k)
			table.move(xorBytes(q, encrypt(key, km, p, s, t), k), 1, segmentSize, i, b)
			for j = 16, segmentSize + 1, - 1 do
				table.insert(k, 1, p[j])
			end
			table.move(k, 1, 16, 1, p)
		end
		
		return b
	end,
	-- Output feedback (OFB)
	encrypt_OFB = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c, initVector : bytes__DARKLUA_TYPE_c?) 			: bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km, initVector = init(key, plainText, false, initVector)
		
		local b, k, p, s, t = {}, {}, initVector, {{}, {}, {}, {}}, {}
		for i = 1, #plainText, 16 do
			table.move(plainText, i, i + 15, 1, k)
			table.move(encrypt(key, km, p, s, t), 1, 16, 1, p)
			table.move(xorBytes(t, k, p), 1, 16, i, b)
		end
		
		return b
	end,
	-- Counter (CTR)
	encrypt_CTR = function(key : bytes__DARKLUA_TYPE_c, plainText : bytes__DARKLUA_TYPE_c, counter : ((bytes__DARKLUA_TYPE_c) -> bytes__DARKLUA_TYPE_c) | bytes__DARKLUA_TYPE_c | { [
		string]: any }?) : bytes__DARKLUA_TYPE_c
		local km
		key, plainText, km, counter = init(key, plainText, true, counter)
		
		local b, k, c, s, t, r, n = {}, {}, {}, {{}, {}, {}, {}}, {}, type(counter) == "table", nil
		for i = 1, #plainText, 16 do
			if r then
				if i > 1 and incBytes(counter.InitValue, counter.LittleEndian) then
					table.move(counter.InitOverflow, 1, 16, 1, counter.InitValue)
				end
				table.clear	(c)
				table.move	(counter.Prefix, 1, #counter.Prefix, 1, c)
				table.move	(counter.InitValue, 1, counter.Length, #c + 1, c)
				table.move	(counter.Suffix, 1, #counter.Suffix, #c + 1, c)
			else
				n = convertType(counter(c, (i + 15) / 16))
				assert		(#n == 16, "Counter must be 16 bytes long")
				table.move	(n, 1, 16, 1, c)
			end
			table.move(plainText, i, i + 15, 1, k)
			table.move(xorBytes(c, encrypt(key, km, c, s, t), k), 1, 16, i, b)
		end
		
		return b
	end
} -- Returns the library
end function __DIST.q():typeof(__modImpl())local v=__DIST.cache.q if not v then v={c=__modImpl()}__DIST.cache.q=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint

local Base64 = __DIST.o()
local lz4 = __DIST.p()
-- local sha = require("./sha.luau")
local AES = __DIST.q()

local bf_ts = buffer.tostring
-- local hash = sha.sha256

local kb = bit32.lshift(1,10)

local crypt = {}

function crypt.encrypt(data: string, key: string, initVector: string) : string
	return AES.encrypt_CBC(key, data, initVector)
end

function crypt.decrypt(data: string, key: string, initVector: string) : string
	return AES.decrypt_CBC(key, data, initVector)
end

function crypt.base64encode(data: string) : string
	return Base64.Encode(data)
end

function crypt.base64decode(data: string) : string
	return Base64.Decode(data)
end

function crypt.lz4compress(data: string) : string
	return lz4.compress(data)
end

function crypt.lz4decompress(data: string) : string
	return lz4.decompress(data)
end

--[[ function crypt.hash(data: string) : string
	return hash(data)
end ]]

function crypt.random(size : number) : number
	if size > kb or size < 0 then
		error("Expected number within range (0, 1024), got: "..tostring(size),0)
	else
		local charset = {}
		
		for ascii = 33, 57 do
			table.insert(charset, string.char(ascii))
		end

		for ascii = 65, 90 do
			table.insert(charset, string.char(ascii))
		end

		for ascii = 97, 122 do
			table.insert(charset, string.char(ascii))
		end

		--[[local specials = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
		for char in specials:gmatch(".") do
			table.insert(charset, char)
		end]]

		local randomString = {}
		for _ = 1, size do
			local randomIndex = math.random(1, #charset)
			table.insert(randomString, charset[randomIndex])
		end

		return table.concat(randomString)
	end
end

return crypt end function __DIST.r():typeof(__modImpl())local v=__DIST.cache.r if not v then v={c=__modImpl()}__DIST.cache.r=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.encrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "1234567890abcdef"
	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local iv = "1234567890abcdef"
	local mode = "CBC"

	local cryptSuccess, cryptEncrypted = pcall(function()
		return crypt.encrypt(plaintext, key, iv, mode)
	end)

	if not cryptSuccess then
		return {
			status = 0,
			message = "Encrypt failed: " .. tostring(cryptEncrypted),
		}
    end

	local reference = "G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh"
	local assumed = referenceCrypt.base64encode(cryptEncrypted)
	
	if assumed ~= reference then
		return {
			status = 500,
			message = "Encrypted data doesn't match reference data",
		}
    end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.s():typeof(__modImpl())local v=__DIST.cache.s if not v then v={c=__modImpl()}__DIST.cache.s=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.decrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local data = referenceCrypt.base64decode("G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh")
	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local iv = "1234567890abcdef"
	local mode = "CBC"

	local decryptSuccess, cryptDecrypted = pcall(function()
		return crypt.decrypt(data, key, iv, mode)
	end)

	if not decryptSuccess then
		return {
			status = 0,
			message = "Decrypt failed: " .. tostring(cryptDecrypted),
		}
	elseif not cryptDecrypted then
		return {
			status = 500,
			message = "Decrypt returned nothing",
		}
	elseif cryptDecrypted ~= "1234567890abcdef" then
		return {
			status = 500,
			message = "Decrypted data doesn't match reference data",
		}
    end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.t():typeof(__modImpl())local v=__DIST.cache.t if not v then v={c=__modImpl()}__DIST.cache.t=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.generatekey then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local decoded = referenceCrypt.base64decode(crypt.generatekey())
	if type(decoded) ~= "string" then
		return {
			status = 500,
			message = "Generated key doesn't form a string",
		}
	elseif #decoded ~= 32 then
		return {
			status = 500,
			message = "Key dosen't match the expected length",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.u():typeof(__modImpl())local v=__DIST.cache.u if not v then v={c=__modImpl()}__DIST.cache.u=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.generatebytes then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    local size = math.random(1, 512)
    local bytes = crypt.generatebytes(size)
	local decodedBytes = referenceCrypt.base64decode(bytes)
	if type(decodedBytes) ~= "string" then
		return {
			status = 500,
			message = "Generated bytes do not form a string",
		}
	elseif #decodedBytes ~= size then
		return {
			status = 500,
			message = "Bytes length mismatch: "..tostring(#decodedBytes).." != "..tostring(size),
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"base64_decode",
		"crypt.base64.decode",
		"base64.decode",
		"crypt.base64_decode",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.v():typeof(__modImpl())local v=__DIST.cache.v if not v then v={c=__modImpl()}__DIST.cache.v=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.base64encode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local encoded = crypt.base64encode(plaintext)

	if not encoded or typeof(encoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif encoded ~= referenceCrypt.base64encode(plaintext) then
		return {
			status = 500,
			message = "Encoded data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"base64_encode",
		"crypt.base64.encode",
		"base64.encode",
		"crypt.base64_encode",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.w():typeof(__modImpl())local v=__DIST.cache.w if not v then v={c=__modImpl()}__DIST.cache.w=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.base64decode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local reference = referenceCrypt.base64encode(plaintext)
	local decoded = crypt.base64decode(reference)

	if not reference or typeof(reference) ~= "string" then
		return {
			status = 500,
			message = "Reference crypt failed",
		}
	elseif not decoded or typeof(decoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif decoded ~= plaintext then
		return {
			status = 500,
			message = "Decoded data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"base64_decode",
		"crypt.base64.decode",
		"base64.decode",
		"crypt.base64_decode",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.x():typeof(__modImpl())local v=__DIST.cache.x if not v then v={c=__modImpl()}__DIST.cache.x=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not crypt or not crypt.hash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local input = "MYRIAD"

	local algoMap = {
		md5 = "4f4c0116fe2faa1318448c548b35db329d04b95d6a564c9952674be7470292a8",

		sha1 = "fc7f43037330bdab9a8a3b19a7cbcde1ca35f0f3413e8109f2378d448e09d746",

		sha224 = "c289f37be9147ea83aea5178831674ac35512679c9ac728b0af58d1354aa9586",
		sha256 = "c9d5cae0702443d77159a3da3993a31e21fe71347946e8088e29c329b2fad67d",
		sha384 = "75805da0851cdb609be9cce35c7cf9b8c560fe1d015370d9ffdc7dc974cec3d2",
		sha512 = "9e5a7723b2776d0a26cfc7a1ee141ee7e23ab9be07a7bbe9a83ad9a44d6c932c",

		["sha3-256"] = "508c76d7f914e8f434b11c84fa5c55a086f86b8b0b38ce0dffa861fdfbdc77b3",
		["sha3-384"] = "1fb780f81b5a6013af2bfe6677a34439970c63b8447a00e0c23c0e5ff1a4bbd2",
		["sha3-512"] = "bc49e307d6fd0fc8f9ab5c9236ea93194dfa99dd89fea20e75aed6530bd6820b",
	}

	for algo, expected in pairs(algoMap) do
		local success, cryptOutput = pcall(crypt.hash, input, algo)

		if not success then
			return {
				status = 0,
				message = `Hashing failed with {algo}: {cryptOutput}`,
			}

		elseif not cryptOutput then
			return {
				status = 500,
				message = `Hashing failed, expected a hash. Algorithm: {algo}`,
			}

		elseif cryptOutput ~= expected then
			return {
				status = 500,
				message = `Hash mismatch. Algorithm: {algo}`,
			}
		end
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end end function __DIST.y():typeof(__modImpl())local v=__DIST.cache.y if not v then v={c=__modImpl()}__DIST.cache.y=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not crypt or not crypt.random then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local maxLimSuccess, maxLimMessage = pcall(function()
		return crypt.random(512)
	end)
	local minLimSuccess, minLimMessage = pcall(function()
		return crypt.random(-1)
	end)
	local baseSuccess, baseMessage = pcall(function()
		return crypt.random(64)
	end)

	if not baseSuccess then
		return {
			status = 0,
			message = "Failed: " .. tostring(baseMessage),
		}
	elseif minLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed -1, should have failed.",
		}
	elseif not maxLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed 512, should have passed.",
		}
	elseif #baseMessage ~= 64 then
		return {
			status = 500,
			message = "Len mismatch. Expected 64, got: " .. tostring(#baseMessage),
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.z():typeof(__modImpl())local v=__DIST.cache.z if not v then v={c=__modImpl()}__DIST.cache.z=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not crypt or not crypt.hmac then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local key = "secret_key"
	local algorithm = "sha256"

	local reference = "FaDPiTSLlbxRP5rKvomt0dzwl7zhszc46/QFPsZRGWY="
	local assumed = crypt.hmac(key, plaintext, algorithm)

	if not assumed then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif assumed ~= reference then
		return {
			status = 500,
			message = "Data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.A():typeof(__modImpl())local v=__DIST.cache.A if not v then v={c=__modImpl()}__DIST.cache.A=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getconstant then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		local _1 = 2
		local _2 = "A"

		print(_1)
		tostring(_2)

		Date.now()
	end

	local constOrder = {
		[1] = "print",

		[3] = "A",
		[4] = "tostring",

		[6] = "Date",
		[7] = "now"
	}

	for i, v in ipairs(constOrder) do
		local const = debug.getconstant(originalFunction, i)
		if const ~= v then
			return {
				status = 500,
				message = `Constant at {i} should be: {v}. Got: {const}`,
			}
		end
	end

	local invalidIndexSuccess, returnedMsg = pcall(debug.getconstant, originalFunction, 9)

	if not invalidIndexSuccess then
		return {
			status = 500,
			message = "Should pass nil instead of errroing for invalid indexes",
		}
	elseif returnedMsg then
		return {
			status = 500,
			message = "Constant 9 shouldn't exist",
		}
	elseif pcall(debug.getconstant, print, 1) then
		return {
			status = 500,
			message = "Should error with C closures",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getconstant",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.B():typeof(__modImpl())local v=__DIST.cache.B if not v then v={c=__modImpl()}__DIST.cache.B=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getconstants then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		local _1 = 2
		local _2 = "A"

		print(_1)
		tostring(_2)

		Date.now()
	end

	local constOrder = {
		[1] = "print",

		[3] = "A",
		[4] = "tostring",

		[6] = "Date",
		[7] = "now"
	}

	for i, v in pairs(debug.getconstants(originalFunction)) do
		if not constOrder[i] then
			return {
				status = 500,
				message = `{i} dosen't exist in expected constant order`
			}
		elseif constOrder[i] ~= v then
			return {
				status = 500,
				message = `Constant at {i} should be: {constOrder[i]}. Got: {v}`
			}
		end
	end

	if pcall(debug.getconstants, print) then
		return {
			status = 500,
			message = "Should error with C closures"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getconstants"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.C():typeof(__modImpl())local v=__DIST.cache.C if not v then v={c=__modImpl()}__DIST.cache.C=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getproto then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		return function()
			return "MYRI"
		end
	end
	
	local assumedProto = debug.getproto(originalFunction, 1, true)[1]

	if originalFunction() ~= assumedProto then
		return {
			status = 500,
			message = "Actual prototype dosen't match assumed prototype"
		}
	elseif assumedProto() ~= "MYRI" then
		return {
			status = 500,
			message = "Unexpected value of assumed prototype"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getproto"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.D():typeof(__modImpl())local v=__DIST.cache.D if not v then v={c=__modImpl()}__DIST.cache.D=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getprotos then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		return function()
			return "MYRI1"
		end, function()
			return "MYRI2"
		end
	end

	local count = 0
	for index, prototype in ipairs(debug.getprotos(originalFunction)) do
		count += prototype() == (index == 1 and "MYRI1" or "MYRI2") and 1 or 0
	end

	if count ~= 2 then
		return {
			status = 500,
			message = "Didn't recieve correct prototypes, or prototypes didn't return expected values.",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getprotos",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.E():typeof(__modImpl())local v=__DIST.cache.E if not v then v={c=__modImpl()}__DIST.cache.E=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getupvalue then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getupvalue"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.F():typeof(__modImpl())local v=__DIST.cache.F if not v then v={c=__modImpl()}__DIST.cache.F=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getupvalues then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getupvalues"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.G():typeof(__modImpl())local v=__DIST.cache.G if not v then v={c=__modImpl()}__DIST.cache.G=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.getstack then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getstack"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.H():typeof(__modImpl())local v=__DIST.cache.H if not v then v={c=__modImpl()}__DIST.cache.H=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.setconstant then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"setconstant"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.I():typeof(__modImpl())local v=__DIST.cache.I if not v then v={c=__modImpl()}__DIST.cache.I=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not debug or not debug.setupvalue then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"setupvalue"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.J():typeof(__modImpl())local v=__DIST.cache.J if not v then v={c=__modImpl()}__DIST.cache.J=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not Drawing or not Drawing.new then
		return {
			status = 400,
			message = "Global Drawing API not found",
		}
	end

	local function checkProperties(objectName, instance, properties)
		for _, property in ipairs(properties) do
			local success, value = pcall(function()
				return instance[property]
			end)
			if not success or value == nil then
				return {
					status = 500,
					message = `{objectName} is missing property: {property} (Did you give it a default value?)`,
				}
			end
			instance:Destroy()
		end
	end

	-- Line
	do
		local Line = Drawing.new("Line")
		if not Line then
			return {
				status = 500,
				message = "Line drawing object not found",
			}
		end

		local result = checkProperties("Line", Line, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Thickness",
			"From",
			"To",
		})
		if result then
			return result
		end
	end

	-- Text
	do
		local Text = Drawing.new("Text")
		if not Text then
			return {
				status = 500,
				message = "Text drawing object not found",
			}
		end

		local result = checkProperties("Text", Text, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Text",
			"TextBounds",
			"Center",
			"Size",
			"Font",
			"Outline",
			"OutlineColor",
			"Position",
		})
		if result then
			return result
		end
	end

	-- Image
	do
		local Image = Drawing.new("Image")
		if not Image then
			return {
				status = 500,
				message = "Image drawing object not found",
			}
		end

		local result = checkProperties("Image", Image, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Data",
			"Size",
			"Position",
		})
		if result then
			return result
		end
	end

	-- Circle
	do
		local Circle = Drawing.new("Circle")
		if not Circle then
			return {
				status = 500,
				message = "Circle drawing object not found",
			}
		end

		local result = checkProperties("Circle", Circle, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"NumSides",
			"Radius",
			"Position",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Square
	do
		local Square = Drawing.new("Square")
		if not Square then
			return {
				status = 500,
				message = "Square drawing object not found",
			}
		end

		local result = checkProperties("Square", Square, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Size",
			"Position",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Quad
	do
		local Quad = Drawing.new("Quad")
		if not Quad then
			return {
				status = 500,
				message = "Quad drawing object not found",
			}
		end

		local result = checkProperties("Quad", Quad, {
			"Destroy",
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",

			"PointA",
			"PointB",
			"PointC",
			"PointD",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Triangle
	do
		local Triangle = Drawing.new("Triangle")
		if not Triangle then
			return {
				status = 500,
				message = "Triangle drawing object not found",
			}
		end

		local result = checkProperties("Triangle", Triangle, {
			"Destroy",
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",

			"PointA",
			"PointB",
			"PointC",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Lua drawing lib
	local x1, y1, z1 = math.random(1, 255), math.random(1, 255), math.random(1, 255)
	local parent = gethui and gethui() or game:GetService("CoreGui")
	local refObj = Drawing.new("Line")

	refObj.Color = Color3.fromRGB(x1, y1, z1)
	refObj.Transparency = 1 - x1 / 255

	if parent then
		for i, v in pairs(parent:GetDescendants()) do
			if v:IsA("Frame") and v.BackgroundColor3 == refObj.Color and v.BackgroundTransparency == refObj.Transparency then
				return {
					status = 500,
					message = "Drawing library almost certainly depends on ScreenGui"
				}
			end
		end
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.K():typeof(__modImpl())local v=__DIST.cache.K if not v then v={c=__modImpl()}__DIST.cache.K=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not Drawing or not Drawing.Fonts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	if not Drawing.Fonts["UI"] then
		return {
			status = 500,
			message = "UI font not found",
		}
	elseif not Drawing.Fonts["System"] then
		return {
			status = 500,
			message = "System font not found",
		}
	elseif not Drawing.Fonts["Plex"] then
		return {
			status = 500,
			message = "Plex font not found",
		}
	elseif not Drawing.Fonts["Monospace"] then
		return {
			status = 500,
			message = "Monospace font not found",
		}
	elseif Drawing.Fonts["UI"] ~= 0 then
		return {
			status = 500,
			message = "UI font isn't ID 0",
		}
	elseif Drawing.Fonts["System"] ~= 1 then
		return {
			status = 500,
			message = "System font isn't ID 1",
		}
	elseif Drawing.Fonts["Plex"] ~= 2 then
		return {
			status = 500,
			message = "Plex font isn't ID 2",
		}
	elseif Drawing.Fonts["Monospace"] ~= 3 then
		return {
			status = 500,
			message = "Monospace font isn't ID 3",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.L():typeof(__modImpl())local v=__DIST.cache.L if not v then v={c=__modImpl()}__DIST.cache.L=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getrenderproperty then
		return {
			status = 400,
			message = "Global not found",
		}
		elseif not Drawing or not Drawing.new then
		return {
			status = 401,
			message = "Drawing library needed to test this",
		}
	end

	local drawing = Drawing.new("Line")
	drawing.Thickness = 2
	drawing.Visible = false

	local thickness = getrenderproperty(drawing, "Thickness")
	local visible = getrenderproperty(drawing, "Visible")

	if thickness ~= 2 or visible ~= false then
		return {
			status = 500,
			message = "Property not found or mismatch",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.M():typeof(__modImpl())local v=__DIST.cache.M if not v then v={c=__modImpl()}__DIST.cache.M=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setrenderproperty then
		return {
			status = 400,
			message = "Global not found",
		}
		elseif not Drawing or not Drawing.new then
		return {
			status = 401,
			message = "Drawing library needed to test this",
		}
	end

	local drawing = Drawing.new("Line")
	setrenderproperty(drawing, "Thickness", 2)
	setrenderproperty(drawing, "Visible", false)

	if drawing.Thickness ~= 2 or drawing.Visible ~= false then
		return {
			status = 500,
			message = "Incorrect property value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.N():typeof(__modImpl())local v=__DIST.cache.N if not v then v={c=__modImpl()}__DIST.cache.N=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not cleardrawcache then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not Drawing or not Drawing.new then
		return {
			status = 401,
			message = "Drawing library needed to test this",
		}
	end

	local drawing = Drawing.new("Line")
	drawing.Visible = false
	drawing.Thickness = 2

	task.defer(cleardrawcache)
	task.wait(0.1)
	if drawing.__OBJECT_EXISTS then
		return {
			status = 500,
			message = "Drawing exists after draw clear",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.O():typeof(__modImpl())local v=__DIST.cache.O if not v then v={c=__modImpl()}__DIST.cache.O=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isrenderobj then
		return {
			status = 400,
			message = "Global not found",
		}
		elseif not Drawing or not Drawing.new then
		return {
			status = 401,
			message = "Drawing library needed to test this",
		}
	end

	local drawing = Drawing.new("Line")
	drawing.Visible = false

	if not isrenderobj(drawing) then
		return {
			status = 500,
			message = "Didn't return true for a render object",
		}
	elseif isrenderobj({}) or isrenderobj(game:GetService("Workspace")) then
		return {
			status = 500,
			message = "Returned true for a non-render object",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.P():typeof(__modImpl())local v=__DIST.cache.P if not v then v={c=__modImpl()}__DIST.cache.P=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getgenv then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    getfenv().MYRI = "Hello, World!"
    getgenv().MYRI1 = "Hello, World!"
    getgenv().MYRI2 = 123456789

    if getgenv().MYRI == "Hello, World!" then
        return {
            status = 500,
            message = "getfenv affected getgenv",
        }
    end
    if getgenv().MYRI1 ~= "Hello, World!" then
        return {
            status = 500,
            message = "MYRI1 not found or unexpected value",
        }
    elseif getgenv().MYRI2 ~= 123456789 then
        return {
            status = 500,
            message = "MYRI2 not found or unexpected value",
        }
    end

    --// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.Q():typeof(__modImpl())local v=__DIST.cache.Q if not v then v={c=__modImpl()}__DIST.cache.Q=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getrenv then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    getrenv().MYRIR1 = "Hello, World!"
    getrenv().MYRIR2 = 123456789

    if getrenv().MYRIR1 ~= "Hello, World!" then
        return {
            status = 500,
            message = "MYRIR1 not found or unexpected value",
        }
    elseif getrenv().MYRIR2 ~= 123456789 then
        return {
            status = 500,
            message = "MYRIR2 not found or unexpected value",
        }
    elseif getrenv().game ~= game then
        return {
            status = 500,
            message = "game not found or unexpected value",
        }
    elseif getrenv().print ~= print then
        return {
            status = 500,
            message = "print not found or unexpected value",
        }
    elseif getrenv()._G == _G then
        return {
            status = 500,
            message = "_G in roblox environment shouldn't match the executor's",
        }
    end

    --// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.R():typeof(__modImpl())local v=__DIST.cache.R if not v then v={c=__modImpl()}__DIST.cache.R=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getgc then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    local originalTable = {}
    local function originalFunction() end
    task.wait(0.1)

    local check1
    local check2
    for _, value in pairs(getgc(true)) do
        if value == originalFunction then
            check1 = true
        elseif value == originalTable then
            check2 = true
        end
    end

    if not check1 then
        return {
            status = 500,
            message = "Original function not found",
        }
    elseif not check2 then
        return {
            status = 500,
            message = "Original table not found",
        }
    end

    --// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.S():typeof(__modImpl())local v=__DIST.cache.S if not v then v={c=__modImpl()}__DIST.cache.S=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not filtergc then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local upvalue = "MYRIAD"
	local function originalFunction()
		return "MYRIAD", upvalue
	end

	local originalTable = setmetatable({
		MYRIAD = "MYRI",
	}, {
		__index = function() end
	})

	local _ = originalTable.MYRIAD -- Localize
	local _ = upvalue
	local _ = originalFunction()

	task.wait(0.1)

	local foundFunc = filtergc("function", {
		Constants = { "MYRIAD" },
		Upvalues = { "MYRIAD" },
		IgnoreExecutor = false,
	}, true)

	local foundTable = filtergc("table", {
		KeyValuePairs = { MYRIAD = "MYRI" },
		Metatable = getmetatable(originalTable),
	}, true)

	if foundFunc ~= originalFunction then
		return {
			status = 500,
			message = "filtergc failed to retrieve the original function",
		}
	elseif foundTable ~= originalTable then
		return {
			status = 500,
			message = "filtergc failed to retrieve the original table",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.T():typeof(__modImpl())local v=__DIST.cache.T if not v then v={c=__modImpl()}__DIST.cache.T=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getcustomasset then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "31kr6ji222uvn7zvz6ue5yfyn7ky")

	task.wait(0.2)

	local asset = getcustomasset(guid)

	if not typeof(asset) == "string" then
		return {
			status = 500,
			message = "Asset is not of the expected type (string)"
		}
	elseif not asset:match("rbxasset://") then
		return {
			status = 500,
			message = "Asset string dosen't include a rbxasset prefix"
		}
	end

	delfile(guid)
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.U():typeof(__modImpl())local v=__DIST.cache.U if not v then v={c=__modImpl()}__DIST.cache.U=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local guid2 = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local found1 = false
	local found2 = false
	
	writefile(guid, "")
	writefile(guid2, "")

	task.wait(0.2)

	for _, file in listfiles("") do
		if file == guid then
			found1 = true
		end
		if file == guid2 then
			found2 = true
		end
	end

	if not found1 and found2 then
		return {
			status = 500,
			message = "Didn't find the expected files"
		}
	end

	delfile(guid)
	delfile(guid2)
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.V():typeof(__modImpl())local v=__DIST.cache.V if not v then v={c=__modImpl()}__DIST.cache.V=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not loadfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local a, b = math.random(1, 100), math.random(1, 100)
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "return function(...) return select(1, ...) + select(2, ...) end")
	
	task.wait(0.2)
	
	local f = loadfile(guid)
	if not f then
		return {
			status = 500,
			message = "Failed to load file",
		}
	end
	
	if f()(a, b) ~= a + b then
		return {
			status = 500,
			message = "File did not return the expected value",
		}
	end
	
	delfile(guid)	
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.W():typeof(__modImpl())local v=__DIST.cache.W if not v then v={c=__modImpl()}__DIST.cache.W=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not appendfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not readfile then
		return {
			status = 401,
			message = "Dependency 'readfile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "Hello, ")

	task.wait(0.2)

	appendfile(guid, "World!")

	task.wait(0.2)

	if readfile(guid) ~= "Hello, World!" then
		return {
			status = 500,
			message = "File did not read the expected value",
		} 
	end

	delfile(guid)
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.X():typeof(__modImpl())local v=__DIST.cache.X if not v then v={c=__modImpl()}__DIST.cache.X=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not delfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not isfile then
		return {
			status = 401,
			message = "Dependency 'isfile' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(writefile, "test1.txt", "Content")
	local legal2Suc, legal2Msg = pcall(writefile, "./test2.txt", "Content")
	
	local illegal1Suc = pcall(writefile, "C:/test3.txt", "Content")
	local illegal2Suc = pcall(writefile, "../test4.txt", "Content")	

	if not legal1Suc then
		return {
			status = 0,
			message = "Failed to write @ test1.txt: " .. legal1Msg
		}
	elseif not legal2Suc then
		return {
			status = 0,
			message = "Failed to write @ ./test2.txt: " .. legal2Msg
		}
	elseif illegal1Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ C:/test3.txt"
		}
	elseif illegal2Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ ../test4.txt"
		}
	elseif not isfile("test1.txt") then
		return {
			status = 500,
			message = "Didn't find: test1.txt"
		}
	elseif not isfile("./test2.txt") then
		return {
			status = 500,
			message = "Didn't find: ./test2.txt"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")

	task.wait(0.2)

	if isfile("test1.txt") then
		return {
			status = 500,
			message = "Found: test1.txt"
		}
	elseif isfile("./test2.txt") then
		return {
			status = 500,
			message = "Found: ./test2.txt"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.Y():typeof(__modImpl())local v=__DIST.cache.Y if not v then v={c=__modImpl()}__DIST.cache.Y=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not delfolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not makefolder then
		return {
			status = 401,
			message = "Dependency 'makefolder' not found",
		}
	elseif not isfolder then
		return {
			status = 401,
			message = "Dependency 'isfolder' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfolder(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end
	
	makefolder(guid)

	task.wait(0.2)

	if not isfolder(guid) then
		return {
			status = 500,
			message = `Existing file returned false`,
		}
	end

	delfolder(guid)

	task.wait(0.2)

	if isfolder(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.Z():typeof(__modImpl())local v=__DIST.cache.Z if not v then v={c=__modImpl()}__DIST.cache.Z=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfile(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end
	
	writefile(guid, "")

	task.wait(0.2)

	if not isfile(guid) then
		return {
			status = 500,
			message = `Existing file returned false`,
		}
	end

	delfile(guid)
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST._():typeof(__modImpl())local v=__DIST.cache._ if not v then v={c=__modImpl()}__DIST.cache._=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isfolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not makefolder then
		return {
			status = 401,
			message = "Dependency 'makefolder' not found",
		}
	elseif not delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfolder(guid) --[[ isfolder("lebron james") -- always true ]] then
		return {
			status = 500,
			message = `Nonexistent folder returned true`,
		}
	end
	
	makefolder(guid)

	task.wait(0.2)

	if not isfolder(guid) then
		return {
			status = 500,
			message = `Existing folder returned false`,
		}
	end

	delfolder(guid)
	
	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aa():typeof(__modImpl())local v=__DIST.cache.aa if not v then v={c=__modImpl()}__DIST.cache.aa=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not writefile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	elseif not readfile then
		return {
			status = 401,
			message = "Dependency 'readfile' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(writefile, "test1.txt", "Content")
	local legal2Suc, legal2Msg = pcall(writefile, "./test2.txt", "Content")
	
	local illegal1Suc = pcall(writefile, "C:/test3.txt", "Content")
	local illegal2Suc = pcall(writefile, "../test4.txt", "Content")	

	if not legal1Suc then
		return {
			status = 0,
			message = "Failed to write @ test1.txt: " .. legal1Msg
		}
	elseif not legal2Suc then
		return {
			status = 0,
			message = "Failed to write @ ./test2.txt: " .. legal2Msg
		}
	elseif illegal1Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ C:/test3.txt"
		}
	elseif illegal2Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ ../test4.txt"
		}
	elseif readfile("test1.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't give expected contnet"
		}
	elseif readfile("test2.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't give expected contnet"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ab():typeof(__modImpl())local v=__DIST.cache.ab if not v then v={c=__modImpl()}__DIST.cache.ab=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not readfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	end

	--// Functionality test
	local writeSuc, writeMsg = pcall(writefile, "test1.txt", "Content")

	if not writeSuc then
		return {
			status = 0,
			message = "Failed to write @ test1.txt: " .. writeMsg
		}
	elseif readfile("test1.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't return the expected content"
		}
	end

	delfile("test1.txt")

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ac():typeof(__modImpl())local v=__DIST.cache.ac if not v then v={c=__modImpl()}__DIST.cache.ac=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not makefolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(makefolder, "test1")
	local legal2Suc, legal2Msg = pcall(makefolder, "./test2")
	
	local illegal1Suc = pcall(makefolder, "C:/test3")
	local illegal2Suc = pcall(makefolder, "../test4")	

	if not legal1Suc then
		return {
			status = 0,
			message = "Failed to make @ test1: " .. legal1Msg
		}
	elseif not legal2Suc then
		return {
			status = 0,
			message = "Failed to make @ ./test2: " .. legal2Msg
		}
	elseif illegal1Suc then
		return {
			status = 500,
			message = "Didn't fail to make in illegal location: @ C:/test3"
		}
	elseif illegal2Suc then
		return {
			status = 500,
			message = "Didn't fail to make in illegal location: @ ../test4"
		}
	end

	delfolder("test1")
	delfolder("./test2")

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ad():typeof(__modImpl())local v=__DIST.cache.ad if not v then v={c=__modImpl()}__DIST.cache.ad=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isrbxactive then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"iswindowactive",
		"isgameactive",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ae():typeof(__modImpl())local v=__DIST.cache.ae if not v then v={c=__modImpl()}__DIST.cache.ae=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not keypress then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.af():typeof(__modImpl())local v=__DIST.cache.af if not v then v={c=__modImpl()}__DIST.cache.af=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not keyrelease then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ag():typeof(__modImpl())local v=__DIST.cache.ag if not v then v={c=__modImpl()}__DIST.cache.ag=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not keytap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ah():typeof(__modImpl())local v=__DIST.cache.ah if not v then v={c=__modImpl()}__DIST.cache.ah=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse1click then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ai():typeof(__modImpl())local v=__DIST.cache.ai if not v then v={c=__modImpl()}__DIST.cache.ai=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse1press then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aj():typeof(__modImpl())local v=__DIST.cache.aj if not v then v={c=__modImpl()}__DIST.cache.aj=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse1release then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ak():typeof(__modImpl())local v=__DIST.cache.ak if not v then v={c=__modImpl()}__DIST.cache.ak=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse2click then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.al():typeof(__modImpl())local v=__DIST.cache.al if not v then v={c=__modImpl()}__DIST.cache.al=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse2press then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.am():typeof(__modImpl())local v=__DIST.cache.am if not v then v={c=__modImpl()}__DIST.cache.am=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mouse2release then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.an():typeof(__modImpl())local v=__DIST.cache.an if not v then v={c=__modImpl()}__DIST.cache.an=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mousemoveabs then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ao():typeof(__modImpl())local v=__DIST.cache.ao if not v then v={c=__modImpl()}__DIST.cache.ao=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mousemoverel then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ap():typeof(__modImpl())local v=__DIST.cache.ap if not v then v={c=__modImpl()}__DIST.cache.ap=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not mousescroll then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aq():typeof(__modImpl())local v=__DIST.cache.aq if not v then v={c=__modImpl()}__DIST.cache.aq=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setclipboard then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"toclipboard"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ar():typeof(__modImpl())local v=__DIST.cache.ar if not v then v={c=__modImpl()}__DIST.cache.ar=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setrbxclipboard then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.as():typeof(__modImpl())local v=__DIST.cache.as if not v then v={c=__modImpl()}__DIST.cache.as=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not gethui then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local container = gethui()
	if not (container:IsA("ScreenGui") or container:IsA("BasePlayerGui") or container:IsA("Folder")) then
		return {
			status = 500,
			message = "Container is not a ScreenGui, BasePlayerGui, or Folder",
		}
	end
	if container == game:GetService("CoreGui") then
		return {
			status = 500,
			message = "Container cannot be an uncloned reference to CoreGui",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"get_hidden_gui"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.at():typeof(__modImpl())local v=__DIST.cache.at if not v then v={c=__modImpl()}__DIST.cache.at=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not cloneref then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")
	local originalService = game:GetService("CoreGui")

	if cloneref(originalPart) == originalPart then
		return {
			status = 500,
			message = `Cloned part cannot be equal to original reference`,
		}
	elseif cloneref(originalService) == originalService then
		return {
			status = 500,
			message = `Cloned service cannot be equal to original reference`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"clonereference",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.au():typeof(__modImpl())local v=__DIST.cache.au if not v then v={c=__modImpl()}__DIST.cache.au=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not compareinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not cloneref then
		return {
			status = 401,
			message = "'cloneref' needed to test this reliably",
		}
	end

	local originalPart = Instance.new("Part")
	local originalService = game:GetService("CoreGui")

	if cloneref(originalPart) == originalPart then
		return {
			status = 500,
			message = `(CR) Cloned part cannot be equal to original reference`,
		}
	elseif cloneref(originalService) == originalService then
		return {
			status = 500,
			message = `(CR) Cloned service cannot be equal to original reference`,
		}

	elseif not compareinstances(game, game) then
		return {
			status = 500,
			message = `Two equal instances (game, game) assumed unequal`,
		}
	elseif compareinstances(game, workspace) then
		return {
			status = 500,
			message = `Two unequal instances (game, workspace) assumed equal`,
		}
	elseif not compareinstances(originalPart, cloneref(originalPart)) then
		return {
			status = 500,
			message = `Two equal instances (originalPart, clonedPart) assumed equal`,
		}
	elseif not compareinstances(originalService, cloneref(originalService)) then
		return {
			status = 500,
			message = `Two equal instances (originalService, clonedService) assumed equal`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.av():typeof(__modImpl())local v=__DIST.cache.av if not v then v={c=__modImpl()}__DIST.cache.av=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart1, found1 = Instance.new("Part"), false
	local originalPart2, found2 = Instance.new("Part", workspace), false
	
	originalPart2.Anchored = true
	originalPart2.Transparency = 1
	originalPart2.CanCollide = false
	originalPart2.Position = Vector3.new(0,-100,0)

	for _, v in pairs(getinstances()) do
		if v == originalPart1 then
			found1 = true
		elseif v == originalPart2 then
			found2 = true
		elseif not v:IsA("Instance") then
			return {
				status = 500,
				message = "Found a part that isn't an instance"
			}
		end
	end

	if not found1 then
		return {
			status = 500,
			message = "Didn't find a part w/ a nil parent"
		}
	elseif not found2 then
		return {
			status = 500,
			message = "Didn't find a part w/ a parent"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aw():typeof(__modImpl())local v=__DIST.cache.aw if not v then v={c=__modImpl()}__DIST.cache.aw=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getnilinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart1, found1 = Instance.new("Part"), false
	local originalPart2, found2 = Instance.new("Part", workspace), false
	local found3 = false

	originalPart2.Anchored = true
	originalPart2.Transparency = 1
	originalPart2.CanCollide = false
	originalPart2.Position = Vector3.new(0,-100,0)

	for _, v in pairs(getnilinstances()) do
		if v == originalPart1 then
			found1 = true
		elseif v == originalPart2 then
			found2 = true
		elseif v:IsDescendantOf(game) then
			found3 = true
		elseif not v:IsA("Instance") then
			return {
				status = 500,
				message = "Found a part that isn't an instance"
			}
		end
	end

	if not found1 then
		return {
			status = 500,
			message = "Didn't find a part w/ a nil parent"
		}
	elseif found2 or found3 then
		return {
			status = 500,
			message = "Found a part w/ a parent"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ax():typeof(__modImpl())local v=__DIST.cache.ax if not v then v={c=__modImpl()}__DIST.cache.ax=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local r1, r2, r3 = math.random(1, 10), math.random(1, 10), math.random(1, 10)
	local originalBindable1 = Instance.new("BindableFunction")
	local originalBindable2 = Instance.new("BindableFunction")
	local originalRemote = Instance.new("RemoteFunction")

	originalBindable1.OnInvoke = function(a, b)
		return (a + b) ^ r3
	end
	originalRemote.OnServerInvoke = function()
		return r3
	end

	local bindableCb1 = getcallbackvalue(originalBindable1, "OnInvoke")
	local bindableCb2 = getcallbackvalue(originalBindable2, "OnInvoke")
	local remoteCb = getcallbackvalue(originalRemote, "OnServerInvoke")

	if not bindableCb1 then
		return {
			status = 500,
			message = "Didn't return a callback value for a bindable",
		}
	elseif bindableCb2 then
		return {
			status = 500,
			message = "Returned a callback value for a bindable with none",
		}
	elseif not remoteCb then
		return {
			status = 500,
			message = "Returned a callback value for a remote with none",
		}
	elseif bindableCb1(r1, r2) ~= (r1 + r2) ^ r3 then
		return {
			status = 500,
			message = "Bindable's callback value didn't return the expected value",
		}
	elseif remoteCb(game.Players.LocalPlayer) ~= r3 then
		return {
			status = 500,
			message = "Remote's callback value didn't return the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getcallbackmember"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ay():typeof(__modImpl())local v=__DIST.cache.ay if not v then v={c=__modImpl()}__DIST.cache.ay=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not fireclickdetector then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part", workspace)
	local originalClickDetector = Instance.new("ClickDetector", originalPart)

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)

	local function testEvent(event)
		originalClickDetector[event]:Connect(function(player)
			if player ~= game:GetService("Players").LocalPlayer then
				return {
					status = 500,
					message = "Player passed wasn't the LocalPlayer"
				}
			end
		end)

		local success, returned = fireclickdetector(originalClickDetector, 0, event)

		if not success then
			return {
				status = 0,
				message = `Failed w/ error: {returned}`
			}
		end

		return true
	end

	local mouseClick = testEvent("MouseClick")
	local rightMouseClick = testEvent("RightMouseClick")
	local mouseHoverEnter = testEvent("MouseHoverEnter")
	local mouseHoverLeave = testEvent("MouseHoverLeave")

	game:GetService("RunService").PostSimulation:Wait()
	
	if not mouseClick then
		return {
			status = 500,
			message = "MouseClick event was not fired."
		}
	end
	if not rightMouseClick then
		return {
			status = 500,
			message = "RightMouseClick event was not fired."
		}
	end
	if not mouseHoverEnter then
		return {
			status = 500,
			message = "MouseHoverEnter event was not fired."
		}
	end
	if not mouseHoverLeave then
		return {
			status = 500,
			message = "MouseHoverLeave event was not fired."
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.az():typeof(__modImpl())local v=__DIST.cache.az if not v then v={c=__modImpl()}__DIST.cache.az=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not fireproximityprompt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local fired = false
	
	local localPlayer = game:GetService("Players").LocalPlayer
	local proximityPromptService = game:GetService("ProximityPromptService")
	local originalPart = Instance.new("Part", workspace)
	local originalProximityPrompt = Instance.new("ProximityPrompt", originalPart)

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)
	originalProximityPrompt.HoldDuration = 1

	proximityPromptService.PromptButtonHoldBegan:Connect(function(prompt) 
		return {
			status = 500,
			message = "Proximity prompt was manually fired"
		}
	end)

	proximityPromptService.PromptButtonHoldEnded:Connect(function(prompt) 
		return {
			status = 500,
			message = "Proximity prompt was manually fired"
		}
	end)

	originalProximityPrompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
		return {
			status = 500,
			message = "Modified HoldDuration"
		}
	end)

	originalProximityPrompt.Triggered:Connect(function(player)
		if player ~= localPlayer then
			return {
				status = 500,
				message = "Player passed wasn't the LocalPlayer"
			}
		end

		fired = true
	end)

	local success, returned = pcall(fireproximityprompt, originalProximityPrompt)

	game:GetService("RunService").PostSimulation:Wait()

	if not success then
		return {
			status = 0,
			message = `Failed w/ error: {returned}`
		}
	elseif not fired then
		return {
			status = 500,
			message = `Prompt was not triggered`
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aA():typeof(__modImpl())local v=__DIST.cache.aA if not v then v={c=__modImpl()}__DIST.cache.aA=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not firetouchinterest then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local touchPart = game.Players.LocalPlayer.Character.Head
	local touched = false
	local touchEnded = false
	local originalPart = Instance.new("Part")

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)
	originalPart.Parent = workspace

	originalPart.Touched:Connect(function(part: BasePart)
		if part ~= touchPart then
			originalPart:Destroy()

			return {
				status = 500,
				message = "Touch part given wasn't the passed touch part",
			}
		end

		touched = true
	end)

	originalPart.TouchEnded:Connect(function(part: BasePart)
		if part ~= touchPart then
			originalPart:Destroy()

			return {
				status = 500,
				message = "Touch part given wasn't the passed touch part",
			}
		end

		touchEnded = true
	end)

	firetouchinterest(touchPart, originalPart, false)
	game:GetService("RunService").PostSimulation:Wait()

	if not touched then
		return {
			status = 500,
			message = "Touched event wasn't fired",
		}
	end

	firetouchinterest(touchPart, originalPart, true)
	game:GetService("RunService").PostSimulation:Wait()

	if not touchEnded then
		return {
			status = 500,
			message = "Touched event wasn't fired",
		}
	end

	originalPart:Destroy()

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aB():typeof(__modImpl())local v=__DIST.cache.aB if not v then v={c=__modImpl()}__DIST.cache.aB=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not saveinstance then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not listfiles then
		return {
			status = 501,
			message = "Dependant global 'listfiles' not found",
		}
	elseif not delfile then
		return {
			status = 501,
			message = "Dependant global 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local part = Instance.new("Part")

	saveinstance(part, {
		FileName = guid
	})

	task.wait(0.5)

	local found = false

	for _, file in pairs(listfiles("")) do
		if file:find(guid) then
			found = true
			delfile(file)
		end
	end
	
	if not found then
		return {
			status = 500,
			message = "Couldn't find saved part. Args passed: (Instance, { FileName = string })"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aC():typeof(__modImpl())local v=__DIST.cache.aC if not v then v={c=__modImpl()}__DIST.cache.aC=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local rawMt = getrawmetatable(game)

	if typeof(rawMt) ~= "table" then
		return {
			status = 500,
			message = "Didn't return a table",
		}
	elseif rawMt.__index(game, "Workspace") ~= game:GetService("Workspace") then
		return {
			status = 500,
			message = "Didn't give correct index for Workspace",
		}
	elseif rawMt.__index(game, "ReplicatedStorage") ~= game:GetService("ReplicatedStorage") then
		return {
			status = 500,
			message = "Didn't give correct index for ReplicatedStorage",
		}
	elseif rawMt.__index(game, "Stats") ~= game:GetService("Stats") then
		return {
			status = 500,
			message = "Didn't give correct index for Stats",
		}
	end

	local methods = {
		__add = "add",
		__sub = "sub",
		__mul = "mul",
		__div = "div",
		__mod = "mod",
		__pow = "pow",
		__unm = "unm",
		__idiv = "idiv",
		__band = "band",
		__bor = "bor",
		__bxor = "bxor",
		__bnot = "bnot",
		__shl = "shl",
		__shr = "shr",
		__concat = "concat",
		__len = "len",
		__eq = "eq",
		__lt = "lt",
		__le = "le",
		__call = "call",
	}
	
	for method, name in pairs(methods) do
		if rawMt[method] then
			return {
				status = 500,
				message = `Found {name} metamethod in the raw meta table`,
			}
		end
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aD():typeof(__modImpl())local v=__DIST.cache.aD if not v then v={c=__modImpl()}__DIST.cache.aD=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalObject = setmetatable({}, {
		__index = function()
			return false
		end,
		__metatable = "Locked",
	})
	local returnedObject = setrawmetatable(originalObject, {
		__index = function()
			return true
		end,
	})

	if not originalObject then
		return {
			status = 500,
			message = "Original object not given",
		}
	elseif originalObject.MYRI ~= true then
		return {
			status = 500,
			message = "Return function gave true, MYRI not found",
		}
	elseif not returnedObject then
		return {
			status = 500,
			message = "Returned object not given",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.aE():typeof(__modImpl())local v=__DIST.cache.aE if not v then v={c=__modImpl()}__DIST.cache.aE=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not hookmetamethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local hooked = false
	local originalCall

	originalCall = hookmetamethod(game, "__namecall", function( ...)
		hooked = true

		return originalCall(...)
	end)

	game:GetService("RunService").Heartbeat:Wait()

	if not hooked then
		return {
			status = 500,
			message = "Failed to hook __namecall metamethod",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.aF():typeof(__modImpl())local v=__DIST.cache.aF if not v then v={c=__modImpl()}__DIST.cache.aF=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getnamecallmethod then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not hookmetamethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")
	local method = false
	local originalCall

	originalCall = hookmetamethod(originalPart, "__namecall", function(...)
		if not method then
			method = getnamecallmethod()
		end

		return originalCall(...)
	end)

	originalPart:Destroy()
	task.wait()

	if method ~= "Destroy" then
		return {
			status = 500,
			message = "Didn't return the correct method",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.aG():typeof(__modImpl())local v=__DIST.cache.aG if not v then v={c=__modImpl()}__DIST.cache.aG=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setreadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalTable = table.freeze{
		MYRIAD = "MYRI"
	}

	local freezeSuccess, message = pcall(function()
		originalTable.MYRIAD = "MYRIAD"
	end)
	local writeSuccess, message = pcall(function()
		setreadonly(originalTable, false)
		originalTable.MYRIAD = "MYRIAD"
	end)
	local reFreezeSuccess, message = pcall(function()
		setreadonly(originalTable, true)
		originalTable.MYRIAD = "MYRIAD"
	end)

	if freezeSuccess then
		return {
			status = 500,
			message = "Frozen table writable (???): " .. message
		}
	elseif not writeSuccess then
		return {
			status = 500,
			message = "Table unwritable after readonly was disabled: " .. message
		}
	elseif reFreezeSuccess then
		return {
			status = 500,
			message = "Table writable after readonly was enabled: " .. message
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aH():typeof(__modImpl())local v=__DIST.cache.aH if not v then v={c=__modImpl()}__DIST.cache.aH=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not makereadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalTable = table.freeze{
		MYRIAD = "MYRI"
	}

	local freezeSuccess, message = pcall(function()
		originalTable.MYRIAD = "MYRIAD"
	end)
	local writeSuccess, message = pcall(function()
		makereadonly(originalTable)
		originalTable.MYRIAD = "MYRIAD"
	end)

	if freezeSuccess then
		return {
			status = 500,
			message = "Frozen table writable (???): " .. message
		}
	elseif writeSuccess then
		return {
			status = 500,
			message = "Table unwritable after readonly was disabled: " .. message
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aI():typeof(__modImpl())local v=__DIST.cache.aI if not v then v={c=__modImpl()}__DIST.cache.aI=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isreadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalTable = {}

	if isreadonly(originalTable) then
		return {
			status = 500,
			message = "Writable table is assumed read-only"
		}
	end

	table.freeze(originalTable)

	if not isreadonly(originalTable) then
		return {
			status = 500,
			message = "Table assumed writable after being set as read-only"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aJ():typeof(__modImpl())local v=__DIST.cache.aJ if not v then v={c=__modImpl()}__DIST.cache.aJ=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not identifyexecutor then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	local executor, vers = identifyexecutor()
    if not executor or not vers then
        return {
			status = 500,
			message = `Did not return expected data (executor, version)`,
		}
	elseif type(executor) ~= "string" or type(vers) ~= "string" then
		return {
			status = 500,
			message = `Expected [string, string] got [{executor}, {vers}]`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getexecutorname"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed ({executor}, {vers})`,
	}
end
end function __DIST.aK():typeof(__modImpl())local v=__DIST.cache.aK if not v then v={c=__modImpl()}__DIST.cache.aK=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setfpscap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	local renderStepped = game:GetService("RunService").RenderStepped

	local function step()
		renderStepped:Wait()
		local average = 0
		for _ = 1, 10 do
			average += 1 / renderStepped:Wait()
		end
		return math.round(average / 10)
	end

	setfpscap(60)
	local step60 = step()
	setfpscap(0)
	local step0 = step()

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed (60: {step60}, 0: {step0})`,
	}
end
end function __DIST.aL():typeof(__modImpl())local v=__DIST.cache.aL if not v then v={c=__modImpl()}__DIST.cache.aL=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getfpscap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	if typeof(getfpscap()) ~= "number" then
		return {
			status = 500,
			message = `Did not return a number`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aM():typeof(__modImpl())local v=__DIST.cache.aM if not v then v={c=__modImpl()}__DIST.cache.aM=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not request then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	local response = request({
		Url = "https://httpbin.org/user-agent",
		Method = "GET",
	})

	if typeof(response) ~= "table" then
		return {
			status = 500,
			message = "Reponse wasn't a table"
		}
	elseif response.StatusCode ~= 200 then
		return {
			status = 500,
			message = "Didn't give status 200 (is httpbin.org down?)"
		}
	end

	local data = game:GetService("HttpService"):JSONDecode(response.Body)
	if type(data) ~= "table" and type(data["user-agent"]) ~= "string" then
		return {
			status = 500,
			message = "Didn't give a table w/ user-agent string"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"http.request",
		"http_request"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed ({data["user-agent"]})`,
	}
end
end function __DIST.aN():typeof(__modImpl())local v=__DIST.cache.aN if not v then v={c=__modImpl()}__DIST.cache.aN=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not lz4compress then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local referenceCompressed = referenceCrypt.base64decode("YE1ZUklBRA==")
	local compressed = lz4compress(plaintext)

	if typeof(compressed) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif compressed ~= referenceCompressed then
		return {
			status = 500,
			message = "Compressed data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"crypt.lz4compress"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.aO():typeof(__modImpl())local v=__DIST.cache.aO if not v then v={c=__modImpl()}__DIST.cache.aO=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local referenceCrypt = __DIST.r()

	if not lz4decompress then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local referenceCompressed = referenceCrypt.base64decode("YE1ZUklBRA==")
	local decompressed = lz4decompress(referenceCompressed, #plaintext)

	if typeof(decompressed) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif decompressed ~= plaintext then
		return {
			status = 500,
			message = "Compressed data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"crypt.lz4decompress"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.aP():typeof(__modImpl())local v=__DIST.cache.aP if not v then v={c=__modImpl()}__DIST.cache.aP=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getfpscap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"queueonteleport"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aQ():typeof(__modImpl())local v=__DIST.cache.aQ if not v then v={c=__modImpl()}__DIST.cache.aQ=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not messagebox then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aR():typeof(__modImpl())local v=__DIST.cache.aR if not v then v={c=__modImpl()}__DIST.cache.aR=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleprint then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aS():typeof(__modImpl())local v=__DIST.cache.aS if not v then v={c=__modImpl()}__DIST.cache.aS=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleinfo then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aT():typeof(__modImpl())local v=__DIST.cache.aT if not v then v={c=__modImpl()}__DIST.cache.aT=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsolewarn then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aU():typeof(__modImpl())local v=__DIST.cache.aU if not v then v={c=__modImpl()}__DIST.cache.aU=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleerr then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end
	
	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aV():typeof(__modImpl())local v=__DIST.cache.aV if not v then v={c=__modImpl()}__DIST.cache.aV=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleinput then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aW():typeof(__modImpl())local v=__DIST.cache.aW if not v then v={c=__modImpl()}__DIST.cache.aW=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleclear then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aX():typeof(__modImpl())local v=__DIST.cache.aX if not v then v={c=__modImpl()}__DIST.cache.aX=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsolename then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aY():typeof(__modImpl())local v=__DIST.cache.aY if not v then v={c=__modImpl()}__DIST.cache.aY=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsolehide then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.aZ():typeof(__modImpl())local v=__DIST.cache.aZ if not v then v={c=__modImpl()}__DIST.cache.aZ=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not rconsoleshow then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a_():typeof(__modImpl())local v=__DIST.cache.a_ if not v then v={c=__modImpl()}__DIST.cache.a_=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not sethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not gethiddenproperty then
		return {
			status = 401,
			message = "Dependant global 'gethiddenproperty' not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part")

	local prop1Value, prop1Hidden = gethiddenproperty(originalPart, "Name")
	local prop2Value, prop2Hidden = gethiddenproperty(originalPart, "siz")
	
	if prop1Hidden then
		return {
			status = 500,
			message = "Non-hidden property assumed hidden",
		}
	elseif prop1Value ~= "Part" then
		return {
			status = 500,
			message = "Non-hidden property value incorrect",
		}
	elseif not prop2Hidden then
		return {
			status = 500,
			message = "Hidden property assumed non-hidden",
		}
	elseif prop2Value ~= "can't get value" then
		return {
			status = 500,
			message = "Hidden property value incorrect",
		}
	end

	sethiddenproperty(originalPart, "siz", "can get value")

	if not gethiddenproperty(originalPart, "siz") == "can get value" then
		return {
			status = 500,
			message = "Hidden property's value was incorrectly set"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a0():typeof(__modImpl())local v=__DIST.cache.a0 if not v then v={c=__modImpl()}__DIST.cache.a0=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not gethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part")

	local prop1Value, prop1Hidden = gethiddenproperty(originalPart, "Name")
	local prop2Value, prop2Hidden = gethiddenproperty(originalPart, "siz")
	
	if prop1Hidden then
		return {
			status = 500,
			message = "Non-hidden property assumed hidden",
		}
	elseif prop1Value ~= "Part" then
		return {
			status = 500,
			message = "Non-hidden property value incorrect",
		}
	elseif not prop2Hidden then
		return {
			status = 500,
			message = "Hidden property assumed non-hidden",
		}
	elseif prop2Value ~= "can't get value" then
		return {
			status = 500,
			message = "Hidden property value incorrect",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a1():typeof(__modImpl())local v=__DIST.cache.a1 if not v then v={c=__modImpl()}__DIST.cache.a1=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setthreadidentity then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"setidentity",
		"setthreadcontext"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a2():typeof(__modImpl())local v=__DIST.cache.a2 if not v then v={c=__modImpl()}__DIST.cache.a2=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getthreadidentity then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	if typeof(getthreadidentity()) ~= "number" then
		return {
			status = 500,
			message = "Did not return a number",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getidentity",
		"getthreadcontext"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a3():typeof(__modImpl())local v=__DIST.cache.a3 if not v then v={c=__modImpl()}__DIST.cache.a3=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not setscriptable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")

	if pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "Unaccessible property accessible",
		}
	end

	setscriptable(originalPart, "MaterialVariantSerialized", true)
	if not pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "MaterialVariantSerialized inaccessible after being set as scriptable",
		}
	end

	setscriptable(originalPart, "MaterialVariantSerialized", false)
	if pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "MaterialVariantSerialized accessible after being set as unscriptable",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a4():typeof(__modImpl())local v=__DIST.cache.a4 if not v then v={c=__modImpl()}__DIST.cache.a4=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isscriptable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")

	if not isscriptable(originalPart, "Name") then
		return {
			status = 500,
			message = "Accessible property 'Name' assumed inaccessible",
		}
	elseif isscriptable(originalPart, "MaterialVariantSerialized") then
		return {
			status = 500,
			message = "Inaccessible property 'MaterialVariantSerialized' assumed accessible",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a5():typeof(__modImpl())local v=__DIST.cache.a5 if not v then v={c=__modImpl()}__DIST.cache.a5=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local localScript = Instance.new("LocalScript")
	local moduleScript = Instance.new("ModuleScript")
	local serverScript = Instance.new("Script")
	local clientRunContextScript = Instance.new("Script")
	clientRunContextScript.RunContext = Enum.RunContext.Client
	local scripts = getscripts()

	if not table.find(scripts, localScript) then
		return {
			status = 500,
			message = "LocalScript not found in returned table",
		}
	elseif not table.find(scripts, moduleScript) then
		return {
			status = 500,
			message = "ModuleScript not found in returned table",
		}
	elseif not table.find(scripts, clientRunContextScript) then
		return {
			status = 500,
			message = "ServerScript w/ client runcontext not found in returned table",
		}
	elseif table.find(scripts, serverScript) then
		return {
			status = 500,
			message = "ServerScript found in returned table",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a6():typeof(__modImpl())local v=__DIST.cache.a6 if not v then v={c=__modImpl()}__DIST.cache.a6=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getrunningscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
	local runningScript = game.Players.LocalPlayer.Character:FindFirstChild("whysoud")
	local disabledScript = game.Players.LocalPlayer.Character:FindFirstChild("whysodtc")
	local nonrunningScript = game.Players.LocalPlayer.Character:FindFirstChild("maybeisdtc")
	-- Having all of these are not neccessary, but might as well keep them (This was cloned from ./getscripts.luau)
	local localScript = Instance.new("LocalScript")
	local moduleScript = Instance.new("ModuleScript")
	local serverScript = Instance.new("Script")
	local clientRunContextScript = Instance.new("Script")
	clientRunContextScript.RunContext = Enum.RunContext.Client
	local runningScripts = getrunningscripts()

	if table.find(runningScripts, localScript) then
		return {
			status = 500,
			message = "LocalScript found in returned table",
		}
	elseif table.find(runningScripts, moduleScript) then
		return {
			status = 500,
			message = "ModuleScript found in returned table",
		}
	elseif table.find(runningScripts, clientRunContextScript) then
		return {
			status = 500,
			message = "ServerScript w/ client runcontext found in returned table",
		}
	elseif table.find(runningScripts, serverScript) then
		return {
			status = 500,
			message = "ServerScript found in returned table",
		}
	elseif table.find(runningScripts, disabledScript) then
		return {
			status = 500,
			message = "Disabled script found in returned table",
		}
	elseif table.find(runningScripts, nonrunningScript) then
		return {
			status = 500,
			message = "Non-running script found in returned table",
		}
	elseif not table.find(runningScripts, animate) or not table.find(runningScripts, runningScript) then
		return {
			status = 500,
			message = "Didn't find a running script in the returned table"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a7():typeof(__modImpl())local v=__DIST.cache.a7 if not v then v={c=__modImpl()}__DIST.cache.a7=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getcallingscript then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not checkcaller then
		return {
			status = 401,
			message = "Dependency 'checkcaller' not found"
		}
	elseif not hookmetamethod then
		return {
			status = 401,
			message = "Dependency 'hookmetamethod' not found"
		}
	end

	--// Functionality test
	local original;
	original = hookmetamethod(game, "__index", function(self, index)
		if not checkcaller() then
			local caller = getcallingscript()

			hookmetamethod(game, "__index", original)
		end

		return original(self, index)
	end) -- https://docs.sunc.su/Scripts/getcallingscript/#example

	if getcallingscript() then
		return {
			status = 500,
			message = "Executor call assumed to be a game call"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a8():typeof(__modImpl())local v=__DIST.cache.a8 if not v then v={c=__modImpl()}__DIST.cache.a8=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local indexedModule, module = pcall(function() return game:GetService("StarterPlayer").StarterPlayerScripts.PlayerModule end)
	if not getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedModule then
		return {
			status = 401,
			message = "Testing dependency 'PlayerModule' not found.",
		}
	end

	--// Functionality test
	local loadedModule = require(module)
	local unloadedModule = Instance.new("ModuleScript")

	local loadedModules = getloadedmodules()
	if not table.find(loadedModules, module) then
		return {
			status = 500,
			message = "Loaded module not found in returned table",
		}
	elseif table.find(loadedModules, unloadedModule) then
		return {
			status = 500,
			message = "Unloaded module found in returned table",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.a9():typeof(__modImpl())local v=__DIST.cache.a9 if not v then v={c=__modImpl()}__DIST.cache.a9=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local indexedAnimate, Animate = pcall(function()
		return game.Players.LocalPlayer.Character.Animate
	end)
	if not getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedAnimate then
		return {
			status = 401,
			message = "Testing dependency 'Animate' not found.",
		}
	end

	--// Functionality test
	local enironment = getsenv(Animate)
	if not enironment.onSwimming or not typeof(enironment.onSwimming) == "function" then
		return {
			status = 500,
			message = "Global in test script wasn't found, or didn't return the right type",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.ba():typeof(__modImpl())local v=__DIST.cache.ba if not v then v={c=__modImpl()}__DIST.cache.ba=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local indexedAnimate, Animate = pcall(function() return game.Players.LocalPlayer.Character.Animate end)
	if not getscripthash then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedAnimate then
		return {
			status = 401,
			message = "Testing dependency 'Animate' not found.",
		}
	end

	local noBytecodeScript = Instance.new("LocalScript")
	local animateSuccess, animateReturned = pcall(function()
		return getscripthash(Animate)
	end)
	local noBytecodeSuccess, noBytecodeReturned = pcall(function()
		return getscripthash(noBytecodeScript)
	end)

	if not animateSuccess then
		return {
			status = 500,
			message = "Failed to get bytecode of 'Animate': " .. animateReturned,
		}
	elseif not noBytecodeSuccess then
		return {
			status = 500,
			message = "Failed to get script w/ no bytecode. Errored instead of returning nil.",
		}
	elseif typeof(animateReturned) ~= "string" then
		return {
			status = 500,
			message = "Did not return a hash string",
		}
	elseif hashNoBytecode ~= nil then
		return {
			status = 500,
			message = "A script with no bytecode returned non-nil data",
		}
	end

	local newAnimate = Animate:Clone()
	local oldSource = Animate.Source
	Animate.Source = "return 1"
	local newHash = getscripthash(Animate)

	if animateReturned == newHash then
		return {
			status = 500,
			message = "Gave the same hash for a modified script",
		}
	end

	Animate.Source = oldSource

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bb():typeof(__modImpl())local v=__DIST.cache.bb if not v then v={c=__modImpl()}__DIST.cache.bb=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not loadstring then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local func = loadstring("MYRIAD", "MYRIAD")

	loadstring([[
		globalVar = {"Hello", "World"}
	]])()
	
	if not globalVar or not (globalVar[1] == "Hello" and globalVar[2] == "World") then
		return {
			status = 500,
			message = "Global variable insert from loadstring not found",
		}
	elseif func ~= nil then
		return {
			status = 500,
			message = "Didn't error on incomplete expression",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bc():typeof(__modImpl())local v=__DIST.cache.bc if not v then v={c=__modImpl()}__DIST.cache.bc=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local cryptReference = __DIST.r()
	if not getrunningscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalScript = game.Players.LocalPlayer.Character:FindFirstChild("whysoud")
	local bytecode = getscriptbytecode(originalScript)
	local expectedSegments = {
		"sigma",
		"task",
		"wait",
		"GOT A DROP ON THIS FLEXING FELLA<MYRIAD_UD_MAX_UD_NEVER_SPEAK_TO_ME_AGAIN_KING_VON_IS_A_SAINT",
		"tostring"
	}

	for _, v in pairs(expectedSegments) do
		if not bytecode:find(v) then
			return {
				status = 500,
				message = "Didn't find an expected segment in the bytecode"
			}
		end
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"dumpstring"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bd():typeof(__modImpl())local v=__DIST.cache.bd if not v then v={c=__modImpl()}__DIST.cache.bd=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local cryptReference = __DIST.r()
	if not getscriptclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalScript = game.Players.LocalPlayer.Character:FindFirstChild("maybeisdtc")
	local closure = getscriptclosure(originalScript)

	if typeof(closure) ~= "function" then
		return {
			status = 500,
			message = "Expected a closure"
		}
	elseif closure() ~= "GOT A DROP ON THIS FLEXING FELLA" then
		return {
			status = 500,
			message = "Closure did not return the expected value"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"getscriptfunction"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.be():typeof(__modImpl())local v=__DIST.cache.be if not v then v={c=__modImpl()}__DIST.cache.be=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	local indexedDcmpScript, dcmp = pcall(function()
		return game.ReplicatedFirst.decompmeplssss
	end)

	if not decompile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedDcmpScript then
		return {
			status = 401,
			message = "Testing dependency 'ReplicatedFirst.decompmeplssss' not found.",
		}
	end

	--// Functionality test
	local function checkPatterns(source, patterns)
		local missing = {}
		for _, pattern in ipairs(patterns) do
			if not source:find(pattern, 1, true) then
				table.insert(missing, pattern)
			end
		end

		if #missing > 0 then
			return false, missing
		end

		return true
	end

	local dcmpDecompiled = decompile(dcmp)

	if typeof(dcmpDecompiled) ~= "string" then
		return {
			status = 500,
			message = "Decompiled script isn't a string",
		}
	elseif #dcmpDecompiled <= 0 then
		return {
			status = 500,
			message = "Decompiled script didn't return anything",
		}
	end

	local passed, missing = checkPatterns(dcmpDecompiled, {
		"truthy",
		"falsey",
		"123",
		"456",
		"TableWeirdness",
		"func",
		"inline-fn",
		"loopFn",
		"nil-check",
		"true-check",
		"fallback",
		"setmetatable",
		"__index",
		"secret",
		"found",
		"MethodStyle",
	})

	if not passed then
		return {
			status = 500,
			message = "Decompiled script missing expected strings: " .. table.concat(missing, ", "),
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})
	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
end function __DIST.bf():typeof(__modImpl())local v=__DIST.cache.bf if not v then v={c=__modImpl()}__DIST.cache.bf=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not isparallel then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not run_on_actor then
		return {
			status = 401,
			message = "Dependency 'run_on_actor' not found",
		}
	end

	--// Functionality test
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if isparallel() then
		return {
			status = 500,
			message = "Non-parallel thread assumed to be in a parallel state"
		}
	end

	-- Technically we should be able to set synchronization directly in this thread, but some executors might break doing so.
	run_on_actor(actor, [[
		print("MYRIAD: Ignore start -----------")
		task.desynchronize()
		if isparallel() then
			task.synchronize()
			print("MYRIAD: Ignore end -----------")
			local originalPart = Instance.new("Part")
			originalPart.Name = os.date("%H") .. "(1)"
			originalPart.Parent = game.ReplicatedStorage
		end
	]])

	task.wait(0.1)

	if not game.ReplicatedStorage:FindFirstChild(os.date("%H") .. "(1)") then
		return {
			status = 500,
			message = "Parallel thread assumed to be in a non-parallel state"
		}
	end

	task.wait()

	if isparallel() then
		return {
			status = 500,
			message = "Non-parallel thread assumed to be in a parallel state"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end


--// Old check
-- This may just be an AWP problem and this test is actually correct, but I don't feel like checking

--[[ --!nocheck
--!nolint

return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local passed = false
	local r1 = math.random(1, 255)
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to actor",
		}
	end

	local function isBindable(obj)
		if typeof(obj) == "Instance" and obj:IsA("BindableEvent") then
			return true
		end
	
		if typeof(obj) ~= "table" then
			return false, "object is not a table"
		end
	
		if typeof(obj.Event) ~= "RBXScriptSignal" and typeof(obj.Event) ~= "table" then
			return false, "missing or invalid 'Event'"
		end
	
		if typeof(obj.Event.Connect) ~= "function" then
			return false, "missing or invalid 'Event.Connect'"
		end
	
		if typeof(obj.Fire) ~= "function" then
			return false, "missing or invalid 'Fire'"
		end
	
		return true
	end
	
	local comm_id, eventObject = create_comm_channel()
	local success, prop = isBindable(eventObject)
	
	if not success then
		return {
			status = 500,
			message = `EventObject isn't Bindable: {prop}`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(num)
		if num ~= r1 ^ 2 then
			return {
				status = 500,
				message = "Passed argument[1] wasn't the expected value",
			}
		end

		passed = true
	end)

	eventObject:Fire(r1 ^ 2)

	task.wait()

	if not passed then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
 ]]end function __DIST.bg():typeof(__modImpl())local v=__DIST.cache.bg if not v then v={c=__modImpl()}__DIST.cache.bg=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not run_on_actor then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed find to actor"
		}
	end

	run_on_actor(actor, [[local originalPart = Instance.new("Part")
		originalPart.Name = os.date("%H")
		originalPart.Parent = game.ReplicatedStorage
	]])

task.wait(0.1)

	if not game.ReplicatedStorage:FindFirstChild(os.date("%H")) then
		return {
			status = 500,
			message = "Failed to find a part created by the actor"
		}
	end

	game.ReplicatedStorage:FindFirstChild(os.date("%H")):Destroy()

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bh():typeof(__modImpl())local v=__DIST.cache.bh if not v then v={c=__modImpl()}__DIST.cache.bh=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not run_on_actor then
		return {
			status = 401,
			message = "Dependency 'run_on_actor' not found",
		}
	elseif not get_comm_channel then
		return {
			status = 401,
			message = "Dependency 'get_comm_channel' not found",
		}
	end

	--// Functionality test
	local passed = 0
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to find actor",
		}
	end
	
	local comm_id, eventObject = create_comm_channel()

	if not eventObject then
		return {
			status = 500,
			message = `EventObject dosen't exist`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(arg)
		if arg ~= "abs" then
			passed = -1
		end

		passed = 1
	end)

	run_on_actor(actor, [[
		local channel = get_comm_channel(...)
		channel:Fire('abs')
	]], comm_id)

	task.wait(0.1)

	if passed == 0 then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	elseif not passed == -1 then
		return {
			status = 500,
			message = "Passed argument[1] wasn't the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end


--// Old check
-- This may just be an AWP problem and this test is actually correct, but I don't feel like checking

--[[ --!nocheck
--!nolint

return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local passed = false
	local r1 = math.random(1, 255)
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to actor",
		}
	end

	local function isBindable(obj)
		if typeof(obj) == "Instance" and obj:IsA("BindableEvent") then
			return true
		end
	
		if typeof(obj) ~= "table" then
			return false, "object is not a table"
		end
	
		if typeof(obj.Event) ~= "RBXScriptSignal" and typeof(obj.Event) ~= "table" then
			return false, "missing or invalid 'Event'"
		end
	
		if typeof(obj.Event.Connect) ~= "function" then
			return false, "missing or invalid 'Event.Connect'"
		end
	
		if typeof(obj.Fire) ~= "function" then
			return false, "missing or invalid 'Fire'"
		end
	
		return true
	end
	
	local comm_id, eventObject = create_comm_channel()
	local success, prop = isBindable(eventObject)
	
	if not success then
		return {
			status = 500,
			message = `EventObject isn't Bindable: {prop}`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(num)
		if num ~= r1 ^ 2 then
			return {
				status = 500,
				message = "Passed argument[1] wasn't the expected value",
			}
		end

		passed = true
	end)

	eventObject:Fire(r1 ^ 2)

	task.wait()

	if not passed then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
 ]]end function __DIST.bi():typeof(__modImpl())local v=__DIST.cache.bi if not v then v={c=__modImpl()}__DIST.cache.bi=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint

--// Is literally just create_comm_channel 🤔


return function()
	if not get_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not run_on_actor then
		return {
			status = 401,
			message = "Dependency 'run_on_actor' not found",
		}
	elseif not create_comm_channel then
		return {
			status = 401,
			message = "Dependency 'create_comm_channel' not found",
		}
	end

	--// Functionality test
	local passed = 0
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to find actor",
		}
	end
	
	local comm_id, eventObject = create_comm_channel()

	if not eventObject then
		return {
			status = 500,
			message = `EventObject dosen't exist`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(arg)
		if arg ~= "abs" then
			passed = -1
		end

		passed = 1
	end)

	run_on_actor(actor, [[
		local channel = get_comm_channel(...)
		channel:Fire('abs')
	]], comm_id)

	task.wait(0.1)

	if passed == 0 then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	elseif not passed == -1 then
		return {
			status = 500,
			message = "Passed argument[1] wasn't the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end


--// Old check
-- This may just be an AWP problem and this test is actually correct, but I don't feel like checking

--[[ --!nocheck
--!nolint

return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local passed = false
	local r1 = math.random(1, 255)
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to actor",
		}
	end

	local function isBindable(obj)
		if typeof(obj) == "Instance" and obj:IsA("BindableEvent") then
			return true
		end
	
		if typeof(obj) ~= "table" then
			return false, "object is not a table"
		end
	
		if typeof(obj.Event) ~= "RBXScriptSignal" and typeof(obj.Event) ~= "table" then
			return false, "missing or invalid 'Event'"
		end
	
		if typeof(obj.Event.Connect) ~= "function" then
			return false, "missing or invalid 'Event.Connect'"
		end
	
		if typeof(obj.Fire) ~= "function" then
			return false, "missing or invalid 'Fire'"
		end
	
		return true
	end
	
	local comm_id, eventObject = create_comm_channel()
	local success, prop = isBindable(eventObject)
	
	if not success then
		return {
			status = 500,
			message = `EventObject isn't Bindable: {prop}`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(num)
		if num ~= r1 ^ 2 then
			return {
				status = 500,
				message = "Passed argument[1] wasn't the expected value",
			}
		end

		passed = true
	end)

	eventObject:Fire(r1 ^ 2)

	task.wait()

	if not passed then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
 ]]end function __DIST.bj():typeof(__modImpl())local v=__DIST.cache.bj if not v then v={c=__modImpl()}__DIST.cache.bj=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not getactors then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local found = false
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	for i, v in pairs(getactors()) do
		if v == actor then
			found = true
		end
	end

	if not found then
		return {
			status = 500,
			message = "Didn't find a game actor"
		}
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bk():typeof(__modImpl())local v=__DIST.cache.bk if not v then v={c=__modImpl()}__DIST.cache.bk=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint


return function()
	if not WebSocket or not WebSocket.connect then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local socket = WebSocket.connect("wss://echo.websocket.org/")
	if not (type(socket) == "table" or type(socket) == "userdata") then
		return {
			status = 500,
			message = "Didn't give a table | userdata",
		}
	end

	for property, expected in pairs({
		-- prop name, type(s)[subtype(s), tableProp]
		["OnClose"] = {"RBXScriptSignal", {["table"] = {"Connect", "Once", "Wait"}}},
		["OnMessage"] = {"RBXScriptSignal", {["table"] = {"Connect", "Once", "Wait"}}},
		["Send"] = "function",
		["Close"] = "function",
	}) do
		local success, value = pcall(function()
			return socket[property]
		end)
	
		if not success or value == nil then
			return {
				status = 500,
				message = `WebSocketObject is missing: {property}`,
			}
		end
	
		local expectedType = typeof(expected) == "table" and expected[1] or expected
		if typeof(value) ~= expectedType then
			return {
				status = 500,
				message = `WebSocketObject.{property} is not a {expectedType} (got {typeof(value)})`,
			}
		end
	
		if typeof(expected) == "table" and expected[2] and typeof(expected[2]) == "table" then
			for containerType, subProps in pairs(expected[2]) do
				if containerType == "table" and typeof(value) == "table" then
					for _, subProp in ipairs(subProps) do
						if typeof(value[subProp]) ~= "function" then
							return {
								status = 500,
								message = `WebSocketObject.{property}.{subProp} is not a function`,
							}
						end
					end
				end
			end
		end
	end
	
	if result then
		return result
	end

	--// Alias test
	local envIndex, failedIndex = __DIST.b()({
		"websocket.connect",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
end function __DIST.bl():typeof(__modImpl())local v=__DIST.cache.bl if not v then v={c=__modImpl()}__DIST.cache.bl=v end return v.c end end do local function __modImpl()
return {
		cache = {
			["cache.invalidate"] = __DIST.c(),
			["cache.iscached"] = __DIST.d(),
			["cache.replace"] = __DIST.e(),
		},

		Closures = {
			["islclosure"] = __DIST.f(),
			["iscclosure"] = __DIST.g(),
			["isexecutorclosure"] = __DIST.h(),
			["newcclosure"] = __DIST.i(),
			["clonefunction"] = __DIST.j(),
			["hookfunction"] = __DIST.k(),
			["restorefunction"] = __DIST.l(),
			["getfunctionhash"] = __DIST.m(),
			["checkcaller"] = __DIST.n(),
		},

		crypt = {
			["crypt.encrypt"] = __DIST.s(),
			["crypt.decrypt"] = __DIST.t(),
			["crypt.generatekey"] = __DIST.u(),
			["crypt.generatebytes"] = __DIST.v(),
			["crypt.base64encode"] = __DIST.w(),
			["crypt.base64decode"] = __DIST.x(),
			["crypt.hash"] = __DIST.y(),
			["crypt.random"] = __DIST.z(),
			["crypt.hmac"] = __DIST.A(),
		},

		debug = {
			["debug.getconstant"] = __DIST.B(),
			["debug.getconstants"] = __DIST.C(),
			["debug.getproto"] = __DIST.D(),
			["debug.getprotos"] = __DIST.E(),
			["debug.getupvalue"] = __DIST.F(),
			["debug.getupvalues"] = __DIST.G(),
			["debug.getstack"] = __DIST.H(),
			["debug.setconstant"] = __DIST.I(),
			["debug.setupvalue"] = __DIST.J(),
		},

		Drawing = {
			["Drawing.new"] = __DIST.K(),
			["Drawing.Fonts"] = __DIST.L(),
			["getrenderproperty"] = __DIST.M(),
			["setrenderproperty"] = __DIST.N(),
			["cleardrawcache"] = __DIST.O(),
			["isrenderobj"] = __DIST.P(),
		},

		Environment = {
			["getgenv"] = __DIST.Q(),
			["getrenv"] = __DIST.R(),
			["getgc"] = __DIST.S(),
			["filtergc"] = __DIST.T(),
		},

		Filesystem = {
			["getcustomasset"] = __DIST.U(),
			["listfiles"] = __DIST.V(),
			["loadfile"] = __DIST.W(),
			["appendfile"] = __DIST.X(),
			["delfile"] = __DIST.Y(),
			["delfolder"] = __DIST.Z(),
			["isfile"] = __DIST._(),
			["isfolder"] = __DIST.aa(),
			["writefile"] = __DIST.ab(),
			["readfile"] = __DIST.ac(),
			["makefolder"] = __DIST.ad(),
		},

		Input = {
			["isrbxactive"] = __DIST.ae(),
			["keypress"] = __DIST.af(),
			["keyrelease"] = __DIST.ag(),
			["keytap"] = __DIST.ah(),
			["mouse1click"] = __DIST.ai(),
			["mouse1press"] = __DIST.aj(),
			["mouse1release"] = __DIST.ak(),
			["mouse2click"] = __DIST.al(),
			["mouse2press"] = __DIST.am(),
			["mouse2release"] = __DIST.an(),
			["mousemoveabs"] = __DIST.ao(),
			["mousemoverel"] = __DIST.ap(),
			["mousescroll"] = __DIST.aq(),
			["setclipboard"] = __DIST.ar(),
			["setrbxclipboard"] = __DIST.as(),
		},

		Instances = {
			["gethui"] = __DIST.at(),
			["cloneref"] = __DIST.au(),
			["compareinstances"] = __DIST.av(),
			["getinstances"] = __DIST.aw(),
			["getnilinstances"] = __DIST.ax(),
			["getcallbackvalue"] = __DIST.ay(),
			["fireclickdetector"] = __DIST.az(),
			["fireproximityprompt"] = __DIST.aA(),
			["firetouchinterest"] = __DIST.aB(),
			["saveinstance"] = __DIST.aC(),
		},

		Metatable = {
			["getrawmetatable"] = __DIST.aD(),
			["setrawmetatable"] = __DIST.aE(),
			["hookmetamethod"] = __DIST.aF(),
			["getnamecallmethod"] = __DIST.aG(),
			["setreadonly"] = __DIST.aH(),
			["makereadonly"] = __DIST.aI(),
			["isreadonly"] = __DIST.aJ(),
		},

		Miscellaneous = {
			["identifyexecutor"] = __DIST.aK(),
			["setfpscap"] = __DIST.aL(),
			["getfpscap"] = __DIST.aM(),
			["request"] = __DIST.aN(),
			["lz4compress"] = __DIST.aO(),
			["lz4decompress"] = __DIST.aP(),
			["queue_on_teleport"] = __DIST.aQ(),
		},

		External = {
			["messagebox"] = __DIST.aR(),
			["rconsoleprint"] = __DIST.aS(),
			["rconsoleinfo"] = __DIST.aT(),
			["rconsolewarn"] = __DIST.aU(),
			["rconsoleerr"] = __DIST.aV(),
			["rconsoleinput"] = __DIST.aW(),
			["rconsoleclear"] = __DIST.aX(),
			["rconsolename"] = __DIST.aY(),
			["rconsolehide"] = __DIST.aZ(),
			["rconsoleshow"] = __DIST.a_(),
		},

		Reflection = {
			["sethiddenproperty"] = __DIST.a0(),
			["gethiddenproperty"] = __DIST.a1(),
			["setthreadidentity"] = __DIST.a2(),
			["getthreadidentity"] = __DIST.a3(),
			["setscriptable"] = __DIST.a4(),
			["isscriptable"] = __DIST.a5(),
		},

		Scripts = {
			["getscripts"] = __DIST.a6(),
			["getrunningscripts"] = __DIST.a7(),
			["getcallingscript"] = __DIST.a8(),
			["getloadedmodules"] = __DIST.a9(),
			["getsenv"] = __DIST.ba(),
			["getscripthash"] = __DIST.bb(),
			["loadstring"] = __DIST.bc(),
			["getscriptbytecode"] = __DIST.bd(),
			["getscriptclosure"] = __DIST.be(),
			["decompile"] = __DIST.bf(),
		},

		Signals = {
			
		},

		Actors = {
			["isparallel"] = __DIST.bg(),
			["run_on_actor"] = __DIST.bh(),
			["create_comm_channel"] = __DIST.bi(),
			["get_comm_channel"] = __DIST.bj(),
			["getactors"] = __DIST.bk(),
		},

		WebSocket = {
			["connect"] = __DIST.bl(),
		},
	}end function __DIST.bm():typeof(__modImpl())local v=__DIST.cache.bm if not v then v={c=__modImpl()}__DIST.cache.bm=v end return v.c end end do local function __modImpl()--!nocheck


return function(name, tab)
	--// Imports
	local checks = __DIST.bm()

	--// Variables
	local currentTask = nil
	local output = nil
	local lastEntreePerGroup = {}
	local results = {}

	local testConfig = {
		checkpointDelay = 0,
		statusFilter = false,
		stripRichtext = false,
		formatDiff = false,
		includeMetadata = false,
	}

	local uni = {
		bullet = "•",
	}

	local statusCodes = {
		[0] = "❓", -- Call errored/failed
		[200] = "✅", -- Passed
		[400] = "🔎", -- Global not found
		[401] = "📦", -- Dependency not found
		[500] = "🛠️", -- Failed functionality test
		[501] = "🏷️", -- Missing alias
	}

	--// Functions
	local printc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(message)
	end

	local warnc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(`<font color="#FFA500">{message}</font>`)
	end

	local function test()
		if currentTask then
			task.cancel(currentTask)
		end

		currentTask = task.spawn(function()
			local startTime = time()
			local passed = 0
			local failed = 0
			local numStandards = 0

			for groupName, group in checks do
				lastEntreePerGroup[groupName] = nil
				results[groupName] = {}

				for name in group do
					numStandards += 1
					lastEntreePerGroup[groupName] = name
				end
			end

			local flattened = {}
			for groupName, group in checks do
				for name, test in group do
					table.insert(flattened, {
						groupName = groupName,
						name = name,
						test = test,
					})
				end
			end

			for i, entry in ipairs(flattened) do
				local groupName = entry.groupName
				local name = entry.name
				local test = entry.test

				local nextEntry = flattened[i + 1]

				local success, result = pcall(test)
				local status, message

				if not success then
					status = 0
					message = result
					failed += 1
					output:SetValue(`<font color="#FFA500">{name} failed</font>`)
				elseif result.status == 200 then
					status = result.status
					message = result.message
					passed += 1
					output:SetValue(`<font color="#84FF00">{name} passed</font>`)
				else
					status = result.status
					message = result.message
					failed += 1
					output:SetValue(`<font color="#FFA500">{name} failed</font>`)
				end

				if nextEntry then
					printc(`Next test: {nextEntry.name}`)
				end

				table.insert(results[groupName], {
					name = name,
					status = status,
					message = message,
				})

				if testConfig.checkpointDelay ~= 0 then
					task.wait(testConfig.checkpointDelay)
				end
			end

			output:Clear()

			for groupName, groupResults in results do
				local includesFilter = false
				local groupProcessed = false

				for _, result in groupResults do
					if not testConfig.statusFilter or statusCodes[result.status] == testConfig.statusFilter then
						if not groupProcessed then
							printc(groupName .. ":")
							groupProcessed = true
						end
						local displayFunc = (result.status == 200) and printc or warnc
						displayFunc(`{uni.bullet} {statusCodes[result.status]} {result.name}: {result.message}`)
						includesFilter = true
					end
				end

				if includesFilter then
					printc("")
				end
			end

			if testConfig.stripRichtext then
				output:SetValue(output:GetValue():gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
			end
			if testConfig.formatDiff then -- Why is GPT so goated
				output:SetValue(output:GetValue():gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
				local input = output:GetValue()
				local lines = {}

				for i, line in ipairs(string.split(input, "\n")) do
					local cleaned = line:gsub("^•%s*", ""):gsub("^%s*(.-)%s*$", "%1")

					if cleaned ~= "" then
						if cleaned:find("✅") then
							lines[i] = "+ " .. cleaned
						elseif
							cleaned:find("🔎")
							or cleaned:find("❓")
							or cleaned:find("🛠️")
							or cleaned:find("📦")
							or cleaned:find("🏷️")
						then
							lines[i] = "- " .. cleaned
						else
							lines[i] = cleaned
						end
					else
						lines[i] = ""
					end
				end

				output:SetValue(table.concat(lines, "\n"))
			end

			local endTime = math.floor((time() - startTime) * 10 ^ 2 + 0.5) / 10 ^ 2
			local executor, executorVers = identifyexecutor()

			printc(`Summary:`)
			printc(`{uni.bullet} Took: {endTime}s`)
			printc(`{uni.bullet} Executor: {executor or "Unknown"}`)
			printc(`{uni.bullet} Tested: {numStandards}`)
			printc(`{uni.bullet} Passed: {passed}`)
			printc(`{uni.bullet} Failed: {failed}`)
			printc(`{uni.bullet} Pass Rate: {math.round(passed / numStandards * 100)}%`)

			if testConfig.includeMetadata then
				local input = output:GetValue()

				local metadata = string.format(
					'@metadata {\n  "generated": "%s",\n  "executor": "%s",\n  "version": "%s",\n} \n\n',
					DateTime.now():ToIsoDate(),
					executor,
					executorVers
				)

				output:SetValue(metadata .. input)
			end

			game.ReplicatedStorage.res:FireServer(results, {
				["testBuildMetadata"] = _P,
				["executor"] = executor,
				["executorVersion"] = executorVers,
				["tested"] = numStandards,
				["passed"] = passed,
				["failed"] = failed,
				["testTime"] = endTime,
				["generated"] = DateTime.now():ToIsoDate(),
			})
		end)
	end

	--// Initialize
	tab:Button({
		Text = "Run test",
		Callback = function()
			coroutine.wrap(test)()
		end,
	})

	do -- Test Options
		local testOptions = tab:TreeNode({ Title = "Test options" })

		testOptions:Combo({
			Label = "Status filter",
			Selected = "All",
			Items = {
				"All",
				"✅ Pass",
				"❓ Ambiguous",
				"🔎 Missing",
				"📦 Dependency",
				"🛠️ Functionality",
				"🏷️ Alias",
			},
			Callback = function(self, value)
				local lookup = { -- It won't be in order if I don't do it this way
					["All"] = false,
					["✅ Pass"] = statusCodes[200],
					["❓ Ambiguous"] = statusCodes[0],
					["🔎 Missing"] = statusCodes[400],
					["📦 Dependency"] = statusCodes[401],
					["🛠️ Functionality"] = statusCodes[500],
					["🏷️ Alias"] = statusCodes[501],
				}

				testConfig.statusFilter = lookup[value]
			end,
		})

		testOptions:SliderFloat({
			Label = "Checkpoint delay",
			Default = 0.0,
			Minimum = 0.0,
			Maximum = 1.0,
			Format = "Delay = %.2f",
			Callback = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Include Metadata",
			Callback = function(self, value)
				testConfig.includeMetadata = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Strip Rich-text",
			Callback = function(self, value)
				testConfig.stripRichtext = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Format in diff",
			Callback = function(self, value)
				testConfig.formatDiff = value
			end,
		})
	end

	do -- Info
		local info = tab:TreeNode({ Title = "Info" })
		info:Label({
			Text = "Test checks are in this order:\n- Global check\n- Dependency check \n- Functionality check \n- Alias Test\nThis means that if you are missing an alias, you still passed the functionality test. Aliases are important, it helps preserve old scripts, and conventions for programmers who use one over the other.",
			TextWrapped = true,
		})
	end

	output = tab:Console({
		ReadOnly = true,
		RichText = true,
		LineHeight = 1.3,
		Fill = true,
	}):Clear()

	return results
end
end function __DIST.bn():typeof(__modImpl())local v=__DIST.cache.bn if not v then v={c=__modImpl()}__DIST.cache.bn=v end return v.c end end do local function __modImpl()--!nocheck
--!nolint LocalUnused


return function(name, tab)
	--// Variables
	local output = nil

	local lastEntreePerGroup = {}
	local numStandards = 0
	local passed = 0
	local failed = 0

	local uni = {
		bullet = "•",
	}
	local statusCodes = {
		[0] = "❓", -- Call errored/failed
		[200] = "✅", -- Passed
		[400] = "🚫", -- Not mitigated
		[401] = "📦", -- Dependency not found
	}

	--// Functions
	local printc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(message)
	end
	
	local warnc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(`<font color="#FFA500">{message}</font>`)
	end	

	--// Initialize
	output = tab:Console({
		ReadOnly = true,
		RichText = true,
		LineHeight = 1.3,
		Fill = true,
	}):Clear()

	printc("Not implemented.")

	return {
		passed = passed,
		failed = failed,
	}
end
end function __DIST.bo():typeof(__modImpl())local v=__DIST.cache.bo if not v then v={c=__modImpl()}__DIST.cache.bo=v end return v.c end end end--!nocheck

--// Imports

local interface = __DIST.a()

--// Services
local players: Players = game:GetService("Players")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local teleportService: TeleportService = game:GetService("TeleportService")

--// References
local localPlayer: Player = players.LocalPlayer

--// Variables
local gameId = 80776325854596
local tests = {
	["Standards"] = __DIST.bn(),
	["Vulnerability"] = __DIST.bo(),
}

--// Initialize
if game.PlaceId ~= gameId then
	local gameModal = interface:PopupModal({
		Title = "Teleporting you to the test game...",
	})

	gameModal:Label({
		Text = "If teleporting dosen't work, press 'Copy' to copy the game link",
		TextWrapped = true
	})

	gameModal:Separator()

	local Row = gameModal:Row({
		Expanded = true
	})

	Row:Button({
		Text = "Copy",
		Callback = function()
			if setclipboard or toclipboard then
				(setclipboard or toclipboard)("https://www.roblox.com/games/80776325854596")
			else
				print("Failed to copy link: " .. "https://www.roblox.com/games/80776325854596")
			end
			gameModal:ClosePopup()
		end,
	})
	Row:Button({
		Text = "Cancel",
		Callback = function()
			gameModal:ClosePopup()
		end,
	})

	teleportService:Teleport(gameId, localPlayer)
else
	replicatedStorage:FindFirstChild("connected"):FireServer()

	--// UI Begin
	local window = interface:TabsWindow({
		Title = "Myriad General Validity Test",
		Size = UDim2.fromOffset(400, 500),
		Theme = "ImGui"
	})

	local discModal = window:PopupModal({
		Title = "Would you like to copy our discord link?",
	})

	discModal:Label({
		Text = "Get commit logs when we push changes, interact with the community, and get support for problems",
		TextWrapped = true
		})

	discModal:Separator()

	local Row = discModal:Row({
		Expanded = true
	})

	Row:Button({
		Text = "Yes",
		Callback = function()
			if setclipboard or toclipboard then
				(setclipboard or toclipboard)("https://discord.gg/nn4NxHU3Pu")
			else
				print("Failed to copy link: " .. "https://discord.gg/nn4NxHU3Pu")
			end
			discModal:ClosePopup()
		end,
	})
	Row:Button({
		Text = "No",
		Callback = function()
			discModal:ClosePopup()
		end,
	})

	-- Home
	do
		local home = window:CreateTab({
			Name = "Home",
		})

		home:Label({
			RichText = true,
			Text = "<b>Myriad General Validity Test (2025)</b>",
		})
		home:Label({
			RichText = true,
			Text = `Build: <b>{_P.cfg}</b>`,
		})
		home:Label({
			RichText = true,
			Text = `Build Version: <b>{_P.vers}</b>`,
		})
		home:Label({
			RichText = true,
			Text = `Executor: <b>{(identifyexecutor and identifyexecutor() or "Unknown")}</b>`,
		})

		home:Label({
			RichText = true,
			Text = "\nContributors:",
		})
		home:BulletText({
			RichText = true,
			Rows = {
				"biggaboy212",
			},
		})
	end

	for name, test in tests do
		local tab = window:CreateTab({ Name = name })

		coroutine.wrap(function()
			tests[name](name, tab)
		end)()
	end
end
