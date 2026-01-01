--!nolint
--!nocheck

--[[
    @repository https://github.com/Proton-Utilities/Myriad

    @author Proton-Utilities
    @name Myriad

    This file was automatically @generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-01-01T03:57:41.699808900+00:00",
    cfg = "Release",
    vers = "v1.0.3"
}

local a={cache={}}do do local aa=function()local b b={cache={},load=function(c)
if not b.cache[c]then b.cache[c]={c=b[c]()}end return b.cache[c].c end}do
function b.a()local c,d,e='8.0',cloneref or function(c)return c end,{Theme={
Syntax={Text=Color3.fromRGB(204,204,204),Background=Color3.fromRGB(20,20,20),
Selection=Color3.fromRGB(255,255,255),SelectionBack=Color3.fromRGB(102,161,255),
Operator=Color3.fromRGB(204,204,204),Number=Color3.fromRGB(255,198,0),String=
Color3.fromRGB(172,240,148),Comment=Color3.fromRGB(102,102,102),Keyword=Color3.
fromRGB(248,109,124),BuiltIn=Color3.fromRGB(132,214,247),LocalMethod=Color3.
fromRGB(253,251,172),LocalProperty=Color3.fromRGB(97,161,241),Nil=Color3.
fromRGB(255,198,0),Bool=Color3.fromRGB(255,198,0),Function=Color3.fromRGB(248,
109,124),Local=Color3.fromRGB(248,109,124),Self=Color3.fromRGB(248,109,124),
FunctionName=Color3.fromRGB(253,251,172),Bracket=Color3.fromRGB(204,204,204)}}}
local f,g=setmetatable({},{__index=function(f,g)local h=game:GetService(g)return
d(h)end}),{StartAndEnd={Enum.UserInputType.MouseButton1,Enum.UserInputType.Touch
},Movement={Enum.UserInputType.MouseMovement,Enum.UserInputType.Touch}}local h,i
,j,k=f.Players,f.UserInputService,f.RunService,f.TweenService local l=d(h.
LocalPlayer)local m,n,o,p=d(l:GetMouse()),function(m,n)for o,p in next,n do m[o]
=p end return m end,function(m,n)local o=m.UserInputType return table.find(g[n],
o)end,function(...)return d(Instance.new(...))end local q,r,s=function(q,r)local
s=p(q)for t,u in next,r do s[t]=u end return s end,{},p'Frame'r.CheckMouseInGui=
function(t)if t==nil then return false end local u,v=t.AbsolutePosition,t.
AbsoluteSize return m.X>=u.X and m.X<u.X+v.X and m.Y>=u.Y and m.Y<u.Y+v.Y end r.
Signal=(function()local t,u={},function(t)local u=table.find(t.Signal.
Connections,t)if u then table.remove(t.Signal.Connections,u)end end t.Connect=
function(v,w)if type(w)~='function'then error'Attempt to connect a non-function'
end local x={Signal=v,Func=w,Disconnect=u}v.Connections[#v.Connections+1]=x
return x end t.Fire=function(v,...)for w,x in next,v.Connections do xpcall(
coroutine.wrap(x.Func),function(y)warn(y..'\n'..debug.traceback())end,...)end
end local v={__index=t,__tostring=function(v)return'Signal: '..tostring(#v.
Connections)..' Connections'end}local w=function()local w={}w.Connections={}
return setmetatable(w,v)end return{new=w}end)()r.CreateArrow=function(t,u,v)
local w,x=u,q('Frame',{BackgroundTransparency=1,Name='Arrow',Size=UDim2.new(0,t,
0,t)})if v=='up'then for y=1,u do q('Frame',{BackgroundColor3=Color3.new(
0.8627450980392157,0.8627450980392157,0.8627450980392157),BorderSizePixel=0,
Position=UDim2.new(0,math.floor(t/2)-(y-1),0,math.floor(t/2)+y-math.floor(w/2)-1
),Size=UDim2.new(0,y+(y-1),0,1),Parent=x})end return x elseif v=='down'then for
y=1,u do q('Frame',{BackgroundColor3=Color3.new(0.8627450980392157,
0.8627450980392157,0.8627450980392157),BorderSizePixel=0,Position=UDim2.new(0,
math.floor(t/2)-(y-1),0,math.floor(t/2)-y+math.floor(w/2)+1),Size=UDim2.new(0,y+
(y-1),0,1),Parent=x})end return x elseif v=='left'then for y=1,u do q('Frame',{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,
0.8627450980392157),BorderSizePixel=0,Position=UDim2.new(0,math.floor(t/2)+y-
math.floor(w/2)-1,0,math.floor(t/2)-(y-1)),Size=UDim2.new(0,1,0,y+(y-1)),Parent=
x})end return x elseif v=='right'then for y=1,u do q('Frame',{BackgroundColor3=
Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,Position=UDim2.new(0,math.floor(t/2)-y+math.floor(w/2)+1,0,
math.floor(t/2)-(y-1)),Size=UDim2.new(0,1,0,y+(y-1)),Parent=x})end return x end
error''end r.FastWait=(function(t)task.wait(t)end)r.ScrollBar=(function()local t
,u,v,w={},r.CheckMouseInGui,r.CreateArrow,function(t)local u,v,w,x=t.TotalSpace,
t.VisibleSpace,t.GuiElems.ScrollThumb,t.GuiElems.ScrollThumbFrame if not(t:
CanScrollUp()or t:CanScrollDown())then w.Visible=false else w.Visible=true end
if t.Horizontal then w.Size=UDim2.new(v/u,0,1,0)if w.AbsoluteSize.X<10 then w.
Size=UDim2.new(0,10,1,0)end local y,z=x.AbsoluteSize.X,w.AbsoluteSize.X w.
Position=UDim2.new(t:GetScrollPercent()*(y-z)/y,0,0,0)else w.Size=UDim2.new(1,0,
v/u,0)if w.AbsoluteSize.Y<10 then w.Size=UDim2.new(1,0,0,10)end local y,z=x.
AbsoluteSize.Y,w.AbsoluteSize.Y w.Position=UDim2.new(0,0,t:GetScrollPercent()*(y
-z)/y,0)end end local x=function(x)local y,z,A=(q('Frame',{Style=0,Active=true,
AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,
0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.
new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,
ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-10,0,0),Rotation=0,
Selectable=false,Size=UDim2.new(0,10,1,0),SizeConstraint=0,Visible=true,ZIndex=1
,Name='ScrollBar'}))if x.Horizontal then y.Size=UDim2.new(1,0,0,10)z=q(
'ImageButton',{Parent=y,Name='Left',Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false})v(10,4,'left')
.Parent=z A=q('ImageButton',{Parent=y,Name='Right',Position=UDim2.new(1,-10,0,0)
,Size=UDim2.new(0,10,0,10),BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false})v(10,4,'right').Parent=A else y.Size=UDim2.new(0,10,1,0)z
=q('ImageButton',{Parent=y,Name='Up',Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false})v(10,4,'up').
Parent=z A=q('ImageButton',{Parent=y,Name='Down',Position=UDim2.new(0,0,1,-10),
Size=UDim2.new(0,10,0,10),BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false})v(10,4,'down').Parent=A end local B=q('Frame',{
BackgroundTransparency=1,Parent=y})if x.Horizontal then B.Position=UDim2.new(0,
10,0,0)B.Size=UDim2.new(1,-20,1,0)else B.Position=UDim2.new(0,0,0,10)B.Size=
UDim2.new(1,0,1,-20)end local C,D,E,F,G=q('Frame',{BackgroundColor3=Color3.new(
0.47058823529411764,0.47058823529411764,0.47058823529411764),BorderSizePixel=0,
Parent=B}),q('Frame',{BackgroundTransparency=1,Name='Markers',Size=UDim2.new(1,0
,1,0),Parent=B}),false,false,false z.InputBegan:Connect(function(H)if o(H,
'Movement')and not E and x:CanScrollUp()then z.BackgroundTransparency=0.8 end if
not o(H,'StartAndEnd')or not x:CanScrollUp()then return end E=true z.
BackgroundTransparency=0.5 if x:CanScrollUp()then x:ScrollUp()x.Scrolled:Fire()
end local I,J=(tick())J=i.InputEnded:Connect(function(K)if not o(K,'StartAndEnd'
)then return end J:Disconnect()if u(z)and x:CanScrollUp()then z.
BackgroundTransparency=0.8 else z.BackgroundTransparency=1 end E=false end)while
E do if tick()-I>=0.3 and x:CanScrollUp()then x:ScrollUp()x.Scrolled:Fire()end
wait()end end)z.InputEnded:Connect(function(H)if o(H,'Movement')and not E then z
.BackgroundTransparency=1 end end)A.InputBegan:Connect(function(H)if o(H,
'Movement')and not E and x:CanScrollDown()then A.BackgroundTransparency=0.8 end
if not o(H,'StartAndEnd')or not x:CanScrollDown()then return end E=true A.
BackgroundTransparency=0.5 if x:CanScrollDown()then x:ScrollDown()x.Scrolled:
Fire()end local I,J=(tick())J=i.InputEnded:Connect(function(K)if not o(K,
'StartAndEnd')then return end J:Disconnect()if u(A)and x:CanScrollDown()then A.
BackgroundTransparency=0.8 else A.BackgroundTransparency=1 end E=false end)while
E do if tick()-I>=0.3 and x:CanScrollDown()then x:ScrollDown()x.Scrolled:Fire()
end wait()end end)A.InputEnded:Connect(function(H)if o(H,'Movement')and not E
then A.BackgroundTransparency=1 end end)C.InputBegan:Connect(function(H)if o(H,
'Movement')and not F then C.BackgroundTransparency=0.2 C.BackgroundColor3=x.
ThumbSelectColor end if not o(H,'StartAndEnd')then return end local I,J=x.
Horizontal and'X'or'Y'E=false G=false F=true C.BackgroundTransparency=0 local K,
L,M=(m[I]-C.AbsolutePosition[I])L=i.InputEnded:Connect(function(N)if not o(N,
'StartAndEnd')then return end L:Disconnect()if M then M:Disconnect()end if u(C)
then C.BackgroundTransparency=0.2 else C.BackgroundTransparency=0 C.
BackgroundColor3=x.ThumbColor end F=false end)x:Update()M=i.InputChanged:
Connect(function(N)if o(N,'Movement')and F and L.Connected then local O,P=B.
AbsoluteSize[I]-C.AbsoluteSize[I],m[I]-B.AbsolutePosition[I]-K if P>O then P=O
elseif P<0 then P=0 end if J~=P then J=P x:ScrollTo(math.floor(0.5+P/O*(x.
TotalSpace-x.VisibleSpace)))end wait()end end)end)C.InputEnded:Connect(function(
H)if o(H,'Movement')and not F then C.BackgroundTransparency=0 C.BackgroundColor3
=x.ThumbColor end end)B.InputBegan:Connect(function(H)if not o(H,'StartAndEnd')
or u(C)then return end local I,J=x.Horizontal and'X'or'Y',0 if m[I]>=C.
AbsolutePosition[I]+C.AbsoluteSize[I]then J=1 end local K=function()local K=x.
VisibleSpace-1 if J==0 and m[I]<C.AbsolutePosition[I]then x:ScrollTo(x.Index-K)
elseif J==1 and m[I]>=C.AbsolutePosition[I]+C.AbsoluteSize[I]then x:ScrollTo(x.
Index+K)end end F=false G=true K()local L,M=(tick())M=i.InputEnded:Connect(
function(N)if not o(N,'StartAndEnd')then return end M:Disconnect()G=false end)
while G do if tick()-L>=0.3 and u(B)then K()end wait()end end)y.
MouseWheelForward:Connect(function()x:ScrollTo(x.Index-x.WheelIncrement)end)y.
MouseWheelBackward:Connect(function()x:ScrollTo(x.Index+x.WheelIncrement)end)x.
GuiElems.ScrollThumb=C x.GuiElems.ScrollThumbFrame=B x.GuiElems.Button1=z x.
GuiElems.Button2=A x.GuiElems.MarkerFrame=D return y end t.Update=function(y,z)
local A,B,C,D=y.TotalSpace,y.VisibleSpace,y.GuiElems.Button1,y.GuiElems.Button2
y.Index=math.clamp(y.Index,0,math.max(0,A-B))if y.LastTotalSpace~=y.TotalSpace
then y.LastTotalSpace=y.TotalSpace y:UpdateMarkers()end if y:CanScrollUp()then
for E,F in pairs(C.Arrow:GetChildren())do F.BackgroundTransparency=0 end else C.
BackgroundTransparency=1 for E,F in pairs(C.Arrow:GetChildren())do F.
BackgroundTransparency=0.5 end end if y:CanScrollDown()then for E,F in pairs(D.
Arrow:GetChildren())do F.BackgroundTransparency=0 end else D.
BackgroundTransparency=1 for E,F in pairs(D.Arrow:GetChildren())do F.
BackgroundTransparency=0.5 end end w(y)end t.UpdateMarkers=function(y)local z=y.
GuiElems.MarkerFrame z:ClearAllChildren()for A,B in pairs(y.Markers)do if A<y.
TotalSpace then q('Frame',{BackgroundTransparency=0,BackgroundColor3=B,
BorderSizePixel=0,Position=y.Horizontal and UDim2.new(A/y.TotalSpace,0,1,-6)or
UDim2.new(1,-6,A/y.TotalSpace,0),Size=y.Horizontal and UDim2.new(0,1,0,6)or
UDim2.new(0,6,0,1),Name='Marker'..tostring(A),Parent=z})end end end t.AddMarker=
function(y,z,A)y.Markers[z]=A or Color3.new(0,0,0)end t.ScrollTo=function(y,z,A)
y.Index=z y:Update()if not A then y.Scrolled:Fire()end end t.ScrollUp=function(y
)y.Index=y.Index-y.Increment y:Update()end t.ScrollDown=function(y)y.Index=y.
Index+y.Increment y:Update()end t.CanScrollUp=function(y)return y.Index>0 end t.
CanScrollDown=function(y)return y.Index+y.VisibleSpace<y.TotalSpace end t.
GetScrollPercent=function(y)return y.Index/(y.TotalSpace-y.VisibleSpace)end t.
SetScrollPercent=function(y,z)y.Index=math.floor(z*(y.TotalSpace-y.VisibleSpace)
)y:Update()end t.Texture=function(y,z)y.ThumbColor=z.ThumbColor or Color3.new(0,
0,0)y.ThumbSelectColor=z.ThumbSelectColor or Color3.new(0,0,0)y.GuiElems.
ScrollThumb.BackgroundColor3=z.ThumbColor or Color3.new(0,0,0)y.Gui.
BackgroundColor3=z.FrameColor or Color3.new(0,0,0)y.GuiElems.Button1.
BackgroundColor3=z.ButtonColor or Color3.new(0,0,0)y.GuiElems.Button2.
BackgroundColor3=z.ButtonColor or Color3.new(0,0,0)for A,B in pairs(y.GuiElems.
Button1.Arrow:GetChildren())do B.BackgroundColor3=z.ArrowColor or Color3.new(0,0
,0)end for A,B in pairs(y.GuiElems.Button2.Arrow:GetChildren())do B.
BackgroundColor3=z.ArrowColor or Color3.new(0,0,0)end end t.SetScrollFrame=
function(y,z)if y.ScrollUpEvent then y.ScrollUpEvent:Disconnect()y.ScrollUpEvent
=nil end if y.ScrollDownEvent then y.ScrollDownEvent:Disconnect()y.
ScrollDownEvent=nil end y.ScrollUpEvent=z.MouseWheelForward:Connect(function()y:
ScrollTo(y.Index-y.WheelIncrement)end)y.ScrollDownEvent=z.MouseWheelBackward:
Connect(function()y:ScrollTo(y.Index+y.WheelIncrement)end)end local y={}y.
__index=t local z=function(z)local A=setmetatable({Index=0,VisibleSpace=0,
TotalSpace=0,Increment=1,WheelIncrement=1,Markers={},GuiElems={},Horizontal=z,
LastTotalSpace=0,Scrolled=r.Signal.new()},y)A.Gui=x(A)A:Texture{ThumbColor=
Color3.fromRGB(60,60,60),ThumbSelectColor=Color3.fromRGB(75,75,75),ArrowColor=
Color3.new(1,1,1),FrameColor=Color3.fromRGB(40,40,40),ButtonColor=Color3.
fromRGB(75,75,75)}return A end return{new=z}end)()r.CodeFrame=(function()local t
,u,v,w,x,y,z,A={},{[1]='String',[2]='String',[3]='String',[4]='Comment',[5]=
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
local B,C,D,E,F,G=(' %s%s '):format(A,A),{[('[^%s] %s'):format(A,A)]=0,[(' %s%s'
):format(A,A)]=-1,[('%s%s '):format(A,A)]=2,[('%s [^%s]'):format(A,A)]=1},{},
function()local B,C,D=getfenv(),type,tostring for E,F in next,x do local G=B[E]
if C(G)=='table'then local H={}for I,J in next,G do H[I]=true end x[E]=H end end
local E,F={},Enum:GetEnums()for G=1,#F do E[D(F[G])]=true end x.Enum=E y=true
end,function(B)local C=B.GuiElems.EditBox C.Focused:Connect(function()B:
ConnectEditBoxEvent()B.Editing=true end)C.FocusLost:Connect(function()B:
DisconnectEditBoxEvent()B.Editing=false end)C:GetPropertyChangedSignal'Text':
Connect(function()local D=C.Text if#D==0 or B.EditBoxCopying then return end D=D
:gsub('\t','    ')C.Text=''B:AppendText(D)end)end,function(B)local C,D=B.
GuiElems.LinesFrame,B.Lines C.InputBegan:Connect(function(E)if o(E,'StartAndEnd'
)then local F,G,H,I=math.ceil(B.FontSize/2),B.FontSize,m.X-C.AbsolutePosition.X,
m.Y-C.AbsolutePosition.Y local J,K,L,M,N,O,P=math.round(H/F)+B.ViewX,math.floor(
I/G)+B.ViewY,0,0 K=math.min(#D-1,K)local Q=D[K+1]or''J=math.min(#Q,J+B:
TabAdjust(J,K))B.SelectionRange={{-1,-1},{-1,-1}}B:MoveCursor(J,K)B.FloatCursorX
=J local R=function()local R,S=m.X-C.AbsolutePosition.X,m.Y-C.AbsolutePosition.Y
local T,U=math.max(0,math.round(R/F)+B.ViewX),math.max(0,math.floor(S/G)+B.ViewY
)U=math.min(#D-1,U)local V=D[U+1]or''T=math.min(#V,T+B:TabAdjust(T,U))if U<K or(
U==K and T<J)then B.SelectionRange={{T,U},{J,K}}else B.SelectionRange={{J,K},{T,
U}}end B:MoveCursor(T,U)B.FloatCursorX=T B:Refresh()end N=i.InputEnded:Connect(
function(S)if o(S,'StartAndEnd')then N:Disconnect()O:Disconnect()P:Disconnect()B
:SetCopyableSelection()end end)O=i.InputChanged:Connect(function(S)if o(S,
'Movement')then local T,U,V,W=m.Y-C.AbsolutePosition.Y,m.Y-C.AbsolutePosition.Y-
C.AbsoluteSize.Y,m.X-C.AbsolutePosition.X,m.X-C.AbsolutePosition.X-C.
AbsoluteSize.X L=0 M=0 if U>0 then L=math.floor(U*0.05)+1 elseif T<0 then L=math
.ceil(T*0.05)-1 end if W>0 then M=math.floor(W*0.05)+1 elseif V<0 then M=math.
ceil(V*0.05)-1 end R()end end)P=j.RenderStepped:Connect(function()if L~=0 or M~=
0 then B:ScrollDelta(M,L)R()end end)B:Refresh()end end)end function t.
MakeEditorFrame(H)local I=p'TextButton'I.BackgroundTransparency=1 I.
TextTransparency=1 I.BackgroundColor3=Color3.fromRGB(40,40,40)I.BorderSizePixel=
0 I.Size=UDim2.fromOffset(100,100)I.Visible=true local J,K={},p'Frame'K.Name=
'Lines'K.BackgroundTransparency=1 K.Size=UDim2.new(1,0,1,0)K.ClipsDescendants=
true K.Parent=I local L=p'TextLabel'L.Name='LineNumbers'L.BackgroundTransparency
=1 L.FontFace=H.FontFace L.TextXAlignment=Enum.TextXAlignment.Right L.
TextYAlignment=Enum.TextYAlignment.Top L.ClipsDescendants=true L.RichText=true L
.Parent=I s.Name='Cursor's.BackgroundColor3=Color3.fromRGB(220,220,220)s.
BorderSizePixel=0 s.Parent=I local M=p'TextBox'M.Name='EditBox'M.MultiLine=true
M.Visible=false M.Parent=I M.TextSize=H.FontSize M.FontFace=H.FontFace D.Invis=k
:Create(s,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
BackgroundTransparency=1})D.Vis=k:Create(s,TweenInfo.new(0,Enum.EasingStyle.
Quart,Enum.EasingDirection.Out),{BackgroundTransparency=0})local N=p'Frame'N.
BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945)N
.BorderSizePixel=0 N.Name='ScrollCorner'N.Position=UDim2.new(1,-10,1,-10)N.Size=
UDim2.new(0,10,0,10)N.Visible=false J.ScrollCorner=N J.LinesFrame=K J.
LineNumbersLabel=L J.Cursor=s J.EditBox=M J.ScrollCorner.Parent=I K.InputBegan:
Connect(function(O)if o(O,'StartAndEnd')then H:SetEditing(true,O)end end)H.Frame
=I H.Gui=I H.GuiElems=J F(H)G(H)return I end t.GetSelectionText=function(H)if
not H:IsValidRange()then return''end local I=H.SelectionRange local J,K,L,M=I[1]
[1],I[1][2],I[2][1],I[2][2]local N,O=M-K,H.Lines if not O[K+1]or not O[M+1]then
return''end if N==0 then return H:ConvertText(O[K+1]:sub(J+1,L),false)end local
P,Q=O[K+1]:sub(J+1),O[M+1]:sub(1,L)local R=P..'\n'for S=K+1,M-1 do R=R..O[S+1]..
'\n'end R=R..Q return H:ConvertText(R,false)end t.SetCopyableSelection=function(
H)local I,J=H:GetSelectionText(),H.GuiElems.EditBox H.EditBoxCopying=true J.Text
=I J.SelectionStart=1 J.CursorPosition=#J.Text+1 H.EditBoxCopying=false end t.
ConnectEditBoxEvent=function(H)if H.EditBoxEvent then H.EditBoxEvent:Disconnect(
)end H.EditBoxEvent=i.InputBegan:Connect(function(I)if I.UserInputType~=Enum.
UserInputType.Keyboard then return end local J,K,L=Enum.KeyCode,I.KeyCode,
function(J,K)local L,M L=i.InputEnded:Connect(function(N)if N.KeyCode~=J then
return end L:Disconnect()M=true end)K()r.FastWait(0.5)while not M do K()r.
FastWait(0.03)end end if K==J.Down then L(J.Down,function()H.CursorX=H.
FloatCursorX H.CursorY=H.CursorY+1 H:UpdateCursor()H:JumpToCursor()end)elseif K
==J.Up then L(J.Up,function()H.CursorX=H.FloatCursorX H.CursorY=H.CursorY-1 H:
UpdateCursor()H:JumpToCursor()end)elseif K==J.Left then L(J.Left,function()local
M=H.Lines[H.CursorY+1]or''H.CursorX=H.CursorX-1-(M:sub(H.CursorX-3,H.CursorX)==B
and 3 or 0)if H.CursorX<0 then H.CursorY=H.CursorY-1 local N=H.Lines[H.CursorY+1
]or''H.CursorX=#N end H.FloatCursorX=H.CursorX H:UpdateCursor()H:JumpToCursor()
end)elseif K==J.Right then L(J.Right,function()local M=H.Lines[H.CursorY+1]or''H
.CursorX=H.CursorX+1+(M:sub(H.CursorX+1,H.CursorX+4)==B and 3 or 0)if H.CursorX>
#M then H.CursorY=H.CursorY+1 H.CursorX=0 end H.FloatCursorX=H.CursorX H:
UpdateCursor()H:JumpToCursor()end)elseif K==J.Backspace then L(J.Backspace,
function()local M,N if H:IsValidRange()then M=H.SelectionRange[1]N=H.
SelectionRange[2]else N={H.CursorX,H.CursorY}end if not M then local O=H.Lines[H
.CursorY+1]or''H.CursorX=H.CursorX-1-(O:sub(H.CursorX-3,H.CursorX)==B and 3 or 0
)if H.CursorX<0 then H.CursorY=H.CursorY-1 local P=H.Lines[H.CursorY+1]or''H.
CursorX=#P end H.FloatCursorX=H.CursorX H:UpdateCursor()M=M or{H.CursorX,H.
CursorY}end H:DeleteRange({M,N},false,true)H:ResetSelection(true)H:JumpToCursor(
)end)elseif K==J.Delete then L(J.Delete,function()local M,N if H:IsValidRange()
then M=H.SelectionRange[1]N=H.SelectionRange[2]else M={H.CursorX,H.CursorY}end
if not N then local O=H.Lines[H.CursorY+1]or''local P,Q=H.CursorX+1+(O:sub(H.
CursorX+1,H.CursorX+4)==B and 3 or 0),H.CursorY if P>#O then Q=Q+1 P=0 end H:
UpdateCursor()N=N or{P,Q}end H:DeleteRange({M,N},false,true)H:ResetSelection(
true)H:JumpToCursor()end)elseif i:IsKeyDown(Enum.KeyCode.LeftControl)then if K==
J.A then H.SelectionRange={{0,5},{#H.Lines[#H.Lines],#H.Lines-1}}H:
SetCopyableSelection()H:Refresh()end end end)end t.DisconnectEditBoxEvent=
function(H)if H.EditBoxEvent then H.EditBoxEvent:Disconnect()s.
BackgroundTransparency=1 t.CursorAnim(H,false)end end t.ResetSelection=function(
H,I)H.SelectionRange={{-1,-1},{-1,-1}}if not I then H:Refresh()end end t.
IsValidRange=function(H,I)local J=I or H.SelectionRange local K,L,M,N=J[1][1],J[
1][2],J[2][1],J[2][2]if K==-1 or(K==M and L==N)then return false end return true
end t.DeleteRange=function(H,I,J,K)I=I or H.SelectionRange if not H:
IsValidRange(I)then return end local L,M,N,O,P=H.Lines,I[1][1],I[1][2],I[2][1],I
[2][2]local Q=P-N if not L[N+1]or not L[P+1]then return end local R,S=L[N+1]:
sub(1,M),L[P+1]:sub(O+1)L[N+1]=R..S local T=table.remove for U=1,Q do T(L,N+2)
end if I==H.SelectionRange then H.SelectionRange={{-1,-1},{-1,-1}}end if K then
H.CursorX=M H.CursorY=N H:UpdateCursor()end if not J then H:ProcessTextChange()
end end t.AppendText=function(H,I)H:DeleteRange(nil,true,true)local J,K,L=H.
Lines,H.CursorX,H.CursorY local M=J[L+1]local N,O=M:sub(1,K),M:sub(K+1)I=I:gsub(
'\r\n','\n')I=H:ConvertText(I,true)local P,Q=I:split'\n',table.insert for R=1,#P
do local S=L+R if R>1 then Q(J,S,'')end local T,U,V=P[R],(R==1 and N or''),(R==#
P and O or'')J[S]=U..T..V end if#P>1 then K=0 end H:ProcessTextChange()H.CursorX
=K+#P[#P]H.CursorY=L+#P-1 H:UpdateCursor()end t.ScrollDelta=function(H,I,J)H.
ScrollV:ScrollTo(H.ScrollV.Index+J)H.ScrollH:ScrollTo(H.ScrollH.Index+I)end t.
TabAdjust=function(H,I,J)local K=H.Lines local L=K[J+1]I=I+1 if L then local M,N
,O=L:sub(I-1,I-1),L:sub(I,I),L:sub(I+1,I+1)local P=(#M>0 and M or' ')..(#N>0 and
N or' ')..(#O>0 and O or' ')for Q,R in pairs(C)do if P:find(Q)then return R end
end end return 0 end t.SetEditing=function(H,I,J)if J then H:UpdateCursor(J)end
if I then if H.Editable then H.GuiElems.EditBox.Text=''H.GuiElems.EditBox:
CaptureFocus()end else H.GuiElems.EditBox:ReleaseFocus()end end t.CursorAnim=
function(H,I)local J,K=H.GuiElems.Cursor,tick()H.LastAnimTime=K if not I then
return end D.Invis:Cancel()D.Vis:Cancel()J.BackgroundTransparency=0 coroutine.
wrap(function()while H.Editable do r.FastWait(0.5)if H.LastAnimTime~=K then
return end D.Invis:Play()r.FastWait(0.5)if H.LastAnimTime~=K then return end D.
Vis:Play()end end)()end t.MoveCursor=function(H,I,J)H.CursorX=I H.CursorY=J H:
UpdateCursor()H:JumpToCursor()end t.JumpToCursor=function(H)H:Refresh()end t.
UpdateCursor=function(H,I)local J,K=H.GuiElems.LinesFrame,H.GuiElems.Cursor
local L,M=math.max(0,J.AbsoluteSize.X),math.max(0,J.AbsoluteSize.Y)local N,O,P,Q
,R,S=math.ceil(M/H.FontSize),math.ceil(L/math.ceil(H.FontSize/2)),H.ViewX,H.
ViewY,tostring(#H.Lines),math.ceil(H.FontSize/2)local T=#R*S+4*S if I then local
U=H.GuiElems.LinesFrame local V,W,X,Y,Z,_=U.AbsolutePosition.X,U.
AbsolutePosition.Y,I.Position.X,I.Position.Y,math.ceil(H.FontSize/2),H.FontSize
H.CursorX=H.ViewX+math.round((X-V)/Z)H.CursorY=H.ViewY+math.floor((Y-W)/_)end
local U,V=H.CursorX,H.CursorY local W=H.Lines[V+1]or''if U>#W then U=#W elseif U
<0 then U=0 end if V>=#H.Lines then V=math.max(0,#H.Lines-1)elseif V<0 then V=0
end U=U+H:TabAdjust(U,V)H.CursorX=U H.CursorY=V local X=(U>=P)and(V>=Q)and(U<=P+
O)and(V<=Q+N)if X then local Y,Z=(U-P),(V-Q)K.Position=UDim2.new(0,T+Y*math.
ceil(H.FontSize/2)-1,0,Z*H.FontSize)K.Size=UDim2.new(0,1,0,H.FontSize+2)K.
Visible=true H:CursorAnim(true)else K.Visible=false end end t.MapNewLines=
function(H)local I,J,K,L,M={},1,H.Text,string.find,1 local N=L(K,'\n',M,true)
while N do I[J]=N J=J+1 M=N+1 N=L(K,'\n',M,true)end H.NewLines=I end t.
PreHighlight=function(H)local I=H.Text:gsub('\\\\','  ')local J,K,L,M,N,O=#I,{},
{},{},string.find,string.sub H.ColoredLines={}local P=function(P,Q,R,S)local T,U
=#K+1,1 local V,W,X=N(P,Q,U,S)while V do K[T]=V L[V]=R if X then M[V]=X end T=T+
1 U=W+1 V,W,X=N(P,Q,U,S)end end P(I,'"',1,true)P(I,"'",2,true)P(I,'%[(=*)%[',3)
P(I,'--',4,true)table.sort(K)local Q,R,S,T,U=H.NewLines,0,0,0,{}for V=1,#K do
local W=K[V]if W<=T then continue end local X,Y=W,L[W]if Y==1 then X=N(I,'"',W+1
,true)while X and O(I,X-1,X-1)=='\\'do X=N(I,'"',X+1,true)end if not X then X=J
end elseif Y==2 then X=N(I,"'",W+1,true)while X and O(I,X-1,X-1)=='\\'do X=N(I,
"'",X+1,true)end if not X then X=J end elseif Y==3 then _,X=N(I,']'..M[W]..']',W
+1,true)if not X then X=J end elseif Y==4 then local Z=L[W+2]if Z==3 then _,X=N(
I,']'..M[W+2]..']',W+1,true)if not X then X=J end else X=N(I,'\n',W+1,true)or J
end end while W>S do R=R+1 S=Q[R]or J+1 end while true do local Z=U[R]if not Z
then Z={}U[R]=Z end Z[W]={Y,X}if X>S then R=R+1 S=Q[R]or J+1 else break end end
T=X end H.PreHighlights=U end t.HighlightLine=function(H,I)local J=H.
ColoredLines[I]if J then return J end local K,L,M,N,O,P,Q,R,S,T,U,V,W=string.sub
,string.find,string.match,{},H.PreHighlights[I]or{},H.Lines[I]or'',0,0,false,0,H
.NewLines[I-1]or 0,{}for X,Y in next,O do local Z=X-U if Z<1 then R=Y[1]Q=Y[2]-U
else V[Z]={Y[1],Y[2]-U}end end for X=1,#P do if X<=Q then N[X]=R continue end
local Y=V[X]if Y then R=Y[1]Q=Y[2]N[X]=R S=false W=nil T=0 else local Z=K(P,X,X)
if L(Z,'[%a_]')then local _=M(P,'[%a%d_]+',X)local aa=(w[_]and 7)or(x[_]and 8)Q=
X+#_-1 if aa~=7 then if S then local ab=W and x[W]aa=(ab and type(ab)=='table'
and ab[_]and 8)or 10 end if aa~=8 then local ab,ac,ad=L(P,'^%s*([%({"\'])',Q+1)
if ab then aa=(T>0 and ad=='('and 16)or 9 T=0 end end else aa=v[_]or aa T=(_==
'function'and 1 or 0)end W=_ S=false if T>0 then T=1 end if aa then R=aa N[X]=R
else R=nil end elseif L(Z,'%p')then local aa=(Z=='.')local ab=aa and L(K(P,X+1,X
+1),'%d')N[X]=(ab and 6 or 5)if not ab then local ac=aa and M(P,'%.%.?%.?',X)if
ac and#ac>1 then R=5 Q=X+#ac-1 S=false W=nil T=0 else if aa then if S then W=nil
else S=true end else S=false W=nil end T=((aa or Z==':')and T==1 and 2)or 0 end
end elseif L(Z,'%d')then local aa,ab=L(P,'%x+',X)local ac=K(P,ab,ab+1)if(ac==
'e+'or ac=='e-')and L(K(P,ab+2,ab+2),'%d')then ab=ab+1 end R=6 Q=ab N[X]=6 S=
false W=nil T=0 else N[X]=R local aa,ab=L(P,'%s+',X)if ab then Q=ab end end end
end H.ColoredLines[I]=N return N end t.Refresh=function(aa)local ab=aa.Frame.
Lines local ac,ad=math.max(0,ab.AbsoluteSize.X),math.max(0,ab.AbsoluteSize.Y)
local H,I,J,K,L,M,N=math.ceil(ad/aa.FontSize),math.ceil(ac/math.ceil(aa.FontSize
/2)),string.gsub,string.sub,aa.ViewX,aa.ViewY,''for O=1,H do local P=aa.
LineFrames[O]if not P then P=p'Frame'P.Name='Line'P.Position=UDim2.new(0,0,0,(O-
1)*aa.FontSize)P.Size=UDim2.new(1,0,0,aa.FontSize)P.BorderSizePixel=0 P.
BackgroundTransparency=1 local Q=p'Frame'Q.Name='SelectionHighlight'Q.
BorderSizePixel=0 Q.BackgroundColor3=e.Theme.Syntax.SelectionBack Q.Parent=P Q.
BackgroundTransparency=0.7 local R=p'TextLabel'R.Name='Label'R.
BackgroundTransparency=1 R.FontFace=aa.FontFace R.TextSize=aa.FontSize R.Size=
UDim2.new(1,0,0,aa.FontSize)R.RichText=true R.TextXAlignment=Enum.TextXAlignment
.Left R.TextColor3=aa.Colors.Text R.ZIndex=2 R.Parent=P P.Parent=ab aa.
LineFrames[O]=P end local Q=M+O local R,S,T,U,V=aa.Lines[Q]or'','',aa:
HighlightLine(Q),L+1,aa.RichTemplates local W,X,Y=V.Text,V.Selection,T[U]local Z
,_=V[u[Y] ]or W,aa.SelectionRange local ae,af,ag=_[1],_[2],Q-1 if ag>=ae[2]and
ag<=af[2]then local ah,ai=math.ceil(aa.FontSize/2),(ag==ae[2]and ae[1]or 0)-L
local aj=(ag==af[2]and af[1]-ai-L or I+L)P.SelectionHighlight.Position=UDim2.
new(0,ai*ah,0,0)P.SelectionHighlight.Size=UDim2.new(0,aj*ah,1,0)P.
SelectionHighlight.Visible=true else P.SelectionHighlight.Visible=false end for
ah=2,I do local ai=L+ah local aj=T[ai]if aj~=Y then local ak=V[u[aj] ]or W if ak
~=Z then local al=J(K(R,U,ai-1),'[\'"<>&]',z)S=S..(Z~=W and(Z..al..'</font>')or
al)U=ai Z=ak end Y=aj end end local ah=J(K(R,U,L+I),'[\'"<>&]',z)if#ah>0 then S=
S..(Z~=W and(Z..ah..'</font>')or ah)end if aa.Lines[Q]then N=N..(Q-1==aa.CursorY
and('<b>'..Q..'</b>\n')or Q..'\n')end P.Label.Text=S end for ae=H+1,#aa.
LineFrames do aa.LineFrames[ae]:Destroy()aa.LineFrames[ae]=nil end aa.Frame.
LineNumbers.Text=N aa:UpdateCursor()end t.UpdateView=function(aa)local ab,ac=
tostring(#aa.Lines),math.ceil(aa.FontSize/2)local ad,ae=#ab*ac+4*ac,aa.Frame.
Lines local af,ag=ae.AbsoluteSize.X,ae.AbsoluteSize.Y local ah,ai,aj,ak=math.
ceil(ag/aa.FontSize),aa.MaxTextCols*ac,aa.ScrollV,aa.ScrollH aj.VisibleSpace=ah
aj.TotalSpace=#aa.Lines+1 ak.VisibleSpace=math.ceil(af/ac)ak.TotalSpace=aa.
MaxTextCols+1 aj.Gui.Visible=#aa.Lines+1>ah ak.Gui.Visible=ai>af local al=aa.
FrameOffsets aa.FrameOffsets=Vector2.new(aj.Gui.Visible and-10 or 0,ak.Gui.
Visible and-10 or 0)if al~=aa.FrameOffsets then aa:UpdateView()else aj:ScrollTo(
aa.ViewY,true)ak:ScrollTo(aa.ViewX,true)if aj.Gui.Visible and ak.Gui.Visible
then aj.Gui.Size=UDim2.new(0,10,1,-10)ak.Gui.Size=UDim2.new(1,-10,0,10)aa.
GuiElems.ScrollCorner.Visible=true else aj.Gui.Size=UDim2.new(0,10,1,0)ak.Gui.
Size=UDim2.new(1,0,0,10)aa.GuiElems.ScrollCorner.Visible=false end aa.ViewY=aj.
Index aa.ViewX=ak.Index aa.Frame.Lines.Position=UDim2.new(0,ad,0,0)aa.Frame.
Lines.Size=UDim2.new(1,-ad+al.X,1,al.Y)aa.Frame.LineNumbers.Position=UDim2.new(0
,ac,0,0)aa.Frame.LineNumbers.Size=UDim2.new(0,#ab*ac,1,al.Y)aa.Frame.LineNumbers
.TextSize=aa.FontSize end end t.ProcessTextChange=function(aa)local ab,ac=0,aa.
Lines for ad=1,#ac do local ae=#ac[ad]if ae>ab then ab=ae end end aa.MaxTextCols
=ab aa:UpdateView()aa.Text=table.concat(aa.Lines,'\n')aa:MapNewLines()aa:
PreHighlight()aa:Refresh()end t.ConvertText=function(aa,ab,ac)if ac then local
ad=ab:gsub('\t','    ')return ad:gsub('\t',(' %s%s '):format(A,A))else return ab
:gsub((' %s%s '):format(A,A),'\t')end end t.GetText=function(aa)local ab=table.
concat(aa.Lines,'\n')return aa:ConvertText(ab,false)end t.SetText=function(aa,ab
)ab=aa:ConvertText(ab,true)local ac=aa.Lines table.clear(ac)local ad=1 for ae in
ab:gmatch'([^\n\r]*)[\n\r]?'do ac[ad]=ae ad=ad+1 end aa:ProcessTextChange()end t
.ClearText=function(aa)local ab,ac=aa:ConvertText('',true),aa.Lines table.clear(
ac)local ad=1 for ae in ab:gmatch'([^\n\r]*)[\n\r]?'do ac[ad]=ae ad=ad+1 end aa:
ProcessTextChange()end t.CompileText=function(aa)local ab=pcall(function()local
ab=table.concat(aa.Lines,'\n')local ac=aa:ConvertText(ab,false)loadstring(ac)()
end)return ab end t.ReturnErrors=function(aa)local ab,ac=pcall(function()local
ab=table.concat(aa.Lines,'\n')local ac=aa:ConvertText(ab,false)loadstring(ac)()
end)return not ab and ac or nil end t.GetVersion=function(aa)return c end t.
MakeRichTemplates=function(aa)local ab,ac=math.floor,{}for ad,ae in pairs(aa.
Colors)do ac[ad]=('<font color="rgb(%s,%s,%s)">'):format(ab(ae.r*255),ab(ae.g*
255),ab(ae.b*255))end aa.RichTemplates=ac end t.ApplyTheme=function(aa)local ab=
e.Theme.Syntax aa.Colors=ab aa.Frame.LineNumbers.TextColor3=ab.Text aa.Frame.
BackgroundColor3=ab.Background end local aa={__index=t}local ab=function(ab)ab=
ab or{}if not y then E()end local ac,ad=r.ScrollBar.new(),r.ScrollBar.new(true)
ad.Gui.Position=UDim2.new(0,0,1,-10)local ae={FontFace=Font.fromEnum(Enum.Font.
Code),FontSize=14,ViewX=0,ViewY=0,Colors=e.Theme.Syntax,ColoredLines={},Lines={
''},LineFrames={},Editable=true,Editing=false,CursorX=0,CursorY=0,FloatCursorX=0
,Text='',PreHighlights={},SelectionRange={{-1,-1},{-1,-1}},NewLines={},
FrameOffsets=Vector2.new(0,0),MaxTextCols=0,ScrollV=ac,ScrollH=ad}local af=n(ae,
ab)local ag=setmetatable(af,aa)t.SetTextMultiplier=(function(ah)ag.FontSize=ah
end)t.GetTextMultiplier=(function()return ag.FontSize end)ac.WheelIncrement=3 ad
.Increment=2 ad.WheelIncrement=7 ac.Scrolled:Connect(function()ag.ViewY=ac.Index
ag:Refresh()end)ad.Scrolled:Connect(function()ag.ViewX=ad.Index ag:Refresh()end)
ag:MakeEditorFrame(ag)ag:MakeRichTemplates()ag:ApplyTheme()ac:SetScrollFrame(ag.
Frame.Lines)ac.Gui.Parent=ag.Frame ad.Gui.Parent=ag.Frame ag:UpdateView()ag:
SetText(af.Text)ag.Frame:GetPropertyChangedSignal'AbsoluteSize':Connect(function
()ag:UpdateView()ag:Refresh()end)return ag end return{new=ab}end)()return r end
function b.b()local aa,ab,ac={Services={},OnInitConnections={}},get_hidden_gui
or gethui,cloneref or function(...)return...end local ad=aa.Services
setmetatable(ad,{__index=function(ae,af)local ag=game:GetService(af)return ac(ag
)end})local ae,af=(ad.CoreGui)function aa:AddOnInit(ag)local ah=self.
OnInitConnections table.insert(ah,ag)end function aa:NewReference(ag)return ac(
ag)end function aa:CallOnInitConnections(ag,...)local ah=self.OnInitConnections
af=ag for ai,aj in next,ah do aj(af,...)end end function aa:SetProperties(ag,ah)
for ai,aj in next,ah do pcall(function()ag[ai]=aj end)end end function aa:
NewClass(ag,ah)ah=ah or{}ag.__index=ag return setmetatable(ah,ag)end function aa
:CheckConfig(ag,ah,ai,aj)if not ag then return end for ak,al in next,ah do if ag
[ak]~=nil then continue end if aj then if table.find(aj,ak)then continue end end
if ai then al=al()end ag[ak]=al end return ag end function aa:ResolveUIParent()
local ag,ah=af.PlayerGui,af.Debug local ai,aj={[1]=function()local ai=ab()if ai.
Parent==ae then return end return ai end,[2]=function()return ae end,[3]=
function()return ag end},af:CreateInstance'ScreenGui'for ak,al in next,ai do
local c,d=pcall(al)if not c or not d then continue end local e=pcall(function()
aj.Parent=d end)if not e then continue end if ah then af:Warn(`Step: {ak} was chosen as the parent!: {
d}`)end return d end af:Warn'The ReGui container does not have a parent defined'
return nil end function aa:GetChildOfClass(ag,ah)local ai=ag:
FindFirstChildOfClass(ah)if not ai then ai=af:CreateInstance(ah,ag)end return ai
end function aa:CheckAssetUrl(ag)if tonumber(ag)then return`rbxassetid://{ag}`
end return ag end function aa:SetPadding(ag,ah)if not ag then return end self:
SetProperties(ag,{PaddingBottom=ah,PaddingLeft=ah,PaddingRight=ah,PaddingTop=ah}
)end return aa end function b.c()local aa,ab=b.load'b',{DefaultTweenInfo=
TweenInfo.new(0.08)}local ac=aa.Services local ad=ac.TweenService function ab:
Tween(ae)local af,ag,ah=self.DefaultTweenInfo,ae.Object,ae.NoAnimation local ai,
aj,ak,al=ae.Tweeninfo or af,ae.EndProperties,ae.StartProperties,ae.Completed if
ak then aa:SetProperties(ag,ak)end if ah then aa:SetProperties(ag,aj)if al then
al()end return end local c for d,e in next,aj do local f={[d]=e}local g,h=pcall(
function()return ad:Create(ag,ai,f)end)if not g then aa:SetProperties(ag,f)
continue end if not c then c=h end h:Play()end if al then if c then c.Completed:
Connect(al)else al()end end return c end function ab:Animate(ae)local af,ag,ah,
ai,aj=ae.NoAnimation,ae.Objects,ae.Tweeninfo,(ae.Completed)for ak,al in next,ag
do local c=self:Tween{NoAnimation=af,Object=ak,Tweeninfo=ah,EndProperties=al}if
not aj then aj=c end end if ai then aj.Completed:Connect(ai)end return aj end
function ab:HeaderCollapseToggle(ae)aa:CheckConfig(ae,{Rotations={Open=90,Closed
=0}})local af,ag,ah,ai,aj=ae.Toggle,ae.NoAnimation,ae.Rotations,ae.Collapsed,ae.
Tweeninfo local ak=ai and ah.Closed or ah.Open self:Tween{Tweeninfo=aj,
NoAnimation=ag,Object=af,EndProperties={Rotation=ak}}end function ab:
HeaderCollapse(ae)local af,ag,ah,ai,aj,ak,al,c,d,e,f=ae.Tweeninfo,ae.Collapsed,
ae.ClosedSize,ae.OpenSize,ae.Toggle,ae.Resize,ae.Hide,ae.NoAnimation,ae.
NoAutomaticSize,ae.IconRotations,ae.Completed if not d then ak.AutomaticSize=
Enum.AutomaticSize.None end if not ag then al.Visible=true end self:
HeaderCollapseToggle{Tweeninfo=af,Collapsed=ag,NoAnimation=c,Toggle=aj,Rotations
=e}local g=self:Tween{Tweeninfo=af,NoAnimation=c,Object=ak,StartProperties={Size
=ag and ai or ah},EndProperties={Size=ag and ah or ai},Completed=function()al.
Visible=not ag if f then f()end if ag then return end if d then return end ak.
Size=UDim2.fromScale(1,0)ak.AutomaticSize=Enum.AutomaticSize.Y end}return g end
return ab end function b.d()local aa={}aa.__index=aa local ab=b.load'b'function
aa:Fire(...)local ac=self:GetConnections()if#ac<=0 then return end for ad,ae in
next,ac do ae(...)end end function aa:GetConnections()local ac=self.Connections
return ac end function aa:Connect(ac)local ad=self:GetConnections()table.insert(
ad,ac)end function aa:DisconnectConnections()local ac=self:GetConnections()table
.clear(ac)end function aa:NewSignal()return ab:NewClass(aa,{Connections={}})end
return aa end function b.e()return function(aa)local ab=aa:Window{Title=
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
}local al=ak:CollapsingHeader{Title='Help'}al:Separator{Text='ABOUT THIS DEMO:'}
al:BulletText{Rows={
[[Sections below are demonstrating many aspects of the library.]]}}al:Separator{
Text='PROGRAMMER GUIDE:'}al:BulletText{Rows={
[[See example FAQ, examples, and documentation at https://depso.gitbook.io/regui]]
}}al:Indent():BulletText{Rows={'See example applications in the /demo folder.'}}
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
local h,i,j=ak:CollapsingHeader{Title='Widgets'},{'Basic','Tooltips',
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
Enum.DominantAxis.Width,Size=UDim2.fromScale(1,1)}i:Play()local j=h:Row{Expanded
=true}j:Button{Text='Pause',Callback=function()i:Pause()end}j:Button{Text='Play'
,Callback=function()i:Play()end}if not i.IsLoaded then i.Loaded:Wait()end local
k=j:SliderInt{Format='%.f',Value=0,Minimum=0,Maximum=i.TimeLength,Callback=
function(k,l)i.TimePosition=l end}game:GetService'RunService'.RenderStepped:
Connect(function(l)k:SetValue(i.TimePosition)end)end,['Tree Nodes']=function(h)
for i=1,5 do local j=h:TreeNode{Title=`Child {i}`,Collapsed=i~=1}local k=j:Row()
k:Label{Text='Blah blah'}k:SmallButton{Text='Button'}end h:TreeNode{Title=`With icon & NoArrow`
,NoArrow=true,Icon=aa.Icons.Image}end,['Collapsing Headers']=function(h)local i
h:Checkbox{Value=true,Label='Show 2nd header',Callback=function(j,k)if i then i:
SetVisible(k)end end}h:Checkbox{Value=true,Label='2nd has arrow',Callback=
function(j,k)if i then i:SetArrowVisible(k)end end}local j=h:CollapsingHeader{
Title='Header'}for k=1,5 do j:Label{Text=`Some content {k}`}end i=h:
CollapsingHeader{Title='Second Header'}for k=1,5 do i:Label{Text=`More content {
k}`}end end,Bullets=function(h)h:BulletText{Rows={'Bullet point 1',
'Bullet point 2\nOn multiple lines'}}h:TreeNode():BulletText{Rows={
'Another bullet point'}}h:Bullet():Label{Text='Bullet point 3 (two calls)'}h:
Bullet():SmallButton()end,Text=function(h)local i=h:TreeNode{Title=
'Colorful Text'}i:Label{TextColor3=Color3.fromRGB(255,0,255),Text='Pink',NoTheme
=true}i:Label{TextColor3=Color3.fromRGB(255,255,0),Text='Yellow',NoTheme=true}i:
Label{TextColor3=Color3.fromRGB(59,59,59),Text='Disabled',NoTheme=true}local j=h
:TreeNode{Title='Word Wrapping'}j:Label{Text=
[[This text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.]]
,TextWrapped=true}local k j:SliderInt{Label='Wrap width',Value=400,Minimum=20,
Maximum=600,Callback=function(l,m)if not k then return end k.Size=UDim2.
fromOffset(m,0)end}j:Label{Text='Test paragraph:'}k=j:Label{Text=
[[The lazy dog is a good dog. This paragraph should fit. Testing a 1 character word. The quick brown fox jumps over the lazy dog.]]
,TextWrapped=true,Border=true,BorderColor=Color3.fromRGB(255,255,0),
AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.fromOffset(400,0)}end,Images=
function(h)h:Label{TextWrapped=true,Text=
[[Below we are displaying the icons (which are the ones builtin to ReGui in this demo). Hover the texture for a zoomed view!]]
}h:Label{TextWrapped=true,Text=`There is a total of {aa:GetDictSize(aa.Icons)} icons in this demo!`
}local i,j,k=(h:List{Border=true})aa:SetItemTooltip(i,function(l)j=l:Label()k=l:
Image{Size=UDim2.fromOffset(50,50)}end)for l,m in aa.Icons do local n=i:Image{
Image=m,Size=UDim2.fromOffset(30,30)}aa:DetectHover(n,{MouseEnter=true,OnInput=
function()j.Text=l k.Image=m end})end end,Tabs=function(h)local i=h:TreeNode{
Title='Basic'}local j,k=i:TabSelector(),{'Avocado','Broccoli','Cucumber'}for l,m
in next,k do j:CreateTab{Name=m}:Label{Text=`This is the {m} tab!\nblah blah blah blah blah`
}end local l=h:TreeNode{Title='Advanced & Close Button'}local m,n=l:TabSelector(
),{'Artichoke','Beetroot','Celery','Daikon'}for o,p in next,n do local q=m:
CreateTab{Name=p,Closeable=true}q:Label{Text=`This is the {p} tab!\nblah blah blah blah blah`
}end l:Button{Text='Add tab',Callback=function()m:CreateTab{Closeable=true}:
Label{Text='I am an odd tab.'}end}end,['Plot widgets']=function(h)local i=h:
PlotHistogram{Points={0.6,0.1,1,0.5,0.92,0.1,0.2}}h:Button{Text=
'Generate new graph',Callback=function()local j={}for k=1,math.random(5,10)do
table.insert(j,math.random(1,10))end i:PlotGraph(j)end}end,[
'Multi-component Widgets']=function(h)h:Separator{Text='2-wide'}h:InputInt2{
Value={10,50},Minimum={0,0},Maximum={20,100},Callback=function(i,j)print('1:',j[
1],'2:',j[2])end}h:SliderInt2()h:SliderFloat2()h:DragInt2()h:DragFloat2()h:
Separator{Text='3-wide'}h:InputInt3()h:SliderInt3()h:SliderFloat3()h:DragInt3()h
:DragFloat3()h:Separator{Text='4-wide'}h:InputInt4()h:SliderInt4()h:
SliderFloat4()h:DragInt4()h:DragFloat4()end,['Progress Bars']=function(h)local i
=h:ProgressBar{Label='Loading...',Value=80}spawn(function()local j=0 while wait(
0.02)do j+=1 i:SetPercentage(j%100)end end)end,['Picker Widgets']=function(h)h:
Separator{Text='Color pickers'}h:DragColor3{Value=aa.Accent.Light}h:SliderColor3
{Value=aa.Accent.Red}h:InputColor3{Value=aa.Accent.Green}h:Separator{Text=
'CFrame pickers'}h:DragCFrame{Value=CFrame.new(1,1,1),Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50)}h:SliderCFrame()h:InputCFrame()end,['Code editor'
]=function(h)h:CodeEditor{Text='print("Hello from ReGui\'s editor!")',Editable=
true}end,Console=function(h)local i=h:TreeNode{Title='Basic'}local j,k=i:Console
{ReadOnly=true,AutoScroll=true,MaxLines=50},h:TreeNode{Title=
'Advanced & RichText'}local l,m=k:Console{ReadOnly=true,AutoScroll=true,RichText
=true,MaxLines=50},h:TreeNode{Title='Editor'}m:Console{Value=
"print('Hello world!')",LineNumbers=true}coroutine.wrap(function()while wait()do
local n=DateTime.now():FormatLocalTime('h:mm:ss A','en-us')l:AppendText(`<font color="rgb(240, 40, 10)">[Random]</font>`
,math.random())j:AppendText(`[{n}] Hello world!`)end end)()end,Combo=function(h)
h:Combo{WidthFitPreview=true,Label='WidthFitPreview',Selected=1,Items={
'AAAAAAAAAAAA','BBBBBBBB','CCCCC','DDD'}}h:Separator{Text='One-liner variants'}h
:Combo{Label='Combo 1 (array)',Selected=1,Items={'AAAA','BBBB','CCCC','DDDD',
'EEEE','FFFF','GGGG','HHHH','IIIIIII','JJJJ','KKKKKKK'}}h:Combo{Label=
'Combo 1 (dict)',Selected='AAA',Items={AAA='Apple',BBB='Banana',CCC='Orange'},
Callback=print}h:Combo{Label='Combo 2 (function)',Selected=1,GetItems=function()
return{'aaa','bbb','ccc'}end}end,Indent=function(h)h:Label{Text=
'This is not indented'}local i=h:Indent{Offset=30}i:Label{Text=
'This is indented by 30 pixels'}local j=i:Indent{Offset=30}j:Label{Text=
'This is indented by 30 more pixels'}end,Viewport=function(h)local i=aa:
InsertPrefab'R15 Rig'local j=h:Viewport{Size=UDim2.new(1,0,0,200),Clone=true,
Model=i}local k=j.Model k:PivotTo(CFrame.new(0,-2.5,-5))local l=game:GetService
'RunService'l.RenderStepped:Connect(function(m)local n=CFrame.Angles(0,math.rad(
30*m),0)local o=k:GetPivot()*n k:PivotTo(o)end)end,['List layout']=function(h)
local i=h:List()for j=1,10 do i:Button{Text=`Resize the window! {j}`}end end,
Keybinds=function(h)local i=h:Checkbox{Value=true}h:Keybind{Label=
'Toggle checkbox',IgnoreGameProcessed=false,OnKeybindSet=function(j,k)warn(
'[OnKeybindSet] .Value ->',k)end,Callback=function(j,k)print(k)i:Toggle()end}h:
Keybind{Label='Keybind (w/ Q & Left-Click blacklist)',KeyBlacklist={Enum.
UserInputType.MouseButton1,Enum.KeyCode.Q}}h:Keybind{Label=
'Toggle UI visibility',Value=Enum.KeyCode.E,Callback=function()ag:
ToggleVisibility()end}end,Input=function(h)h:InputText{Label='One Line Text'}h:
InputTextMultiline{Label='Multiline Text'}h:InputInt{Label='Input int'}end,[
'Text Input']=function(h)local i=h:TreeNode{Title='Multiline'}i:
InputTextMultiline{Size=UDim2.new(1,0,0,117),Value=
'/*The Pentium FOOF bug, shorthand for FO OF C7 C8,\r\n    the hexadecimal encoding of one offending instruction,\r\n    more formally, the invalid operand with locked CMPXCHG8B\r\n    instruction bug, is a design flaw in the majority of\r\n    Intel Pentium, Pentium MMX, and Pentium OverDrive\r\n    processors (all in the P5 microarchitecture).#\r\n    */'
}end}for k,l in i do local m,n=h:TreeNode{Title=l},j[l]if n then task.spawn(n,m)
end end local k=ak:CollapsingHeader{Title='Popups & child windows'}local l=k:
TreeNode{Title='Popups'}local m=l:Row()local n=m:Label{Text='<None>',LayoutOrder
=2}m:Button{Text='Select..',Callback=function(o)local p,q={'Bream','Haddock',
'Mackerel','Pollock','Tilefish'},l:PopupCanvas{RelativeTo=o,MaxSizeX=200}q:
Separator{Text='Aquarium'}for r,s in p do q:Selectable{Text=s,Callback=function(
t)n.Text=s q:ClosePopup()end}end end}local o=k:TreeNode{Title='Child windows'}
local p=o:Window{Size=UDim2.fromOffset(300,200),NoMove=true,NoClose=true,
NoCollapse=true,NoResize=true}p:Label{Text='Hello, world!'}p:Button{Text='Save'}
p:InputText{Label='string'}p:SliderFloat{Label='float',Minimum=0,Maximum=1}local
q=k:TreeNode{Title='Modals'}q:Label{Text=
[[Modal windows are like popups but the user cannot close them by clicking outside.]]
,TextWrapped=true}q:Button{Text='Delete..',Callback=function()local r=q:
PopupModal{Title='Delete?'}r:Label{Text=
'All those beautiful files will be deleted.\r\nThis operation cannot be undone!'
,TextWrapped=true}r:Separator()r:Checkbox{Value=false,Label=
"Don't ask me next time"}local s=r:Row{Expanded=true}s:Button{Text='Okay',
Callback=function()r:ClosePopup()end}s:Button{Text='Cancel',Callback=function()r
:ClosePopup()end}end}q:Button{Text='Stacked modals..',Callback=function()local r
=q:PopupModal{Title='Stacked 1'}r:Label{Text=`Hello from Stacked The First\nUsing Theme["ModalWindowDimBg"] behind it.`
,TextWrapped=true}r:Combo{Items={'aaaa','bbbb','cccc','dddd','eeee'}}r:
DragColor3{Value=Color3.fromRGB(102,178,0)}r:Button{Text='Add another modal..',
Callback=function()local s=q:PopupModal{Title='Stacked 2'}s:Label{Text=
'Hello from Stacked The Second!',TextWrapped=true}s:DragColor3{Value=Color3.
fromRGB(102,178,0)}s:Button{Text='Close',Callback=function()s:ClosePopup()end}
end}r:Button{Text='Close',Callback=function()r:ClosePopup()end}end}local r=ak:
CollapsingHeader{Title='Tables & Columns'}local s=r:TreeNode{Title='Basic'}local
t=s:Table()for u=1,3 do local v=t:Row()for w=1,3 do local x=v:Column()for y=1,4
do x:Label{Text=`Row {y} Column {w}`}end end end local u=r:TreeNode{Title=
'Borders, background'}local v=u:Table{RowBackground=true,Border=true,MaxColumns=
3}for w=1,5 do local x=v:NextRow()for y=1,3 do local z=x:NextColumn()z:Label{
Text=`Hello {y},{w}`}end end local w=r:TreeNode{Title='With headers'}local x,y=w
:Table{Border=true,RowBackground=true,MaxColumns=3},{'One','Two','Three'}for z=1
,7 do if z==1 then m=x:HeaderRow()else m=x:Row()end for A,B in y do if z==1 then
local C=m:Column()C:Label{Text=B}continue end local C=m:NextColumn()C:Label{Text
=`Hello {A},{z}`}end end end end function b.f()return{Dot=
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
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}end function b.g
()return{Light=Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),
ExtraDark=Color3.fromRGB(28,39,53),White=Color3.fromRGB(240,240,240),Gray=Color3
.fromRGB(172,171,175),Black=Color3.fromRGB(15,19,24),Yellow=Color3.fromRGB(230,
180,0),Orange=Color3.fromRGB(230,150,0),Green=Color3.fromRGB(130,188,91),Red=
Color3.fromRGB(255,69,69),ImGui={Light=Color3.fromRGB(66,150,250),Dark=Color3.
fromRGB(41,74,122),Black=Color3.fromRGB(15,15,15),Gray=Color3.fromRGB(36,36,36)}
}end function b.h()local aa,ab=b.load'g',{}ab.DarkTheme={Values={
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
=0}}return ab end function b.i()local aa,ab=(b.load'b')aa:AddOnInit(function(ac)
ab=ac end)return{{Properties={'Center'},Callback=function(ac,ad,ae)local af=ad.
Position aa:SetProperties(ad,{Position=UDim2.new(ae:find'X'and 0.5 or af.X.Scale
,af.X.Offset,ae:find'Y'and 0.5 or af.Y.Scale,af.Y.Offset),AnchorPoint=Vector2.
new(ae:find'X'and 0.5 or 0,ae:find'Y'and 0.5 or 0)})end},{Properties={
'ElementStyle'},Callback=function(ac,ad,ae)ab:ApplyStyle(ad,ae)end},{Properties=
{'ColorTag'},Callback=function(ac,ad,ae)local af,ag=ac.Class,ac.WindowClass
local ah=af.NoAutoTheme if not ag then return end if ah then return end ab:
UpdateColors{Object=ad,Tag=ae,NoAnimation=true,Theme=ag.Theme}end},{Properties={
'Animation'},Callback=function(ac,ad,ae)local af=ac.Class.NoAnimation if af then
return end ab:SetAnimation(ad,ae)end},{Properties={'Image'},Callback=function(ac
,ad,ae)local af=ac.WindowClass ad.Image=aa:CheckAssetUrl(ae)ab:DynamicImageTag(
ad,ae,af)end},{Properties={'Icon','IconSize','IconRotation','IconPadding'},
Callback=function(ac,ad,ae)local af=ad:FindFirstChild('Icon',true)if not af then
ab:Warn('No icon for',ad)return end local ag=ac.Class aa:CheckConfig(ag,{Icon=''
,IconSize=UDim2.fromScale(1,1),IconRotation=0,IconPadding=UDim2.new(0,2)})local
ah=af.Parent:FindFirstChild'UIPadding'aa:SetPadding(ah,ag.IconPadding)local ai=
ag.Icon ai=aa:CheckAssetUrl(ai)local aj=ac.WindowClass ab:DynamicImageTag(af,ai,
aj)aa:SetProperties(af,{Visible=af~='',Image=aa:CheckAssetUrl(ai),Size=ag.
IconSize,Rotation=ag.IconRotation})end},{Properties={'BorderThickness','Border',
'BorderColor'},Callback=function(ac,ad,ae)local af=ac.Class local ag=af.Border==
true aa:CheckConfig(af,{BorderTransparency=ac:GetThemeKey
'BorderTransparencyActive',BorderColor=ac:GetThemeKey'Border',BorderThickness=1,
BorderStrokeMode=Enum.ApplyStrokeMode.Border})local ah=aa:GetChildOfClass(ad,
'UIStroke')aa:SetProperties(ah,{Transparency=af.BorderTransparency,Thickness=af.
BorderThickness,Color=af.BorderColor,ApplyStrokeMode=af.BorderStrokeMode,Enabled
=ag})end},{Properties={'Ratio'},Callback=function(ac,ad,ae)local af=ac.Class aa:
CheckConfig(af,{Ratio=1.3333333333333333,RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize})local ag,ah,ai,aj=af.Ratio,
af.RatioAxis,af.RatioAspectType,aa:GetChildOfClass(ad,'UIAspectRatioConstraint')
aa:SetProperties(aj,{DominantAxis=ah,AspectType=ai,AspectRatio=ag})end},{
Properties={'FlexMode'},Callback=function(ac,ad,ae)local af=aa:GetChildOfClass(
ad,'UIFlexItem')af.FlexMode=ae end},{Properties={'CornerRadius'},Callback=
function(ac,ad,ae)local af=aa:GetChildOfClass(ad,'UICorner')af.CornerRadius=ae
end},{Properties={'Fill'},Callback=function(ac,ad,ae)if ae~=true then return end
local af=ac.Class aa:CheckConfig(af,{Size=UDim2.fromScale(1,1),UIFlexMode=Enum.
UIFlexMode.Fill,AutomaticSize=Enum.AutomaticSize.None})local ag=aa:
GetChildOfClass(ad,'UIFlexItem')ag.FlexMode=af.UIFlexMode ad.Size=af.Size ad.
AutomaticSize=af.AutomaticSize end},{Properties={'Label'},Callback=function(ac,
ad,ae)local af,ag=ac.Class,ad:FindFirstChild'Label'if not ag then return end ag.
Text=tostring(ae)function af:SetLabel(ah)ag.Text=ah return self end end},{
Properties={'NoGradient'},WindowProperties={'NoGradients'},Callback=function(ac,
ad,ae)local af=ad:FindFirstChildOfClass'UIGradient'if not af then return end af.
Enabled=ae end},{Properties={'UiPadding','PaddingBottom','PaddingTop',
'PaddingRight','PaddingTop'},Callback=function(ac,ad,ae)ae=ae or 0 if typeof(ae)
=='number'then ae=UDim.new(0,ae)end local af=ac.Class local ag=af.UiPadding if
ag then aa:CheckConfig(af,{PaddingBottom=ae,PaddingLeft=ae,PaddingRight=ae,
PaddingTop=ae})end local ah=aa:GetChildOfClass(ad,'UIPadding')aa:SetProperties(
ah,{PaddingBottom=af.PaddingBottom,PaddingLeft=af.PaddingLeft,PaddingRight=af.
PaddingRight,PaddingTop=af.PaddingTop})end},{Properties={'Callback'},Callback=
function(ac,ad)local ae=ac.Class function ae:SetCallback(af)self.Callback=af
return self end function ae:FireCallback(af)self.Callback(ad)return self end end
},{Properties={'Value'},Callback=function(ac,ad)local ae=ac.Class aa:
CheckConfig(ae,{GetValue=function(af)return ae.Value end})end}}end function b.j(
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
local aa,ab,ac,ad,ae={Version='1.4.7',Author='Depso',License='MIT',Repository=
'https://github.com/depthso/Dear-ReGui/',Debug=false,PrefabsId=71968920594655,
DefaultTitle='ReGui',ContainerName='ReGui',DoubleClickThreshold=0.3,
TooltipOffset=15,IniToSave={'Value'},ClassIgnored={'Visible','Text'},Container=
nil,Prefabs=nil,FocusedWindow=nil,HasTouchScreen=false,Services=nil,Elements={},
_FlagCache={},_ErrorCache={},Windows={},ActiveTooltips={},IniSettings={},
AnimationConnections={}},b.load'a',b.load'b',b.load'c',b.load'd'aa.DemoWindow=b.
load'e'aa.Services=ac.Services aa.Animation=ad aa.Icons=b.load'f'aa.Accent=b.
load'g'aa.ThemeConfigs=b.load'h'aa.ElementFlags=b.load'i'local af=b.load'j'aa.
ElementColors=af.Coloring aa.Animations=af.Animations aa.Styles=af.Styles ac:
CallOnInitConnections(aa)aa.DynamicImages={[aa.Icons.Arrow]='ImageFollowsText',[
aa.Icons.Close]='ImageFollowsText',[aa.Icons.Dot]='ImageFollowsText'}local ag=aa
.Services local ah,ai,aj,ak,al=ag.HttpService,ag.Players,ag.UserInputService,ag.
RunService,ag.InsertService local c=ac:NewReference(ai.LocalPlayer)aa.PlayerGui=
ac:NewReference(c.PlayerGui)aa.Mouse=ac:NewReference(c:GetMouse())local d=
function()end function GetAndRemove(e,f)local g=f[e]if g then f[e]=nil end
return g end function MoveTableItem(e,f,g)local h=table.find(e,f)if not h then
return end local i=table.remove(e,h)table.insert(e,g,i)end function Merge(e,f)
for g,h in next,f do e[g]=h end end function Copy(e,f)local g=table.clone(e)if f
then Merge(g,f)end return g end function aa:Warn(...)warn('[ReGui]::',...)end
function aa:Error(...)local e=aa:Concat({...},' ')local f=`\n[ReGui]:: {e}`
coroutine.wrap(error)(f)end function aa:IsDoubleClick(e)local f=self.
DoubleClickThreshold return e<f end function aa:StyleContainers()local e=self.
Container local f,g=e.Overlays,e.Windows self:SetProperties(g,{OnTopOfCoreBlur=
true})self:SetProperties(f,{OnTopOfCoreBlur=true})end function aa:Init(e)e=e or{
}if self.Initialised then return end Merge(self,e)Merge(self,{Initialised=true,
HasGamepad=self:IsConsoleDevice(),HasTouchScreen=self:IsMobileDevice()})self:
CheckConfig(self,{ContainerParent=function()return ac:ResolveUIParent()end,
Prefabs=function()return self:LoadPrefabs()end},true)self:CheckConfig(self,{
Container=function()return self:InsertPrefab('Container',{Parent=self.
ContainerParent,Name=self.ContainerName})end},true)local f,g,h=self.Container,
self.TooltipOffset,self.ActiveTooltips local i,j=f.Overlays,0 self:
StyleContainers()self.TooltipsContainer=self.Elements:Overlay{Parent=i}aj.
InputBegan:Connect(function(k)if not self:IsMouseEvent(k,true)then return end
local l=tick()local m=l-j local n=self:IsDoubleClick(m)j=n and 0 or l self:
UpdateWindowFocuses()end)local k=function()local k,l=self.TooltipsContainer,#h>0
k.Visible=l if not l then return end local m,n=aa:GetMouseLocation()local o=i.
AbsolutePosition k.Position=UDim2.fromOffset(m-o.X+g,n-o.Y+g)end ak.
RenderStepped:Connect(k)end function aa:CheckImportState()if self.Initialised
then return end local e=self.PrefabsId local f=ac:CheckAssetUrl(e)local g,h=
pcall(function()return ac:NewReference(al:LoadLocalAsset(f))end)self:Init{
Prefabs=g and h or nil}end function aa:GetVersion()return self.Version end
function aa:IsMobileDevice()return aj.TouchEnabled end function aa:
IsConsoleDevice()return aj.GamepadEnabled end function aa:GetScreenSize()return
workspace.CurrentCamera.ViewportSize end function aa:LoadPrefabs()local e,f=self
.PlayerGui,'ReGui-Prefabs'local g=script:WaitForChild(f,2)if g then return g end
local h=e:WaitForChild(f,2)if h then return h end return nil end function aa:
CheckConfig(e,f,g,h)return ac:CheckConfig(e,f,g,h)end function aa:CreateInstance
(e,f,g)local h=Instance.new(e,f)if g then local i=g.UsePropertiesList if not i
then self:SetProperties(h,g)else self:ApplyFlags{Object=h,Class=g}end end return
h end function aa:ConnectMouseEvent(e,f)local g,h,i,j,k=f.Callback,f.DoubleClick
,f.OnlyMouseHovering,0 if i then k=self:DetectHover(i)end e.Activated:Connect(
function(...)local l=tick()local m=l-j if k and not k.Hovering then return end
if h then if not aa:IsDoubleClick(m)then j=l return end j=0 end g(...)end)end
function aa:GetAnimation(e)return e and self.Animation or TweenInfo.new(0)end
function aa:DynamicImageTag(e,f,g)local h=self.DynamicImages local i=h[f]if not
i then return end if not g then return end g:TagElements{[e]=i}end function aa:
GetDictSize(e)local f=0 for g,h in e do f+=1 end return f end function aa:
RemoveAnimations(e)local f=self:GetAnimationData(e)local g=f.Connections for h,i
in next,g do i:Disconnect()end end function aa:GetAnimationData(e)local f=self.
AnimationConnections local g=f[e]if g then return g end local h={Connections={}}
f[e]=h return h end function aa:AddAnimationSignal(e,f)local g=self:
GetAnimationData(e)local h=g.Connections table.insert(h,f)end function aa:
SetAnimationsEnabled(e)self.NoAnimations=not e end function aa:SetAnimation(e,f,
g)g=g or e local h,i,j=self.Animations,self.HasTouchScreen,f if typeof(f)~=
'table'then j=h[f]end assert(j,`No animation data for Class {f}!`)self:
RemoveAnimations(g)local k,l,m,n,o=j.Init,j.Connections,j.Tweeninfo,j.
NoAnimation,self:GetAnimationData(e)local p,q,r,s,t,u=o.State,true,{},{}function
s:Reset(v)if not t then return end t(v)end function s:FireSignal(v,w)r[v](w)end
function s:Refresh(v)if not u then return end r[u](v)end function s:SetEnabled(v
)q=v end for v,w in next,l do local x,y=function(x)x=x==true u=v local y=self.
NoAnimations if y then return end if not q then return end o.State=v ad:Tween{
NoAnimation=x or n,Object=e,Tweeninfo=m,EndProperties=w}end,g[v]if not i then
local z=y:Connect(x)self:AddAnimationSignal(g,z)end r[v]=x if v==k then t=x end
end if p then s:FireSignal(p)else s:Reset(true)end return s end function aa:
ConnectDrag(e,f)self:CheckConfig(f,{DragStart=d,DragEnd=d,DragMovement=d,
OnDragStateChange=d})local g,h,i,j,k,l=f.DragStart,f.DragEnd,f.DragMovement,f.
OnDragStateChange,{StartAndEnd={Enum.UserInputType.MouseButton1,Enum.
UserInputType.Touch},Movement={Enum.UserInputType.MouseMovement,Enum.
UserInputType.Touch}},false local m,n,o=function(m,n)local o=m.UserInputType
return table.find(k[n],o)end,function(m)local n=m.Position return Vector2.new(n.
X,n.Y)end,function(m)self._DraggingDisabled=m l=m j(m)end local p=function(p)
local q,r,s=p.IsDragging,p.InputType,p.Callback return function(t)if p.
DraggingRequired~=l then return end if p.CheckDraggingDisabled and self.
_DraggingDisabled then return end if not m(t,r)then return end if p.UpdateState
then o(q)end local u=n(t)s(u)end end e.InputBegan:Connect(p{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=g})aj.InputEnded:Connect(p{
DraggingRequired=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',
Callback=h})aj.InputChanged:Connect(p{DraggingRequired=true,InputType='Movement'
,Callback=i})end function aa:MakeDraggable(e)local f,g,h,i,j,k=e.Move,e.Grab,e.
OnDragStateChange,{}function i:SetEnabled(l)local m=e.StateChanged self.Enabled=
l if m then m(self)end end function i:CanDrag(l)return self.Enabled end local l,
m,n,o,p=function(l)if not i:CanDrag()then return end local m=e.DragBegin k=l m(k
)end,function(l)if not i:CanDrag()then return end local m,n=l-k,e.OnUpdate n(m)
end,function(l)j=f.Position end,function(l)local m=UDim2.new(j.X.Scale,j.X.
Offset+l.X,j.Y.Scale,j.Y.Offset+l.Y)e:SetPosition(m)end,function(l,m)ad:Tween{
Object=f,EndProperties={Position=m}}end self:CheckConfig(e,{Enabled=true,
OnUpdate=o,SetPosition=p,DragBegin=n})self:ConnectDrag(g,{DragStart=l,
DragMovement=m,OnDragStateChange=h})local q=e.Enabled i:SetEnabled(q)return i
end function aa:MakeResizable(e)aa:CheckConfig(e,{MinimumSize=Vector2.new(160,90
),MaximumSize=Vector2.new(math.huge,math.huge)})local f,g,h,i,j=e.MaximumSize,e.
MinimumSize,e.Resize,(e.OnUpdate)local k=aa:InsertPrefab('ResizeGrab',{Parent=h}
)local l,m,n=function(l)k.Visible=l.Enabled end,function(l)local m=j+l local n=
UDim2.fromOffset(math.clamp(m.X,g.X,f.X),math.clamp(m.Y,g.Y,f.Y))if i then i(n)
return end ad:Tween{Object=h,EndProperties={Size=n}}end,function(l)j=h.
AbsoluteSize end local o=self:MakeDraggable{Grab=k,OnUpdate=m,DragBegin=n,
StateChanged=l}o.Grab=k return o end function aa:IsMouseEvent(e,f)local g=e.
UserInputType.Name if f and g:find'Movement'then return end return g:find'Touch'
or g:find'Mouse'end function aa:DetectHover(e,f)local g=f or{}g.Hovering=false
local h,i,j,k,l,m=g.OnInput,g.OnHoverChange,g.Anykey,g.MouseMove,g.MouseEnter,g.
MouseOnly local n=function(n,o,p)if n and m then if not aa:IsMouseEvent(n,true)
then return end end if o~=nil then local q=g.Hovering g.Hovering=o if o~=q and i
then i(o)end end if not l and p then return end if h then local q=g.Hovering h(q
,n)return end end local o={e.MouseEnter:Connect(function()n(nil,true,true)end),e
.MouseLeave:Connect(function()n(nil,false,true)end)}if j or m then table.insert(
o,aj.InputBegan:Connect(function(p)n(p)end))end if k then local p=e.MouseMoved:
Connect(function()n()end)table.insert(o,p)end function g:Disconnect()for p,q in
next,o do q:Disconnect()end end return g end function aa:StackWindows()local e,f
=self.Windows,20 for g,h in next,e do local i,j=h.WindowFrame,UDim2.fromOffset(f
*g,f*g)h:Center()i.Position+=j end end function aa:GetElementFlags(e)local f=
self._FlagCache return f[e]end function aa:UpdateColors(e)local f,g,h,i,j,k,l=e.
Object,e.Tag,e.NoAnimation,e.TagsList,e.Theme,e.Tweeninfo,self.ElementColors
local m,n,o=self:GetElementFlags(f),self.Debug,l[g]if typeof(o)=='string'then o=
l[o]end if typeof(g)=='table'then o=g elseif i then i[f]=g end if not o then
return end local p={}for q,r in next,o do local s=self:GetThemeKey(j,r)if m and
m[q]then continue end if not s then if n then self:Warn(`Color: '{r}' does not exist!`
)end continue end p[q]=s end ad:Tween{Tweeninfo=k,Object=f,NoAnimation=h,
EndProperties=p}end function aa:MultiUpdateColors(e)local f=e.Objects for g,h in
next,f do self:UpdateColors{TagsList=e.TagsList,Theme=e.Theme,NoAnimation=not e.
Animate,Tweeninfo=e.Tweeninfo,Object=g,Tag=h}end end function aa:ApplyStyle(e,f)
local g=self.Styles local h=g[f]if not h then return end self:ApplyFlags{Object=
e,Class=h}end function aa:ClassIgnores(e)local f=self.ClassIgnored local g=table
.find(f,e)return g and true or false end function aa:MergeMetatables(e,f)local g
,h=self.Debug,{}h.__index=function(i,j)local k,l=self:ClassIgnores(j),e[j]if l~=
nil and not k then return l end local m,n=pcall(function()local m=f[j]return
self:PatchSelf(f,m)end)return m and n or nil end h.__newindex=function(i,j,k)
local l,m=self:ClassIgnores(j),typeof(k)=='function'local n=e[j]~=nil or m if n
and not l then e[j]=k return end xpcall(function()f[j]=k end,function(o)if g
then self:Warn(`Newindex Error: {f}.{j} = {k}\n{o}`)end e[j]=k end)end return
setmetatable({},h)end function aa:Concat(e,f)local g=''for h,i in next,e do g..=
tostring(i)..(h~=#e and f or'')end return g end function aa:GetValueFromAliases(
e,f)for g,h in e do local i=f[h]if i~=nil then return i end end return nil end
function aa:RecursiveCall(e,f)for g,h in next,e:GetDescendants()do f(h)end end
function aa:ApplyFlags(e)local f,g,h,i=self.ElementFlags,e.Object,e.Class,e.
WindowClass function e:GetThemeKey(j)if i then return i:GetThemeKey(j)else
return aa:GetThemeKey(nil,j)end end self:SetProperties(g,h)for j,k in next,f do
local l,m,n,o=k.Properties,k.Callback,k.Recursive,k.WindowProperties local p=
self:GetValueFromAliases(l,h)if i and o and p==nil then p=self:
GetValueFromAliases(o,i)end if p==nil then continue end m(e,g,p)if n then self:
RecursiveCall(g,function(q)m(e,q,p)end)end end end function aa:SetProperties(e,f
)return ac:SetProperties(e,f)end function aa:InsertPrefab(e,f)local g=self.
Prefabs local h=g.Prefabs local i=ac:NewReference(h:WaitForChild(e):Clone())if f
then local j=f.UsePropertiesList if not j then self:SetProperties(i,f)else self:
ApplyFlags{Object=i,Class=f}end end return i end function aa:GetContentSize(e,f)
local g,h,i,j=e:FindFirstChildOfClass'UIListLayout',e:FindFirstChildOfClass
'UIPadding',(e:FindFirstChildOfClass'UIStroke')if g and not f then j=g.
AbsoluteContentSize else j=e.AbsoluteSize end if h then local k,l,m,n=h.
PaddingTop.Offset,h.PaddingBottom.Offset,h.PaddingLeft.Offset,h.PaddingRight.
Offset j+=Vector2.new(m+n,k+l)end if i then local k=i.Thickness j+=Vector2.new(k
/2,k/2)end return j end function aa:PatchSelf(e,f,...)if typeof(f)~='function'
then return f,...end return function(g,...)return f(e,...)end end function aa:
MakeCanvas(e)local f,g,h,i,j,k,l=self.Elements,self.Debug,e.Element,e.
WindowClass,e.Class,e.OnChildChange,ae:NewSignal()if k then l:Connect(k)end if
not i and g then self:Warn(`No WindowClass for {h}`)self:Warn(e)end local m=ac:
NewClass(f,{Class=j,RawObject=h,WindowClass=i or false,OnChildChange=l,Elements=
{}})local n={__index=function(n,o)local p=m[o]if p~=nil then return self:
PatchSelf(m,p)end local q=j[o]if q~=nil then return self:PatchSelf(j,q)end local
r=h[o]return self:PatchSelf(h,r)end,__newindex=function(n,o,p)local q=j[o]~=nil
if q then j[o]=p else h[o]=p end end}return setmetatable({},n)end function aa:
GetIniData(e)local f,g=self.IniToSave,{}for h,i in next,f do g[i]=e[i]end return
g end function aa:DumpIni(e)local f,g=self.IniSettings,{}for h,i in next,f do g[
h]=self:GetIniData(i)end if e then return ah:JSONEncode(g)end return g end
function aa:LoadIniIntoElement(e,f)local g={Value=function(g)e:SetValue(g)end}
for h,i in next,f do local j=g[h]if j then j(i)continue end e[h]=i end end
function aa:LoadIni(e,f)local g=self.IniSettings assert(e,
'No Ini configuration was passed')if f then e=ah:JSONDecode(e)end for h,i in
next,e do local j=g[h]self:LoadIniIntoElement(j,i)end end function aa:AddIniFlag
(e,f)local g=self.IniSettings g[e]=f end function aa:OnElementCreate(e)local f,g
,h,i,j=self._FlagCache,e.Flags,e.Object,e.Canvas,e.Class local k,l,m,n,o,p=i.
WindowClass,g.NoAutoTag,g.NoAutoFlags,g.ColorTag,g.NoStyle,g.IniFlag f[h]=g if p
then self:AddIniFlag(p,j)end if o then return end if not l and k then k:
TagElements{[h]=n}end if k then k:LoadStylesIntoElement(e)end if not m then self
:ApplyFlags{Object=h,Class=g,WindowClass=k}end end function aa:VisualError(e,f,g
)local h=self.Initialised and e.Error if not h then self:Error('Class:',g)return
end e:Error{Parent=f,Text=g}end function aa:WrapGeneration(e,f)local g,h,i=self.
_ErrorCache,f.Base,f.IgnoreDefaults return function(j,k,...)k=k or{}self:
CheckConfig(k,h)local l=k.CloneTable if l then k=table.clone(k)end local m,n,o=j
.RawObject,j.Elements,j.OnChildChange self:CheckConfig(k,{Parent=m,Name=k.
ColorTag},nil,i)if j==self then j=self.Elements end local p,q,r=pcall(e,j,k,...)
if p==false then if m then if g[m]then return end g[m]=q end self:VisualError(j,
m,q)self:Error('Class:',q)self:Error(debug.traceback())end if r==nil then r=q
end if o then o:Fire(q)end if r then if n then table.insert(n,r)end self:
OnElementCreate{Object=r,Flags=k,Class=q,Canvas=j}end return q,r end end
function aa:DefineElement(e,f)local g,h,i=self.Elements,self.ThemeConfigs,self.
ElementColors local j,k,l,m,n,o=h.DarkTheme,f.Base,f.Create,f.Export,f.ThemeTags
,f.ColorData self:CheckConfig(k,{ColorTag=e,ElementStyle=e})if n then Merge(j,n)
end if o then Merge(i,o)end local p=self:WrapGeneration(l,f)if m then self[e]=p
end g[e]=p return p end function aa:DefineGlobalFlag(e)local f=self.ElementFlags
table.insert(f,e)end function aa:DefineTheme(e,f)local g=self.ThemeConfigs self:
CheckConfig(f,{BaseTheme=g.DarkTheme})local h=GetAndRemove('BaseTheme',f)local i
={BaseTheme=h,Values=f}g[e]=i return i end function aa:GetMouseLocation()local e
=self.Mouse return e.X,e.Y end function aa:SetWindowFocusesEnabled(e)self.
WindowFocusesEnabled=e end function aa:UpdateWindowFocuses()local e,f=self.
Windows,self.WindowFocusesEnabled if not f then return end for g,h in e do local
i=h.HoverConnection if not i then continue end local j=i.Hovering if j then self
:SetFocusedWindow(h)return end end self:SetFocusedWindow(nil)end function aa:
WindowCanFocus(e)if e.NoSelect then return false end if e.Collapsed then return
false end if e._SelectDisabled then return false end return true end function aa
:GetFocusedWindow()return self.FocusedWindow end function aa:BringWindowToFront(
e)local f,g=self.Windows,e.NoBringToFrontOnFocus if g then return end
MoveTableItem(f,e,1)end function aa:SetFocusedWindow(e)local f,g=self:
GetFocusedWindow(),self.Windows if f==e then return end self.FocusedWindow=e if
e then local h=self:WindowCanFocus(e)if not h then return end self:
BringWindowToFront(e)end local h=#g for i,j in g do local k,l=self:
WindowCanFocus(j),j.WindowFrame if not k then continue end h-=1 if h then l.
ZIndex=h end local m=j==e j:SetFocused(m,h)end end function aa:SetItemTooltip(e,
f)local g,h,i=self.Elements,self.TooltipsContainer,self.ActiveTooltips local j,k
=h:Canvas{Visible=false,UiPadding=UDim.new()}task.spawn(f,j)aa:DetectHover(e,{
MouseMove=true,MouseEnter=true,OnHoverChange=function(l)if l then table.insert(i
,j)return end local m=table.find(i,j)table.remove(i,m)end,OnInput=function(l,m)k
.Visible=l end})end function aa:CheckFlags(e,f)for g,h in next,e do local i=f[g]
if not i then continue end h(i)end end function aa:GetThemeKey(e,f)local g=self.
ThemeConfigs if typeof(e)=='string'then e=g[e]end local h=g.DarkTheme e=e or h
local i,j=e.BaseTheme,e.Values local k=j[f]if k then return k end if i then
return self:GetThemeKey(i,f)end return end function aa:SelectionGroup(e)local f,
g,h=false,function(f,g)for h,i in next,e do if typeof(i)=='Instance'then
continue end if i==g then continue end f(i)end end local i=function(i)if f then
return end f=true local j=h h=i:GetValue()if not j then j=h end g(function(k)k:
SetValue(j)end,i)f=false end g(function(j)j.Callback=i end)end local e=aa.
Elements e.__index=e function e:GetObject()return self.RawObject end function e:
ApplyFlags(f,g)local h=self.WindowClass aa:ApplyFlags{WindowClass=h,Object=f,
Class=g}end function e:Remove()local f,g,h=self.OnChildChange,self:GetObject(),
self.Class local i=h.Remove if i then return i(h)end if f then f:Fire(h or self)
end if h then table.clear(h)end g:Destroy()table.clear(self)end function e:
GetChildElements()local f=self.Elements return f end function e:
ClearChildElements()local f=self:GetChildElements()for g,h in next,f do h:
Destroy()end end function e:TagElements(f)local g,h=self.WindowClass,aa.Debug if
not g then if h then aa:Warn('No WindowClass for TagElements:',f)end return end
g:TagElements(f)end function e:GetThemeKey(f)local g=self.WindowClass if g then
return g:GetThemeKey(f)end return aa:GetThemeKey(nil,f)end function e:
SetColorTags(f,g)local h=self.WindowClass if not h then return end local i,j=h.
TagsList,h.Theme aa:MultiUpdateColors{Animate=g,Theme=j,TagsList=i,Objects=f}end
function e:SetElementFocused(f,g)local h,i,j,k=self.WindowClass,aa.
HasTouchScreen,g.Focused,g.Animation aa:SetAnimationsEnabled(not j)if not j and
k then k:Refresh()end if not h then return end if not i then return end local l=
h.ContentCanvas l.Interactable=not j end aa:DefineElement('Dropdown',{Base={
ColorTag='PopupCanvas',Disabled=false,AutoClose=true,OnSelected=d},Create=
function(f,g)g.Parent=aa.Container.Overlays local h,i,j,k,l=g.Selected,g.Items,g
.OnSelected,f:PopupCanvas(g)local m,n,o=aa:MergeMetatables(g,k),{},function(m)j(
m)end function g:ClearEntries()for p,q in n do q:Remove()end end function g:
SetItems(p,q)local r=p[1]self:ClearEntries()for s,t in p do local u,v=r and t or
s,s==q or t==q local w=k:Selectable{Text=tostring(u),Selected=v,ZIndex=6,
Callback=function()return o(u)end}table.insert(n,w)end end if i then g:SetItems(
i,h)end return m,l end})aa:DefineElement('OverlayScroll',{Base={ElementClass=
'OverlayScroll',Spacing=UDim.new(0,4)},Create=function(f,g)local h,i,j=f.
WindowClass,g.ElementClass,g.Spacing local k=aa:InsertPrefab(i,g)local l,m=k:
FindFirstChild'ContentFrame'or k,k:FindFirstChild('UIListLayout',true)m.Padding=
j local n=aa:MergeMetatables(f,g)local o=aa:MakeCanvas{Element=l,WindowClass=h,
Class=n}function g:GetCanvasSize()return l.AbsoluteCanvasSize end return o,k end
})aa:DefineElement('Overlay',{Base={ElementClass='Overlay'},Create=e.
OverlayScroll})aa:DefineElement('Image',{Base={Image='',Callback=d},Create=
function(f,g)local h=aa:InsertPrefab('Image',g)h.Activated:Connect(function(...)
local i=g.Callback return i(h,...)end)return h end})aa:DefineElement(
'VideoPlayer',{Base={Video='',Callback=d},Create=function(f,g)local h=g.Video g.
Video=ac:CheckAssetUrl(h)local i=aa:InsertPrefab('VideoPlayer',g)return i end})
aa:DefineElement('Button',{Base={Text='Button',DoubleClick=false,Callback=d},
Create=function(f,g)local h=aa:InsertPrefab('Button',g)local i,j=aa:
MergeMetatables(g,h),g.DoubleClick function g:SetDisabled(k)self.Disabled=k end
aa:ConnectMouseEvent(h,{DoubleClick=j,Callback=function(...)if g.Disabled then
return end local k=g.Callback return k(i,...)end})return i,h end})aa:
DefineElement('Selectable',{Base={Text='Selectable',Callback=d,Selected=false,
Disabled=false,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.AutomaticSize.Y,
TextXAlignment=Enum.TextXAlignment.Left,AnimationTags={Selected='Buttons',
Unselected='TransparentButtons'}},Create=function(f,g)local h,i,j,k=f.Class.
AfterClick,g.Selected,g.Disabled,aa:InsertPrefab('Button',g)local l=aa:
MergeMetatables(g,k)k.Activated:Connect(function(...)local m=g.Callback m(k,...)
if h then h(k,...)end end)function g:SetSelected(m)local n=self.AnimationTags
local o=m and n.Selected or n.Unselected self.Selected=m aa:SetAnimation(k,o)
return self end function g:SetDisabled(m)self.Disabled=m k.Interactable=not m
return self end g:SetSelected(i)g:SetDisabled(j)return l,k end})aa:
DefineElement('ImageButton',{Base={ElementStyle='Button',Callback=d},Create=e.
Image})aa:DefineElement('SmallButton',{Base={Text='Button',PaddingTop=UDim.new()
,PaddingBottom=UDim.new(),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),
ColorTag='Button',ElementStyle='Button',Callback=d},Create=e.Button})aa:
DefineElement('Keybind',{Base={Label='Keybind',ColorTag='Frame',Value=nil,
DeleteKey=Enum.KeyCode.Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=
false,Callback=d,OnKeybindSet=d,OnBlacklistedKeybindSet=d,KeyBlacklist={},
UiPadding=UDim.new(),AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.3,0,
0,19)},Create=function(f,g)local h,i,j,k,l=g.Value,g.Label,g.Disabled,g.
KeyBlacklist,aa:InsertPrefab('Button',g)local m,n,o,p=aa:MergeMetatables(g,l),f:
Label{Parent=l,Text=i,Position=UDim2.new(1,4,0.5),AnchorPoint=Vector2.new(0,0.5)
},function(m,...)return m(l,...)end,function(m)return table.find(k,m)end
function g:SetDisabled(q)self.Disabled=q l.Interactable=not q f:SetColorTags({[n
]=q and'LabelDisabled'or'Label'},true)return self end function g:SetValue(q)
local r,s=self.OnKeybindSet,self.DeleteKey if q==s then q=nil end self.Value=q l
.Text=q and q.Name or'Not set'o(r,q)return self end function g:WaitForNewKey()
self._WaitingForNewKey=true l.Text='...'l.Interactable=false end local q=
function(q)local r,s=q.KeyCode,q.UserInputType if s~=Enum.UserInputType.Keyboard
then return s end return r end local r=function(r)local s,t,u=g.
OnBlacklistedKeybindSet,g.Value,q(r)if not aj.WindowFocused then return end if
p(u)then o(s,u)return end l.Interactable=true g._WaitingForNewKey=false if u.
Name=='Unknown'then return g:SetValue(t)end g:SetValue(u)return end local s=
function(s,t)local u,v,w,x,y,z=g.IgnoreGameProcessed,g.DeleteKey,g.Enabled,g.
Value,g.Callback,q(s)if g._WaitingForNewKey then r(s)return end if not w and l.
Interactable then return end if not u and t then return end if not x then return
end if z==v then return end if z.Name~=x.Name then return end o(y,z)end g:
SetValue(h)g:SetDisabled(j)g.Connection=aj.InputBegan:Connect(s)l.Activated:
Connect(function()g:WaitForNewKey()end)aa:SetAnimation(l,'Inputs')return m,l end
})aa:DefineElement('ArrowButton',{Base={Direction='Left',ColorTag='Button',Icon=
aa.Icons.Arrow,Size=UDim2.fromOffset(21,21),IconSize=UDim2.fromScale(1,1),
IconPadding=UDim.new(0,4),Rotations={Left=180,Right=0}},Create=function(f,g)
local h,i=g.Direction,g.Rotations local j=i[h]g.IconRotation=j local k=aa:
InsertPrefab('ArrowButton',g)k.Activated:Connect(function(...)local l=g.Callback
return l(k,...)end)return k end})aa:DefineElement('Label',{Base={Font=
'Inconsolata'},ColorData={LabelPadding={PaddingTop='LabelPaddingTop',
PaddingBottom='LabelPaddingBottom'}},Create=function(f,g)local h,i,j,k,l,m,n,o=g
.Bold,g.Italic,g.Font,g.FontFace,Enum.FontWeight.Medium,Enum.FontWeight.Bold,
Enum.FontStyle.Normal,Enum.FontStyle.Italic local p,q,r=h and m or l,i and o or
n,h or i if not k and r then g.FontFace=Font.fromName(j,p,q)end local s=aa:
InsertPrefab('Label',g)local t=s:FindFirstChildOfClass'UIPadding'f:TagElements{[
t]='LabelPadding'}return s end})aa:DefineElement('Error',{Base={RichText=true,
TextWrapped=true},ColorData={Error={TextColor3='ErrorText',FontFace='TextFont'}}
,Create=function(f,g)local h=g.Text g.Text=`<b>\226\155\148 Error:</b> {h}`
return f:Label(g)end})aa:DefineElement('CodeEditor',{Base={Editable=true,Fill=
true,Text=''},Create=function(f,g)local h,i=f.WindowClass,ab.CodeFrame.new(g)
local j=i.Gui g.Parent=f:GetObject()aa:ApplyFlags{Object=j,WindowClass=h,Class=g
}return i,j end})local f={Engaged=false}f.__index=f function f:SetEngaged(g)
local h=self.WindowClass self.Engaged=g if h then h:SetCanvasInteractable(not g)
end end function f:IsHovering()local g=false self:Foreach(function(h)g=h.Popup:
IsMouseHovering()return g end)return g end function f:Foreach(g)local h=self.
Menus for i,j in next,h do local k=g(j)if k then break end end end function f:
SetFocusedMenu(g)self:Foreach(function(h)local i=h==g h:SetActiveState(i)end)end
function f:Close()self:SetEngaged(false)self:SetFocusedMenu(nil)end function f:
MenuItem(g)local h,i=self.Canvas,self.Menus local j=h:MenuButton(g)local k=h:
PopupCanvas{RelativeTo=j,MaxSizeX=210,Visible=false,AutoClose=false,AfterClick=
function()self:Close()end}local l={Popup=k,Button=j}aa:DetectHover(j,{MouseEnter
=true,OnInput=function()if not self.Engaged then return end self:SetFocusedMenu(
l)end})function l:SetActiveState(m)k:SetPopupVisible(m)j:SetSelected(m)end j.
Activated:Connect(function()self:SetFocusedMenu(l)self:SetEngaged(true)end)table
.insert(i,l)return k,l end aa:DefineElement('MenuBar',{Base={},Create=function(g
,h)local i,j=g.WindowClass,aa:InsertPrefab('MenuBar',h)local k=aa:MakeCanvas{
Element=j,WindowClass=i,Class=h}local l=ac:NewClass(f,{WindowClass=i,Canvas=k,
Object=j,Menus={}})Merge(l,h)aa:DetectHover(j,{MouseOnly=true,OnInput=function()
if not l.Engaged then return end if l:IsHovering()then return end l:Close()end})
local m=aa:MergeMetatables(l,k)return m,j end})aa:DefineElement('MenuButton',{
Base={Text='MenuButton',PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
Size=UDim2.fromOffset(0,19),AutomaticSize=Enum.AutomaticSize.XY},Create=e.
Selectable})local g={ColorTags={BGSelected={[true]='SelectedTab',[false]=
'DeselectedTab'},LabelSelected={[true]='SelectedTabLabel',[false]=
'DeselectedTabLabel'}}}function g:SetButtonSelected(h,i)if h.IsSelected==i then
return end h.IsSelected=i local j,k,l=self.NoAnimation,self.WindowClass,self.
ColorTags local m,n,o,p,q=k.Theme,k.TagsList,l.BGSelected,l.LabelSelected,h.
TabButton local r=q.Button local s=r.Label aa:MultiUpdateColors{Animate=not j,
Theme=m,TagsList=n,Objects={[r]=o[i],[s]=p[i]}}end function g:CompareTabs(h,i)if
not h then return false end return h.MatchBy==i or h==i end function g:
ForEachTab(h,i)local j,k=typeof(h)=='string',self.Tabs for l,m in k do local n,o
=m.Name,false if j then o=n==h else o=self:CompareTabs(m,h)end i(m,o,l)end end
function g:RemoveTab(h)local i,j=self.OnTabRemove,self.Tabs self:ForEachTab(h,
function(k,l,m)if not l then return end local n,o=k.TabButton,k.OnClosure table.
remove(j,m)n:Destroy()i(self,k)o(k)end)return self end function g:CreateTab(h)h=
h or{}aa:CheckConfig(h,{Name='Tab',AutoSize='Y',Focused=false,OnClosure=d})local
i,j,k,l,m,n,o,p,q=self.AutoSelectNewTabs,self.WindowClass,self.ParentCanvas,self
.Tabs,self.TabsFrame,self.OnTabCreate,h.Focused,h.Name,h.Icon local r,s=o or#l<=
0 and i,aa:InsertPrefab('TabButton',h)s.Parent=m local t=s.Button local u,v=t:
FindFirstChildOfClass'UIPadding',t.Label v.Text=tostring(p)Merge(h,{TabButton=s}
)local w,x=function()self:SetActiveTab(h)end,{Closeable=function()local w=k:
RadioButton{Parent=t,Visible=not self.NoClose,Icon=aa.Icons.Close,IconSize=UDim2
.fromOffset(11,11),LayoutOrder=3,ZIndex=2,UsePropertiesList=true,Callback=
function()self:RemoveTab(h)end}local x=w.Icon aa:SetAnimation(x,{Connections={
MouseEnter={ImageTransparency=0},MouseLeave={ImageTransparency=1}},Init=
'MouseLeave'},s)end}t.Activated:Connect(w)aa:CheckFlags(x,h)table.insert(l,h)if
j then j:TagElements{[u]='TabPadding'}end aa:SetAnimation(t,'Buttons')self:
SetButtonSelected(h,r)k:ApplyFlags(s,h)local y=n(self,h)if r then self:
SetActiveTab(h)end return y or h end function g:SetActiveTab(h)local i,j,k,l,m=
self.Tabs,self.NoAnimation,self.ActiveTab,self.OnActiveTabChange,typeof(h)==
'string'self:ForEachTab(h,function(n,o,p)if o then MatchedTab=n end self:
SetButtonSelected(n,o)end)if not MatchedTab then return self end if self:
CompareTabs(MatchedTab,k)then return self end self.ActiveTab=MatchedTab l(self,
MatchedTab,k)return self end aa:DefineElement('TabBar',{Base={AutoSelectNewTabs=
true,OnActiveTabChange=d,OnTabCreate=d,OnTabRemove=d},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabsBarSeparator={
BackgroundColor3='TabBgActive'},TabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabPagePadding={PaddingBottom=
'TabPagePadding',PaddingLeft='TabPagePadding',PaddingRight='TabPagePadding',
PaddingTop='TabPagePadding'}},Create=function(h,i)local j,k,l=h.WindowClass,aa:
InsertPrefab('TabsBar',i),ac:NewClass(g)local m,n=k.Separator,k.TabsFrame local
o=aa:MakeCanvas{Element=n,WindowClass=j,Class=l}Merge(l,i)Merge(l,{ParentCanvas=
h,Object=k,TabsFrame=n,WindowClass=j,Tabs={}})h:TagElements{[k]='TabsBar',[m]=
'TabsBarSeparator'}local p=aa:MergeMetatables(o,k)return p,k end})aa:
DefineElement('TabSelector',{Base={NoTabsBar=false,OnActiveTabChange=d,
OnTabCreate=d,OnTabRemove=d},Create=function(h,i)local j,k,l,m=h.WindowClass,i.
NoTabsBar,i.NoAnimation,aa:InsertPrefab('TabSelector',i)local n=m.Body local o=n
.PageTemplate o.Visible=false local p,q=function(p,q,...)local r,s,t=q.AutoSize,
q.Name,o:Clone()local u=ac:GetChildOfClass(t,'UIPadding')aa:SetProperties(t,{
Parent=n,Name=s,AutomaticSize=Enum.AutomaticSize[r],Size=UDim2.fromScale(r=='Y'
and 1 or 0,r=='X'and 1 or 0)})h:TagElements{[u]='TabPagePadding'}local v=aa:
MakeCanvas{Element=t,WindowClass=j,Class=q}i.OnTabCreate(p,q,...)Merge(q,{Page=t
,MatchBy=v})return v end,function(p,q,...)p:ForEachTab(q,function(r,s,t)local u=
r.Page u.Visible=s if not s then return end local v=h:GetThemeKey
'AnimationTweenInfo'ad:Tween{Object=u,Tweeninfo=v,NoAnimation=l,StartProperties=
{Position=UDim2.fromOffset(0,4)},EndProperties={Position=UDim2.fromOffset(0,0)}}
end)i.OnActiveTabChange(p,q,...)end local r=h:TabBar{Parent=m,Visible=not k,
OnTabCreate=p,OnActiveTabChange=q,OnTabRemove=function(r,s,...)s.Page:Remove()i.
OnTabRemove(...)end}local s=aa:MergeMetatables(r,m)return s,m end})aa:
DefineElement('RadioButton',{Base={Callback=d},Create=function(h,i)local j=aa:
InsertPrefab('RadioButton',i)j.Activated:Connect(function(...)local k=i.Callback
return k(j,...)end)return j end})aa:DefineElement('Checkbox',{Base={Label=
'Checkbox',IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.
fromScale(1,1),UntickedImageSize=UDim2.fromScale(0,0),Callback=d,Disabled=false}
,Create=function(h,i)local j,k,l,m,n,o,p=i.IsRadio,i.Value,i.Label,i.
TickedImageSize,i.UntickedImageSize,i.Disabled,aa:InsertPrefab('CheckBox',i)
local q,r=aa:MergeMetatables(i,p),p.Tickbox local s=r.Tick s.Image=aa.Icons.
Checkmark local t,u,v,w=r:FindFirstChildOfClass'UIPadding',ac:GetChildOfClass(r,
'UICorner'),h:Label{Text=l,Parent=p,LayoutOrder=2},UDim.new(0,3)if j then s.
ImageTransparency=1 s.BackgroundTransparency=0 u.CornerRadius=UDim.new(1,0)else
w=UDim.new(0,2)end aa:SetProperties(t,{PaddingBottom=w,PaddingLeft=w,
PaddingRight=w,PaddingTop=w})local x,y=function(...)local x=i.Callback return x(
q,...)end,function(x,y)local z,A=h:GetThemeKey'AnimationTweenInfo',x and m or n
ad:Tween{Object=s,Tweeninfo=z,NoAnimation=y,EndProperties={Size=A}}end function
i:SetDisabled(z)self.Disabled=z p.Interactable=not z h:SetColorTags({[v]=z and
'LabelDisabled'or'Label'},true)return self end function i:SetValue(z,A)self.
Value=z y(z,A)x(z)return self end function i:SetTicked(...)aa:Warn
'Checkbox:SetTicked is deprecated, please use :SetValue'return self:SetValue(...
)end function i:Toggle()local z=not self.Value self.Value=z self:SetValue(z)
return self end local z=function()i:Toggle()end p.Activated:Connect(z)r.
Activated:Connect(z)i:SetValue(k,true)i:SetDisabled(o)aa:SetAnimation(r,
'Buttons',p)h:TagElements{[s]='CheckMark',[r]='Checkbox'}return q,p end})aa:
DefineElement('Radiobox',{Base={IsRadio=true,CornerRadius=UDim.new(1,0)},Create=
e.Checkbox})aa:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label=
'Histogram'},Create=function(h,i)local j,k,l=i.Label,i.Points,aa:InsertPrefab(
'Histogram',i)local m,n=aa:MergeMetatables(i,l),l.Canvas local o=n.PointTemplate
o.Visible=false h:Label{Text=j,Parent=l,Position=UDim2.new(1,4)}local p aa:
SetItemTooltip(l,function(q)p=q:Label()end)Merge(i,{_Plots={},_Cache={}})
function i:GetBaseValues()local q,r=self.Minimum,self.Maximum if q and r then
return q,r end local s=self._Plots for t,u in s do local v=u.Value if not q or v
<q then q=v end if not r or v>r then r=v end end return q,r end function i:
UpdateGraph()local q,r,s=self._Plots,self:GetBaseValues()if not r or not s then
return end local t=s-r for u,v in q do local w,x=v.Point,v.Value local y=(x-r)/t
y=math.clamp(y,0.05,1)w.Size=UDim2.fromScale(1,y)end return self end function i:
Plot(q)local r,s,t=self._Plots,{},o:Clone()local u=t.Bar aa:SetProperties(t,{
Parent=n,Visible=true})local v,w=aa:DetectHover(t,{MouseEnter=true,OnInput=
function()s:UpdateTooltip()end}),{Object=t,Point=u,Value=q}function s:
UpdateTooltip()local x=s:GetPointIndex()p.Text=`{x}:\t{w.Value}`end function s:
SetValue(x)w.Value=x i:UpdateGraph()if v.Hovering then self:UpdateTooltip()end
end function s:GetPointIndex()return table.find(r,w)end function s:Remove(x)
table.remove(r,self:GetPointIndex())t:Remove()i:UpdateGraph()end table.insert(r,
w)self:UpdateGraph()aa:SetAnimation(u,'Plots',t)h:TagElements{[u]='Plot'}return
s end function i:PlotGraph(q)local r=self._Cache local s=#r-#q if s>=1 then for
t=1,s do local u=table.remove(r,t)if u then u:Remove()end end end for t,u in q
do local v=r[t]if v then v:SetValue(u)continue end r[t]=self:Plot(u)end return
self end if k then i:PlotGraph(k)end return m,l end})aa:DefineElement('Viewport'
,{Base={IsRadio=true},Create=function(h,i)local j,k,l=i.Model,i.Camera,aa:
InsertPrefab('Viewport',i)local m,n=aa:MergeMetatables(i,l),l.Viewport local o=n
.WorldModel if not k then k=aa:CreateInstance('Camera',n)k.CFrame=CFrame.new(0,0
,0)end Merge(i,{Camera=k,WorldModel=o,Viewport=n})function i:SetCamera(p)self.
Camera=p n.CurrentCamera=p return self end function i:SetModel(p,q)local r=self.
Clone o:ClearAllChildren()if r then p=p:Clone()end if q then p:PivotTo(q)end p.
Parent=o self.Model=p return p end if j then i:SetModel(j)end i:SetCamera(k)
return m,l end})aa:DefineElement('InputText',{Base={Value='',Placeholder='',
Label='Input text',Callback=d,MultiLine=false,NoAutoTag=true,Disabled=false},
Create=function(h,i)local j,k,l,m,n,o=i.MultiLine,i.Placeholder,i.Label,i.
Disabled,i.Value,aa:InsertPrefab('InputBox',i)local p=o.Frame local q,r=p.Input,
aa:MergeMetatables(i,o)h:Label{Parent=o,Text=l,AutomaticSize=Enum.AutomaticSize.
X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=2}aa:
SetProperties(q,{PlaceholderText=k,MultiLine=j})local s=function(...)local s=i.
Callback s(r,...)end function i:SetValue(t)q.Text=tostring(t)self.Value=t return
self end function i:SetDisabled(t)self.Disabled=t o.Interactable=not t h:
SetColorTags({[l]=t and'LabelDisabled'or'Label'},true)return self end function i
:Clear()q.Text=''return self end local t=function()local t=q.Text i.Value=t s(t)
end q:GetPropertyChangedSignal'Text':Connect(t)i:SetDisabled(m)i:SetValue(n)h:
TagElements{[q]='Frame'}return r,o end})aa:DefineElement('InputInt',{Base={Value
=0,Increment=1,Placeholder='',Label='Input Int',Callback=d},Create=function(h,i)
local j,k,l,m,n,o=i.Value,i.Placeholder,i.Label,i.Disabled,i.NoButtons,aa:
InsertPrefab('InputBox',i)local p,q=aa:MergeMetatables(i,o),o.Frame local r=q.
Input r.PlaceholderText=k local s,t,u,v=h:Button{Text='-',Parent=q,LayoutOrder=2
,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),Visible=not n,Callback=function()i:Decrease()end},h:
Button{Text='+',Parent=q,LayoutOrder=3,Ratio=1,AutomaticSize=Enum.AutomaticSize.
None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not n,
Callback=function()i:Increase()end},h:Label{Parent=o,Text=l,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=
4},function(...)local s=i.Callback s(p,...)end function i:Increase()local w,x=
self.Value,self.Increment i:SetValue(w+x)end function i:Decrease()local w,x=self
.Value,self.Increment i:SetValue(w-x)end function i:SetDisabled(w)self.Disabled=
w o.Interactable=not w h:SetColorTags({[u]=w and'LabelDisabled'or'Label'},true)
return self end function i:SetValue(w)local x,y,z=self.Value,self.Minimum,self.
Maximum w=tonumber(w)if not w then w=x end if y and z then w=math.clamp(w,y,z)
end r.Text=w i.Value=w v(w)return self end local w=function()local w=r.Text i:
SetValue(w)end i:SetValue(j)i:SetDisabled(m)r.FocusLost:Connect(w)h:TagElements{
[t]='Button',[s]='Button',[r]='Frame'}return p,o end})aa:DefineElement(
'InputTextMultiline',{Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,
ColorTag='Frame'},Create=function(h,i)return h:Console(i)end})aa:DefineElement(
'Console',{Base={Enabled=true,Value='',TextWrapped=false,Border=true,MaxLines=
300,LinesFormat='%s',Callback=d},Create=function(h,i)local j,k,l,m,n=i.ReadOnly,
i.LineNumbers,i.Value,i.Placeholder,aa:InsertPrefab('Console',i)local o,p,q=aa:
MergeMetatables(i,n),n.Source,n.Lines q.Visible=k function i:CountLines(r)local
s=p.Text:split'\n'local t=#s if t==1 and s[1]==''then return 0 end return t end
function i:UpdateLineNumbers()local r,s=self.LineNumbers,self.LinesFormat if not
r then return end local t=self:CountLines()q.Text=''for u=1,t do local v,w=s:
format(u),u~=t and'\n'or''q.Text..=`{v}{w}`end local u=q.AbsoluteSize.X p.Size=
UDim2.new(1,-u,0,0)return self end function i:CheckLineCount()local r=i.MaxLines
if not r then return end local s=p.Text local t=s:split'\n'if#t>r then local u=`{
t[1]}\\n`local v=s:sub(#u)self:SetValue(v)end return self end function i:
UpdateScroll()local r=n.AbsoluteCanvasSize n.CanvasPosition=Vector2.new(0,r.Y)
return self end function i:SetValue(r)if not self.Enabled then return end p.Text
=tostring(r)self:Update()return self end function i:GetValue()return p.Text end
function i:Clear()p.Text=''self:Update()return self end function i:AppendText(
...)local r,s=self:CountLines(true),aa:Concat({...},' ')if r==0 then return self
:SetValue(s)end local t=self:GetValue()local u=`{t}\n{s}`self:SetValue(u)return
self end function i:Update()local r=self.AutoScroll self:CheckLineCount()self:
UpdateLineNumbers()if r then self:UpdateScroll()end end local r=function()local
r=i:GetValue()i:Update()i:Callback(r)end i:SetValue(l)aa:SetProperties(p,i)aa:
SetProperties(p,{TextEditable=not j,Parent=n,PlaceholderText=m})h:TagElements{[p
]='ConsoleText',[q]='ConsoleLineNumbers'}p:GetPropertyChangedSignal'Text':
Connect(r)return o,n end})aa:DefineElement('Table',{Base={VerticalAlignment=Enum
.VerticalAlignment.Top,RowBackground=false,RowBgTransparency=0.87,Border=false,
Spacing=UDim.new(0,4)},Create=function(h,i)local j,k,l,m,n,o,p,q=h.WindowClass,i
.RowBgTransparency,i.RowBackground,i.Border,i.VerticalAlignment,i.MaxColumns,i.
Spacing,aa:InsertPrefab('Table',i)local r,s,t,u,v=aa:MergeMetatables(i,q),q.
RowTemp,0,{},m and l function i:Row(w)w=w or{}local x,y,z,A=w.IsHeader,0,{},s:
Clone()aa:SetProperties(A,{Name='Row',Visible=true,Parent=q})local B=A:
FindFirstChildOfClass'UIListLayout'aa:SetProperties(B,{VerticalAlignment=n,
Padding=not v and p or UDim.new(0,1)})if x then h:TagElements{[A]='Header'}else
t+=1 end if l and not x then local C=t%2~=1 and k or 1 A.BackgroundTransparency=
C end local C={}local D=aa:MergeMetatables(C,A)function C:Column(E)E=E or{}aa:
CheckConfig(E,{HorizontalAlign=Enum.HorizontalAlignment.Left,VerticalAlignment=
Enum.VerticalAlignment.Top})local F=A.ColumnTemp:Clone()local G=F:
FindFirstChildOfClass'UIListLayout'aa:SetProperties(G,E)local H=F:
FindFirstChildOfClass'UIStroke'H.Enabled=m local I=F:FindFirstChildOfClass
'UIPadding'if not v then I:Destroy()end aa:SetProperties(F,{Parent=A,Visible=
true,Name='Column'})return aa:MakeCanvas{Element=F,WindowClass=j,Class=D}end
function C:NextColumn()y+=1 local E=y%o+1 local F=z[E]if not F then F=self:
Column()z[E]=F end return F end table.insert(u,C)return D end function i:NextRow
()return self:Row()end function i:HeaderRow()return self:Row{IsHeader=true}end
function i:ClearRows()t=0 for w,x in next,q:GetChildren()do if not x:IsA'Frame'
then continue end if x==s then continue end x:Destroy()end return i end return r
,q end})aa:DefineElement('List',{Base={Spacing=4,HorizontalFlex=Enum.
UIFlexAlignment.None,VerticalFlex=Enum.UIFlexAlignment.None,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,
FillDirection=Enum.FillDirection.Horizontal},Create=function(h,i)local j,k,l,m,n
,o,p,q=h.WindowClass,i.Spacing,i.HorizontalFlex,i.VerticalFlex,i.
HorizontalAlignment,i.VerticalAlignment,i.FillDirection,aa:InsertPrefab('List',i
)local r,s=aa:MergeMetatables(i,q),q.UIListLayout aa:SetProperties(s,{Padding=
UDim.new(0,k),HorizontalFlex=l,VerticalFlex=m,HorizontalAlignment=n,
VerticalAlignment=o,FillDirection=p})local t=aa:MakeCanvas{Element=q,WindowClass
=j,Class=r}return t,q end})aa:DefineElement('CollapsingHeader',{Base={Title=
'Collapsing Header',CollapseIcon=aa.Icons.Arrow,Collapsed=true,Offset=0,
NoAutoTag=true,NoAutoFlags=true,IconPadding=UDim.new(0,4),Activated=d},Create=
function(h,i)local j,k,l,m,n,o,p,q,r,s,t,u=i.Title,i.Collapsed,i.ElementStyle,i.
Offset,i.TitleBarProperties,i.OpenOnDoubleClick,i.OpenOnArrow,i.CollapseIcon,i.
IconPadding,i.Icon,i.NoArrow,aa:InsertPrefab('CollapsingHeader',i)local v=u.
TitleBar local w,x=v.Collapse,v.Icon h:ApplyFlags(x,{Image=s})local y,z=w.
CollapseIcon,w.UIPadding ac:SetPadding(z,r)h:ApplyFlags(y,{Image=q})local A,B,C=
h:Label{ColorTag='CollapsingHeader',Parent=v,LayoutOrder=2},h:Indent{Class=i,
Parent=u,Offset=m,LayoutOrder=2,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.None,PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,1)}local D=
function()local D=i.Activated D(B)end function i:Remove()u:Destroy()table.clear(
self)end function i:SetArrowVisible(E)y.Visible=E end function i:SetTitle(E)A.
Text=E end function i:SetVisible(E)u.Visible=E end function i:SetIcon(E)local F=
E and E~=''x.Visible=F if F then x.Image=ac:CheckAssetUrl(E)end end function i:
SetCollapsed(E)self.Collapsed=E local F,G,H=aa:GetContentSize(C),B:GetThemeKey
'AnimationTweenInfo',UDim2.fromScale(1,0)local I=H+UDim2.fromOffset(0,F.Y)ad:
HeaderCollapse{Tweeninfo=G,Collapsed=E,Toggle=y,Resize=C,Hide=C,ClosedSize=H,
OpenSize=I}return self end local E=function()i:SetCollapsed(not i.Collapsed)end
if n then B:ApplyFlags(v,n)end if not p then aa:ConnectMouseEvent(v,{DoubleClick
=o,Callback=E})end y.Activated:Connect(E)v.Activated:Connect(D)i:SetCollapsed(k)
i:SetTitle(j)i:SetArrowVisible(not t)aa:ApplyStyle(v,l)B:TagElements{[v]=
'CollapsingHeader'}return B,u end})aa:DefineElement('TreeNode',{Base={Offset=21,
IconPadding=UDim.new(0,2),TitleBarProperties={Size=UDim2.new(1,0,0,13)}},Create=
e.CollapsingHeader})aa:DefineElement('Separator',{Base={NoAutoTag=true,
NoAutoTheme=true},Create=function(h,i)local j,k=i.Text,aa:InsertPrefab(
'SeparatorText',i)h:Label{Text=tostring(j),Visible=j~=nil,Parent=k,LayoutOrder=2
,Size=UDim2.new(),PaddingLeft=UDim.new(0,4),PaddingRight=UDim.new(0,4)}h:
TagElements{[k.Left]='Separator',[k.Right]='Separator'}return k end})aa:
DefineElement('Canvas',{Base={},Create=function(h,i)local j,k,l=h.WindowClass,i.
Scroll,i.Class or i local m=k and'ScrollingCanvas'or'Canvas'local n=aa:
InsertPrefab(m,i)local o=aa:MakeCanvas{Element=n,WindowClass=j,Class=l}return o,
n end})aa:DefineElement('ScrollingCanvas',{Base={Scroll=true},Create=e.Canvas})
aa:DefineElement('Region',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y
},Create=function(h,i)local j,k=h.WindowClass,i.Scroll local l=k and
'ScrollingCanvas'or'Canvas'local m=aa:InsertPrefab(l,i)local n=aa:MakeCanvas{
Element=m,WindowClass=j,Class=i}return n,m end})aa:DefineElement('Group',{Base={
Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(h,i)local j,k=h
.WindowClass,aa:InsertPrefab('Group',i)local l=aa:MakeCanvas{Element=k,
WindowClass=j,Class=i}return l,k end})aa:DefineElement('Indent',{Base={Offset=15
,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),PaddingRight=UDim.new()},Create=
function(h,i)local j=i.Offset i.PaddingLeft=UDim.new(0,j)return h:Canvas(i)end})
aa:DefineElement('BulletText',{Base={},Create=function(h,i)local j=i.Rows for k,
l in next,j do local m=h:Bullet(i)m:Label{Text=tostring(l),LayoutOrder=2,Size=
UDim2.fromOffset(0,14)}end end})aa:DefineElement('Bullet',{Base={Padding=3,Icon=
aa.Icons.Dot,IconSize=UDim2.fromOffset(5,5)},Create=function(h,i)local j,k,l=h.
WindowClass,i.Padding,aa:InsertPrefab('Bullet',i)local m,n=aa:MakeCanvas{Element
=l,WindowClass=j,Class=h},l.UIListLayout n.Padding=UDim.new(0,k)return m,l end})
aa:DefineElement('Row',{Base={Spacing=4,Expanded=false,HorizontalFlex=Enum.
UIFlexAlignment.None,VerticalFlex=Enum.UIFlexAlignment.None},Create=function(h,i
)local j,k,l,m,n,o=h.WindowClass,i.Spacing,i.Expanded,i.HorizontalFlex,i.
VerticalFlex,aa:InsertPrefab('Row',i)local p,q=aa:MergeMetatables(i,o),o:
FindFirstChildOfClass'UIListLayout'q.Padding=UDim.new(0,k)q.HorizontalFlex=m q.
VerticalFlex=n local r=aa:MakeCanvas{Element=o,WindowClass=j,Class=p}function i:
Expand()q.HorizontalFlex=Enum.UIFlexAlignment.Fill return self end if l then i:
Expand()end return r,o end})aa:DefineElement('SliderBase',{Base={Format='%.f',
Label='',Type='Slider',Callback=d,NoGrab=false,NoClick=false,Minimum=0,Maximum=
100,ColorTag='Frame',Disabled=false},Create=function(h,i)local j,k,l,m,n,o,p,q,r
=i.Value or i.Minimum,i.Format,i.Label,i.NoAnimation,i.NoGrab,i.NoClick,i.Type,i
.Disabled,aa:InsertPrefab'Slider'local s=r.Track local t,u,v=s.Grab,s.ValueText,
aa:MergeMetatables(i,r)local w,x,y=t.AbsoluteSize,aa:SetAnimation(r,'Inputs'),h:
Label{Parent=r,Text=l,Position=UDim2.new(1,4),Size=UDim2.fromScale(0,1)}Merge(i,
{Grab=t,Name=l})if p=='Slider'then s.Position=UDim2.fromOffset(w.X/2,0)s.Size=
UDim2.new(1,-w.X,1,0)end local z,A={Slider=function(z)return{AnchorPoint=Vector2
.new(0.5,0.5),Position=UDim2.fromScale(z,0.5)}end,Progress=function(z)return{
Size=UDim2.fromScale(z,1)}end,Snap=function(z,A,B,C)local D=(math.round(A)-B)/C
return{Size=UDim2.fromScale(1/C,1),Position=UDim2.fromScale(D,0.5)}end},function
(...)local z=i.Callback return z(v,...)end function i:SetDisabled(B)self.
Disabled=B r.Interactable=not B h:SetColorTags({[y]=B and'LabelDisabled'or
'Label'},true)return self end function i:SetValueText(B)u.Text=tostring(B)end
function i:SetValue(B,C)local D,E,F,G=h:GetThemeKey'AnimationTweenInfo',i.
Minimum,i.Maximum,B local H=F-E if not C then G=(B-E)/H else B=E+(H*G)end G=math
.clamp(G,0,1)local I=z[p](G,B,E,F)ad:Tween{Object=t,Tweeninfo=D,NoAnimation=m,
EndProperties=I}self.Value=B self:SetValueText(k:format(B,F))A(B)return self end
local B,C=function(B)h:SetColorTags({[r]=B and'FrameActive'or'Frame'},true)h:
SetElementFocused(r,{Focused=B,Animation=x})end,function()if i.Disabled then
return end if i.ReadOnly then return end return true end local D=function(D)if
not C()then return end local E,F,G=s.AbsolutePosition.X,s.AbsoluteSize.X,D.X
local H=G-E local I=math.clamp(H/F,0,1)i:SetValue(I,true)end local E,F=function(
...)if not C()then return end B(true)if not o then D(...)end end,function()B(
false)end t.Visible=not n i:SetValue(j)i:SetDisabled(q)h:TagElements{[u]='Label'
,[t]='SliderGrab'}aa:ConnectDrag(s,{DragStart=E,DragMovement=D,DragEnd=F})return
v,r end})aa:DefineElement('SliderEnum',{Base={Items={},Label='Slider Enum',Type=
'Snap',Minimum=1,Maximum=10,Value=1,Callback=d,ColorTag='Frame'},Create=function
(h,i)local j,k,l=i.Callback,i.Value,function(j,k)k=math.round(k)local l=j.Items
j.Maximum=#l return l[k]end i.Callback=function(m,n)local o=l(m,n)m:
SetValueText(o)i.Value=o return j(m,o)end l(i,k)return h:SliderBase(i)end})aa:
DefineElement('SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create=e.
SliderBase})aa:DefineElement('SliderFloat',{Base={Label='Slider Float',Format=
'%.3f',ColorTag='Frame'},Create=e.SliderBase})aa:DefineElement('DragInt',{Base={
Format='%.f',Label='Drag Int',Callback=d,Minimum=0,Maximum=100,ColorTag='Frame',
Disabled=false},Create=function(h,i)local j,k,l,m,n=i.Value or i.Minimum,i.
Format,i.Label,i.Disabled,aa:InsertPrefab'Slider'local o,p=aa:MergeMetatables(i,
n),n.Track local q,r=p.ValueText,p.Grab r.Visible=false local s,t,u,v,w,x=h:
Label{Parent=n,Text=l,Position=UDim2.new(1,7),Size=UDim2.fromScale(0,1)},0,0,aa:
SetAnimation(n,'Inputs'),function(...)local s=i.Callback return s(o,...)end
function i:SetValue(y,z)local A,B=self.Minimum,self.Maximum local C=B-A if not z
then t=((y-A)/C)*100 else y=A+(C*(t/100))end y=math.clamp(y,A,B)self.Value=y q.
Text=k:format(y,B)w(y)return self end function i:SetDisabled(y)self.Disabled=y h
:SetColorTags({[s]=y and'LabelDisabled'or'Label'},true)return self end local y,z
=function(y)h:SetColorTags({[n]=y and'FrameActive'or'Frame'},true)h:
SetElementFocused(n,{Focused=y,Animation=v})end,function()if i.Disabled then
return end if i.ReadOnly then return end return true end local A,B,C=function(A)
if not z()then return end y(true)x=A u=t end,function(A)if not z()then return
end local B=A.X-x.X local C=u+(B/2)t=math.clamp(C,0,100)i:SetValue(t,true)end,
function()y(false)end i:SetValue(j)i:SetDisabled(m)aa:ConnectDrag(p,{DragStart=A
,DragEnd=C,DragMovement=B})h:TagElements{[q]='Label'}return o,n end})aa:
DefineElement('DragFloat',{Base={Format='%.3f',Label='Drag Float',ColorTag=
'Frame'},Create=e.DragInt})aa:DefineElement('MultiElement',{Base={Callback=d,
Label='',Disabled=false,BaseInputConfig={},InputConfigs={},Value={},Minimum={},
Maximum={},MultiCallback=d},Create=function(h,i)local j,k,l,m,n,o,p,q=i.Label,i.
BaseInputConfig,i.InputConfigs,i.InputType,i.Disabled,i.Value,i.Minimum,i.
Maximum assert(m,'No input type provided for MultiElement')local r,s=h:Row{
Spacing=4}local t,u,v,w,x=r:Row{Size=UDim2.fromScale(0.65,0),Expanded=true},r:
Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=j},aa:MergeMetatables(i,r)
,{},false local y,z=function()local y={}for z,A in w do y[z]=A:GetValue()end i.
Value=y return y end,function(...)local y=i.MultiCallback y(v,...)end local A=
function()if#w~=#l then return end if not x then return end local A=y()z(A)end
function i:SetDisabled(B)self.Disabled=B h:SetColorTags({[u]=B and
'LabelDisabled'or'Label'},true)for C,D in w do D:SetDisabled(B)end end function
i:SetValue(B)x=false for C,D in B do local E=w[C]assert(E,`No input object for index: {
C}`)E:SetValue(D)end x=true z(B)end k=Copy(k,{Size=UDim2.new(1,0,0,19),Label='',
Callback=A})for B,C in l do local D=Copy(k,C)aa:CheckConfig(D,{Minimum=p[B],
Maximum=q[B]})local E=t[m](t,D)table.insert(w,E)end Merge(i,{Row=t,Inputs=w})x=
true i:SetDisabled(n)i:SetValue(o)return v,s end})local h,i,j=function(h,i,j,k)
aa:DefineElement(h,{Base={Label=h,Callback=d,InputType=i,InputConfigs=table.
create(j,{}),BaseInputConfig={}},Create=function(l,m)local n=(m.BaseInputConfig)
if k then Merge(n,k)end aa:CheckConfig(n,{ReadOnly=m.ReadOnly,Format=m.Format})m
.MultiCallback=function(...)local o=m.Callback o(...)end return l:MultiElement(m
)end})end,function(h,i)aa:DefineElement(h,{Base={Label=h,Callback=d,Value=aa.
Accent.Light,Disabled=false,Minimum={0,0,0},Maximum={255,255,255,100},
BaseInputConfig={},InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]
={Format='B: %.f'}}},Create=function(j,k)local l,m=k.Value,Copy(k,{Value={1,1,1}
,Callback=function(l,...)if k.ValueChanged then k:ValueChanged(...)end end})
local n,o=j[i](j,m)local p,q=aa:MergeMetatables(k,n),n.Row local r,s=q:Button{
BackgroundTransparency=0,Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=
1,ColorTag='',ElementStyle=''},function(...)local r=k.Callback return r(p,...)
end local t=function(t)r.BackgroundColor3=t s(t)end function k:ValueChanged(u)
local v,w,x=u[1],u[2],u[3]local y=Color3.fromRGB(v,w,x)self.Value=y t(y)end
function k:SetValue(u)self.Value=u t(u)n:SetValue{math.round(u.R*255),math.
round(u.G*255),math.round(u.B*255)}end k:SetValue(l)return p,o end})end,function
(h,i)aa:DefineElement(h,{Base={Label=h,Callback=d,Disabled=false,Value=CFrame.
new(10,10,10),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),
BaseInputConfig={},InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]
={Format='Z: %.f'}}},Create=function(j,k)local l,m,n=k.Value,k.Maximum,k.Minimum
local o=Copy(k,{Maximum={m.X,m.Y,m.Z},Minimum={n.X,n.Y,n.Z},Value={l.X,l.Y,l.Z},
Callback=function(o,...)if k.ValueChanged then k:ValueChanged(...)end end})local
p,q=j[i](j,o)local r=aa:MergeMetatables(k,p)local s=function(...)local s=k.
Callback return s(r,...)end function k:ValueChanged(t)local u,v,w=t[1],t[2],t[3]
local x=CFrame.new(u,v,w)self.Value=x s(x)end function k:SetValue(t)self.Value=t
p:SetValue{math.round(t.X),math.round(t.Y),math.round(t.Z)}end k:SetValue(l)
return r,q end})end aa:DefineElement('SliderProgress',{Base={Label=
'Slider Progress',Type='Progress',ColorTag='Frame'},Create=e.SliderBase})aa:
DefineElement('ProgressBar',{Base={Label='Progress Bar',Type='Progress',ReadOnly
=true,MinValue=0,MaxValue=100,Format='% i%%',Interactable=false,ColorTag='Frame'
},Create=function(k,l)function l:SetPercentage(m)l:SetValue(m)end local m,n=k:
SliderBase(l)local o=m.Grab k:TagElements{[o]={BackgroundColor3='ProgressBar'}}
return m,n end})aa:DefineElement('Combo',{Base={Value='',Placeholder='',Callback
=d,Items={},Disabled=false,WidthFitPreview=false,Label='Combo'},Create=function(
k,l)local m,n,o,p,q,r,s=l.Placeholder,l.NoAnimation,l.Selected,l.Label,l.
Disabled,l.WidthFitPreview,aa:InsertPrefab('Combo',l)local t,u,v=aa:
MergeMetatables(l,s),(s.Combo)local w,x,y=k:Label{Text=tostring(m),Parent=u,Name
='ValueText'},k:ArrowButton{Parent=u,Interactable=false,Size=UDim2.fromOffset(19
,19),LayoutOrder=2},k:Label{Text=p,Parent=s,LayoutOrder=2}if r then aa:
SetProperties(s,{AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.new(0,0,0,0)})aa
:SetProperties(u,{AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.fromScale(0,1)}
)end local z,A,B=function(z,...)l:SetOpen(false)return l.Callback(t,z,...)end,
function(z,A)local B=k:GetThemeKey'AnimationTweenInfo's.Interactable=not z ad:
HeaderCollapseToggle{Tweeninfo=B,NoAnimation=A,Collapsed=not z,Toggle=x.Icon}end
,function()local z,A=l.GetItems,l.Items if z then return z()end return A end
function l:SetValueText(C)w.Text=tostring(C)end function l:ClosePopup()if not v
then return end v:ClosePopup(true)end function l:SetDisabled(C)self.Disabled=C s
.Interactable=not C k:SetColorTags({[y]=C and'LabelDisabled'or'Label'},true)
return self end function l:SetValue(C)local D=B()local E=D[C]local F=E or C self
.Selected=C self.Value=F self:ClosePopup()if typeof(C)=='number'then self:
SetValueText(F)else self:SetValueText(C)end z(C,F)return self end function l:
SetOpen(C)local D=self.Selected self.Open=C A(C,n)if not C then self:ClosePopup(
)return end v=k:Dropdown{RelativeTo=u,Items=B(),Selected=D,OnSelected=function(
...)l:SetValue(...)end,OnClosed=function()self:SetOpen(false)end}return self end
local C=function()local C=l.Open l:SetOpen(not C)end u.Activated:Connect(C)A(
false,true)l:SetDisabled(q)if o then l:SetValue(o)end aa:SetAnimation(u,'Inputs'
)k:TagElements{[u]='Frame'}return t,s end})local k={TileBarConfig={Close={Image=
aa.Icons.Close,IconPadding=UDim.new(0,3)},Collapse={Image=aa.Icons.Arrow,
IconPadding=UDim.new(0,3)}},CloseCallback=d,Collapsible=true,Open=true,Focused=
false}function k:Tween(l)aa:CheckConfig(l,{Tweeninfo=self:GetThemeKey
'AnimationTweenInfo'})return ad:Tween(l)end function k:TagElements(l)local m,n=
self.TagsList,self.Theme aa:MultiUpdateColors{Theme=n,TagsList=m,Objects=l}end
function k:MakeTitleBarCanvas()local l=self.TitleBar local m=aa:MakeCanvas{
WindowClass=self,Element=l}self.TitleBarCanvas=m return m end function k:
AddDefaultTitleButtons()local l=self.TileBarConfig local m,n,o=l.Collapse,l.
Close,self.TitleBarCanvas if not o then o=self:MakeTitleBarCanvas()end aa:
CheckConfig(self,{Toggle=o:RadioButton{Icon=m.Image,IconPadding=m.IconPadding,
LayoutOrder=1,Ratio=1,Size=UDim2.new(0,0),Callback=function()self:
ToggleCollapsed()end},CloseButton=o:RadioButton{Icon=n.Image,IconPadding=n.
IconPadding,LayoutOrder=3,Ratio=1,Size=UDim2.new(0,0),Callback=function()self:
SetVisible(false)end},TitleLabel=o:Label{ColorTag='Title',LayoutOrder=2,Size=
UDim2.new(1,0),Active=false,Fill=true,ClipsDescendants=true,AutomaticSize=Enum.
AutomaticSize.XY}})self:TagElements{[self.TitleLabel]='WindowTitle'}end function
k:Close()local l=self.CloseCallback if l then local m=l(self)if m==false then
return end end self:Remove()end function k:SetVisible(l)local m,n=self.
WindowFrame,self.NoFocusOnAppearing self.Visible=l m.Visible=l if l and not n
then aa:SetFocusedWindow(self)end return self end function k:ToggleVisibility(l)
local m=self.Visible self:SetVisible(not m)end function k:GetWindowSize()return
self.WindowFrame.AbsoluteSize end function k:GetTitleBarSizeY()local l=self.
TitleBar return l.Visible and l.AbsoluteSize.Y or 0 end function k:SetTitle(l)
self.TitleLabel.Text=tostring(l)return self end function k:SetPosition(l)self.
WindowFrame.Position=l return self end function k:SetSize(l,m)local n=self.
WindowFrame if typeof(l)=='Vector2'then l=UDim2.fromOffset(l.X,l.Y)end n.Size=l
self.Size=l return self end function k:SetCanvasInteractable(l)local m=self.Body
m.Interactable=l end function k:Center()local l=self:GetWindowSize()/2 local m=
UDim2.new(0.5,-l.X,0.5,-l.Y)self:SetPosition(m)return self end function k:
LoadStylesIntoElement(l)local m,n,o=l.Flags,l.Object,l.Canvas local p={
FrameRounding=function()if m.CornerRadius then return end if not o then return
end local p=n:FindFirstChild('FrameRounding',true)if not p then return end o:
TagElements{[p]='FrameRounding'}end}for q,r in p do local s=self:GetThemeKey(q)
if s==nil then continue end task.spawn(r,s)end end function k:SetTheme(l)local m
,n,o=aa.ThemeConfigs,self.TagsList,self.WindowState l=l or self.Theme assert(m[l
],`{l} is not a valid theme!`)self.Theme=l aa:MultiUpdateColors{Animate=false,
Theme=l,Objects=n}self:SetFocusedColors(o)return self end function k:
SetFocusedColors(l)local m,n,o,p,q=self.WindowFrame,self.TitleBar,self.Theme,
self.TitleLabel,self:GetThemeKey'AnimationTweenInfo'local r=m:
FindFirstChildOfClass'UIStroke'local s={Focused={[r]='BorderActive',[n]=
'TitleBarBgActive',[p]={TextColor3='TitleActive'}},UnFocused={[r]='Border',[n]=
'TitleBarBg',[p]={TextColor3='Title'}},Collapsed={[r]='Border',[n]=
'TitleBarBgCollapsed',[p]={TextColor3='Title'}}}aa:MultiUpdateColors{Tweeninfo=q
,Animate=true,Objects=s[l],Theme=o}end function k:SetFocused(l)l=l==nil and true
or l local m,n=self.Collapsed,self.WindowState if l then aa:SetFocusedWindow(
self)end local o=m and'Collapsed'or l and'Focused'or'UnFocused'if o==n then
return end self.Focused=l self.WindowState=o self:SetFocusedColors(o)end
function k:GetThemeKey(l)return aa:GetThemeKey(self.Theme,l)end function k:
SetCollapsible(l)self.Collapsible=l return self end function k:ToggleCollapsed(l
)local m,n=self.Collapsed,self.Collapsible if not l and not n then return self
end self:SetCollapsed(not m)return self end function k:SetCollapsed(l,m)local n,
o,p,q,r,s,t,u,v=self.WindowFrame,self.Body,self.Toggle,self.ResizeGrab,self.Size
,self.AutoSize,self:GetThemeKey'AnimationTweenInfo',self:GetWindowSize(),self:
GetTitleBarSizeY()local w,x=p.Icon,UDim2.fromOffset(u.X,v)self.Collapsed=l self:
SetCollapsible(false)self:SetFocused(not l)ad:HeaderCollapse{Tweeninfo=t,
NoAnimation=m,Collapsed=l,Toggle=w,Resize=n,NoAutomaticSize=not s,Hide=o,
ClosedSize=x,OpenSize=r,Completed=function()self:SetCollapsible(true)end}self:
Tween{Object=q,NoAnimation=m,EndProperties={TextTransparency=l and 1 or 0.6,
Interactable=not l}}return self end function k:UpdateConfig(l)local m={
NoTitleBar=function(m)local n=self.TitleBar n.Visible=not m end,NoClose=function
(m)local n=self.CloseButton n.Visible=not m end,NoCollapse=function(m)local n=
self.Toggle n.Visible=not m end,NoTabsBar=function(m)local n=self.
WindowTabSelector if not n then return end local o=n.TabsBar o.Visible=not m end
,NoScrollBar=function(m)local n,o,p,q=m and 0 or 9,self.NoScroll,self.
WindowTabSelector,self.ContentCanvas if p then p.Body.ScrollBarThickness=n end
if not o then q.ScrollBarThickness=n end end,NoScrolling=function(m)local n,o,p=
self.NoScroll,self.WindowTabSelector,self.ContentCanvas if o then o.Body.
ScrollingEnabled=not m end if not n then p.ScrollingEnabled=not m end end,NoMove
=function(m)local n=self.DragConnection n:SetEnabled(not m)end,NoResize=function
(m)local n=self.ResizeConnection n:SetEnabled(not m)end,NoBackground=function(m)
local n,o=self:GetThemeKey'WindowBgTransparency',self.CanvasFrame o.
BackgroundTransparency=m and 1 or n end}Merge(self,l)for n,o in l do local p=m[n
]if p then p(o)end end return self end function k:Remove()local l,m,n=self.
WindowFrame,self.WindowClass,aa.Windows local o=table.find(n,m)if o then table.
remove(n,o)end l:Destroy()end function k:MenuBar(l,...)local m,n=self.
ContentCanvas,self.ContentFrame l=l or{}Merge(l,{Parent=n,Layout=-1})return m:
MenuBar(l,...)end aa:DefineElement('Window',{Export=true,Base={Theme='DarkTheme'
,NoSelect=false,NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize
=false,MinimumSize=Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,
NoWindowRegistor=false,NoBringToFrontOnFocus=false,IsDragging=false},Create=
function(l,m)aa:CheckImportState()local n,o=aa.Windows,aa.Container.Windows aa:
CheckConfig(m,{Parent=o,Title=aa.DefaultTitle})local p,q,r,s,t,u,v,w,x,y,z=m.
NoDefaultTitleBarButtons,m.Collapsed,m.MinimumSize,m.Title,m.NoTabs,m.NoScroll,m
.Theme,m.AutomaticSize,m.NoWindowRegistor,m.AutoSelectNewTabs,m.Parent~=o local
A={Scroll=not u,Fill=not w and true or nil,UiPadding=UDim.new(0,t and 8 or 0),
AutoSelectNewTabs=y}if w then Merge(A,{AutomaticSize=w,Size=UDim2.new(1,0)})end
local B=aa:InsertPrefab('Window',m)local C=B.Content local D,E=C.TitleBar,ac:
NewClass(k)local F,G,H,I=(aa:MakeCanvas{Element=C,WindowClass=E,Class=E})local J
,K=F:Canvas(Copy(A,{Parent=C,CornerRadius=UDim.new(0,0)}))local L=aa:
MakeResizable{MinimumSize=r,Resize=B,OnUpdate=function(L)E:SetSize(L,true)end}
Merge(E,m)Merge(E,{WindowFrame=B,ContentFrame=C,CanvasFrame=K,ResizeGrab=L.Grab,
TitleBar=D,Elements=e,TagsList={},_SelectDisabled=z,ResizeConnection=L,
HoverConnection=aa:DetectHover(C),DragConnection=aa:MakeDraggable{Grab=C,Move=B,
SetPosition=function(M,N)local O=G:GetThemeKey'AnimationTweenInfo'ad:Tween{
Tweeninfo=O,Object=M.Move,EndProperties={Position=N}}end,OnDragStateChange=
function(M)E.IsDragging=M K.Interactable=not M if M then aa:SetFocusedWindow(I)
end aa:SetWindowFocusesEnabled(not M)end}})if t then G,H=J,K else G,H=J:
TabSelector(A)E.WindowTabSelector=G end I=aa:MergeMetatables(E,G)Merge(E,{
ContentCanvas=G,WindowClass=I,Body=H})aa:ConnectMouseEvent(C,{DoubleClick=true,
OnlyMouseHovering=D,Callback=function(...)if not E.OpenOnDoubleClick then return
end if E.NoCollapse then return end E:ToggleCollapsed()end})if not p then E:
AddDefaultTitleButtons()end E:SetTitle(s)E:SetCollapsed(q,true)E:SetTheme(v)E:
UpdateConfig(m)E:SetFocused()if not x then table.insert(n,I)end local M=L.Grab
aa:SetAnimation(M,'TextButtons')aa:SetFocusedWindow(I)I:TagElements{[M]=
'ResizeGrab',[D]='TitleBar',[K]='Window'}return I,B end})aa:DefineElement(
'TabsWindow',{Export=true,Base={NoTabs=false,AutoSelectNewTabs=true},Create=
function(l,m)return l:Window(m)end})aa:DefineElement('PopupCanvas',{Base={
AutoClose=false,Scroll=false,Visible=true,Spacing=UDim.new(0,1),AutomaticSize=
Enum.AutomaticSize.XY,MaxSizeY=150,MinSizeX=100,MaxSizeX=math.huge,OnClosed=d},
Create=function(l,m)local n,o,p,q,r,s,t=m.RelativeTo,m.MaxSizeY,m.MinSizeX,m.
MaxSizeX,m.Visible,m.AutoClose,m.NoAnimation m.Parent=aa.Container.Overlays
local u,v=l:OverlayScroll(m)local w=v.UIStroke local x,y,z,A,B,C,D=w.Thickness,v
.Parent.AbsolutePosition,(aa:DetectHover(v,{MouseOnly=true,OnInput=function(x,y)
if x then return end if not v.Visible then return end m:OnFocusLost()end}))
function m:FetchScales()local E=u:GetCanvasSize()A=n.AbsolutePosition B=n.
AbsoluteSize C=math.clamp(E.Y,B.Y,o)D=math.clamp(B.X,p,q)end function m:
UpdatePosition()v.Position=UDim2.fromOffset(A.X-y.X+x,A.Y-y.Y+B.Y)end function m
:GetScale(E)local F,G=UDim2.fromOffset(D,C),UDim2.fromOffset(D,0)return E and F
or G end function m:IsMouseHovering()return z.Hovering end function m:
OnFocusLost()local E=self.OnClosed self:SetPopupVisible(false)E(self)if s then
self:ClosePopup()end end function m:ClosePopup(E)self:SetPopupVisible(false,t,E)
z:Disconnect()v:Remove()end function m:SetPopupVisible(E,F)if v.Visible==E then
return end n.Interactable=not E self:UpdateScales(E,t,F)self.Visible=E end
function m:UpdateScales(E,F,G)local H=u:GetThemeKey'AnimationTweenInfo'E=E==nil
and v.Visible or E m:FetchScales()m:UpdatePosition()local I=ad:Tween{Tweeninfo=H
,Object=v,NoAnimation=F,EndProperties={Size=m:GetScale(E),Visible=E}}if I and G
then I.Completed:Wait()end end m:UpdateScales(false,true)m:SetPopupVisible(r)u.
OnChildChange:Connect(m.UpdateScales)return u,v end})aa:DefineElement(
'PopupModal',{Export=true,Base={NoAnimation=false,NoCollapse=true,NoClose=true,
NoResize=true,NoSelect=true,NoAutoFlags=true,NoWindowRegistor=true,NoScroll=true
},Create=function(l,m)local n,o,p=l.WindowClass,(m.NoAnimation)m.Parent=aa.
Container.Overlays if n then p=n:GetThemeKey'ModalWindowDimTweenInfo'm.Theme=n.
Theme end local q=aa:InsertPrefab('ModalEffect',m)local r=l:Window(Copy(m,{
NoAutoFlags=false,Parent=q,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(372,38),AutomaticSize=Enum.
AutomaticSize.Y}))function m:ClosePopup()ad:Tween{Object=q,Tweeninfo=p,
NoAnimation=o,EndProperties={BackgroundTransparency=1},Completed=function()q:
Destroy()end}r:Close()end ad:Tween{Object=q,Tweeninfo=p,NoAnimation=o,
StartProperties={BackgroundTransparency=1},EndProperties={BackgroundTransparency
=0.8}}l:TagElements{[q]='ModalWindowDim'}local s=aa:MergeMetatables(m,r)return s
,q end})h('InputInt2','InputInt',2,{NoButtons=true})h('InputInt3','InputInt',3,{
NoButtons=true})h('InputInt4','InputInt',4,{NoButtons=true})h('SliderInt2',
'SliderInt',2)h('SliderInt3','SliderInt',3)h('SliderInt4','SliderInt',4)h(
'SliderFloat2','SliderFloat',2)h('SliderFloat3','SliderFloat',3)h('SliderFloat4'
,'SliderFloat',4)h('DragInt2','DragInt',2)h('DragInt3','DragInt',3)h('DragInt4',
'DragInt',4)h('DragFloat2','DragFloat',2)h('DragFloat3','DragFloat',3)h(
'DragFloat4','DragFloat',4)i('InputColor3','InputInt3')i('SliderColor3',
'SliderInt3')i('DragColor3','DragInt3')j('InputCFrame','InputInt3')j(
'SliderCFrame','SliderInt3')j('DragCFrame','DragInt3')return aa end function a.a
()local ab=a.cache.a if not ab then ab={c=aa()}a.cache.a=ab end return ab.c end
end do local aa=function()return function(aa)for ab,ac in ipairs(aa)do local ad=
getfenv(0)for ae in string.gmatch(ac,'[^%.]+')do ad=ad and ad[ae]if ad==nil then
break end end if not ad then return false,ac end end return true end end
function a.b()local ab=a.cache.b if not ab then ab={c=aa()}a.cache.b=ab end
return ab.c end end do local aa=function()return function()if not cache or not
cache.invalidate then return{status=400,message='Global not found'}end local aa=
game:GetService'BadgeService'if aa~=game:GetService'BadgeService'then return{
status=500,message=
[[Did a cosmic ray just hit your computer? This should never evaluate]]}end
cache.invalidate(aa)if aa==game:GetService'BadgeService'then return{status=500,
message='Reference to service object retained'}elseif typeof(aa)~='Instance'then
return{status=500,message="Reference type wasn't retained"}end local ab,ac=a.b()
{}if not ab then return{status=501,message=`Alias not found: {ac}`}end return{
status=200,message=`Passed`}end end function a.c()local ab=a.cache.c if not ab
then ab={c=aa()}a.cache.c=ab end return ab.c end end do local aa=function()
return function()if not cache or not cache.iscached then return{status=400,
message='Global not found'}elseif not cache.invalidate then return{status=401,
message="Dependency 'cache.invalidate' missing"}end local aa=Instance.new'Part'
if not cache.iscached(aa)then return{status=500,message=
'Cached part assumed uncached'}end cache.invalidate(aa)if cache.iscached(aa)then
return{status=500,message='Uncached part assumed cached'}end local ab,ac=a.b(){}
if not ab then return{status=501,message=`Alias not found: {ac}`}end return{
status=200,message=`Passed`}end end function a.d()local ab=a.cache.d if not ab
then ab={c=aa()}a.cache.d=ab end return ab.c end end do local aa=function()
return function()if not cache or not cache.replace then return{status=400,
message='Global not found'}end local aa,ab=game:GetService'BadgeService',game:
GetService'Stats'if aa==ab then return{status=500,message=
[[Did a cosmic ray just hit your computer? This should never evaluate]]}end
cache.replace(aa,ab)if aa==ab then return{status=500,message=
'Reference is old reference'}elseif aa==game:GetService'Stats'then return{status
=500,message='Reference is old references object'}end local ac,ad=a.b(){}if not
ac then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message=`Passed`}end end function a.e()local ab=a.cache.e if not ab then ab={c=
aa()}a.cache.e=ab end return ab.c end end do local aa=function()return function(
)if not islclosure then return{status=400,message='Global not found'}end local
aa,ab=function()return 1 end,print if not islclosure(aa)then return{status=500,
message='Failed to identify lua closure'}elseif islclosure(ab)then return{status
=500,message='Identified C closure as lua closure'}end local ac,ad=a.b(){}if not
ac then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message=`Passed`}end end function a.f()local ab=a.cache.f if not ab then ab={c=
aa()}a.cache.f=ab end return ab.c end end do local aa=function()return function(
)if not iscclosure then return{status=400,message='Global not found'}end local
aa,ab,ac=function()return 1 end,print,newcclosure(function()return 1 end)if
iscclosure(aa)then return{status=500,message=
'Lua closure identified as C closure'}elseif not iscclosure(ab)then return{
status=500,message='C closure not identified as C closure'}elseif not
iscclosure(ac)then return{status=500,message=
'C closure not identified as C closure'}end local ad,ae=a.b(){}if not ad then
return{status=501,message=`Alias not found: {ae}`}end return{status=200,message=
`Passed`}end end function a.g()local ab=a.cache.g if not ab then ab={c=aa()}a.
cache.g=ab end return ab.c end end do local aa=function()return function()if not
isexecutorclosure then return{status=400,message='Global not found'}end local aa
=function()return 1 end if not isexecutorclosure(isexecutorclosure)then return{
status=500,message='Failed to identify an executor closure'}elseif not
isexecutorclosure(aa)then return{status=500,message=
'Did not identify an lua closure as an executor closure'}elseif
isexecutorclosure(print)then return{status=500,message=
'Identified a lua standard closure as an executor closure'}end local ab,ac=a.b()
{'checkclosure','isourclosure'}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.h()local ab=a.
cache.h if not ab then ab={c=aa()}a.cache.h=ab end return ab.c end end do local
aa=function()return function()if not newcclosure then return{status=400,message=
'Global not found'}elseif not iscclosure then return{status=500,message=
'iscclosure required to test newcclosure'}end local aa=function(...)return...end
local ab=newcclosure(aa)if iscclosure(aa)then return{status=500,message=
'iscclosure returned true a lua closure'}elseif not iscclosure(ab)then return{
status=500,message='Returned false for a C closure'}elseif ab(1)~=1 then return{
status=500,message='C closure did not return the expected value'}end local ac,ad
=a.b(){}if not ac then return{status=501,message=`Alias not found: {ad}`}end
return{status=200,message='Passed'}end end function a.i()local ab=a.cache.i if
not ab then ab={c=aa()}a.cache.i=ab end return ab.c end end do local aa=function
()return function()if not clonefunction then return{status=400,message=
'Global not found'}end local aa=function()return 1 end local ab=clonefunction(aa
)if ab==aa then return{status=500,message=
'Cloned function is the same as the original'}elseif ab()~=1 then return{status=
500,message='Cloned function behavior mismatch'}end local ac,ad=a.b(){}if not ac
then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message='Passed'}end end function a.j()local ab=a.cache.j if not ab then ab={c=
aa()}a.cache.j=ab end return ab.c end end do local aa=function()return function(
)if not hookfunction then return{status=400,message='Global not found'}end local
aa=function()return 1 end local ab,ac=aa,function()return 2 end if ab()~=1 then
return{status=500,message=
[[This should never evaluate. Did a cosmic ray hit your computer and flip a bit?]]
}end local ad=hookfunction(ab,ac)if ab()~=2 then return{status=500,message=
'Hooked function did not return the expected value'}elseif ad()~=1 then return{
status=500,message='Old function did not return the expected value'}end
hookfunction(ab,ad)if ab()~=1 then return{status=500,message=
'Restored function did not return the expected value'}end local ae,af=a.b(){
'hookfunc','replaceclosure'}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message='Passed'}end end function a.k()local ab=a.
cache.k if not ab then ab={c=aa()}a.cache.k=ab end return ab.c end end do local
aa=function()return function()if not restorefunction then return{status=400,
message='Global not found'}elseif not hookfunction then return{status=401,
message="'hookfunction' needed to test this"}end local aa=function()return 1 end
local ab,ac=aa,function()return 2 end if ab()~=1 then return{status=500,message=
[[This should never evaluate. Did a cosmic ray hit your computer and flip a bit?]]
}end local ad=hookfunction(ab,ac)if ab()~=2 then return{status=500,message=
'Hooked function did not return the expected value'}elseif ad()~=1 then return{
status=500,message='Old function did not return the expected value'}end
restorefunction(ab)if ab()~=1 then hookfunction(ab,ad)return{status=500,message=
'Restored function did not return the expected value'}end local ae,af=a.b(){
'restorefunc'}if not ae then return{status=501,message=`Alias not found: {af}`}
end return{status=200,message='Passed'}end end function a.l()local ab=a.cache.l
if not ab then ab={c=aa()}a.cache.l=ab end return ab.c end end do local aa=
function()return function()if not getfunctionhash then return{status=400,message
='Global not found'}end local aa,ab,ac,ad,ae,af,ag=function(aa)return#aa==96 and
aa:match'^[0-9a-fA-F]+$'~=nil end,function()end,function(...)end,function()end,
function()return 1 end,function()return 2 end,pcall(function()getfunctionhash(
print)end)if not aa(getfunctionhash(ab))then return{status=500,message=
'Hash is not hex encoded'}elseif getfunctionhash(ab)==getfunctionhash(ac)then
return{status=500,message='Unequal functions returned equal hashes'}elseif
getfunctionhash(ab)~=getfunctionhash(ad)then return{status=500,message=
'Equal functions returned unequal hashes'}elseif getfunctionhash(ae)==
getfunctionhash(af)then return{status=500,message=
'Unequal returns gave equal returns'}elseif ag then return{status=500,message=
'Passed when given a lua standard C closure'}end local ah,ai=a.b(){}if not ah
then return{status=501,message=`Alias not found: {ai}`}end return{status=200,
message=`Passed`}end end function a.m()local ab=a.cache.m if not ab then ab={c=
aa()}a.cache.m=ab end return ab.c end end do local aa=function()return function(
)if not checkcaller then return{status=400,message='Global not found'}elseif not
hookmetamethod then return{status=401,message=
"Dependency 'hookmetamethod' missing"}end local aa,ab,ac=(checkcaller())ac=
hookmetamethod(game,'__namecall',function(...)if ab==nil then ab=checkcaller()
end return ac(...)end)tostring(game)task.wait(0.1)hookmetamethod(game,
'__namecall',ac)if aa~=true then return{status=500,message=
'Returned false in executor thread'}elseif ab~=false then return{status=500,
message='Did not return false in a hook'}end local ad,ae=a.b(){}if not ad then
return{status=501,message=`Alias not found: {ae}`}end return{status=200,message=
'Passed'}end end function a.n()local ab=a.cache.n if not ab then ab={c=aa()}a.
cache.n=ab end return ab.c end end do local aa=function()local aa,ab={},{}for ac
=65,90 do table.insert(aa,ac)end for ac=97,122 do table.insert(aa,ac)end for ac=
48,57 do table.insert(aa,ac)end table.insert(aa,43)table.insert(aa,47)for ac,ad
in ipairs(aa)do ab[ad]=ac end local ac,ad,ae,af={},bit32.rshift,bit32.lshift,
bit32.band function ac.Encode(ag)local ah,ai={},0 for aj=1,#ag,3 do local ak,al,
b=string.byte(ag,aj,aj+2)local c,d,e,f=ad(ak,2),ae(af(ak,3),4)+ad(al or 0,4),ae(
af(al or 0,15),2)+ad(b or 0,6),af(b or 0,63)ai=ai+1 ah[ai]=aa[c+1]ai=ai+1 ah[ai]
=aa[d+1]ai=ai+1 ah[ai]=al and aa[e+1]or 61 ai=ai+1 ah[ai]=b and aa[f+1]or 61 end
local aj,ak,al={},0 for b=1,ai,4096 do ak=ak+1 al=b+4096-1 aj[ak]=string.char(
table.unpack(ah,b,al>ai and ai or al))end return table.concat(aj)end function ac
.Decode(ag)local ah,ai={},0 for aj=1,#ag,4 do local ak,al,b,c=string.byte(ag,aj,
aj+3)local d,e,f,g=ab[ak]-1,ab[al]-1,(ab[b]or 1)-1,(ab[c]or 1)-1 local h,i,j=ae(
d,2)+ad(e,4),ae(af(e,15),4)+ad(f,2),ae(af(f,3),6)+g ai=ai+1 ah[ai]=h if b~=61
then ai=ai+1 ah[ai]=i end if c~=61 then ai=ai+1 ah[ai]=j end end local aj,ak,al=
{},0 for b=1,ai,4096 do ak=ak+1 al=b+4096-1 aj[ak]=string.char(table.unpack(ah,b
,al>ai and ai or al))end return table.concat(aj)end return ac end function a.o()
local ab=a.cache.o if not ab then ab={c=aa()}a.cache.o=ab end return ab.c end
end do local aa=function()local aa,ab,ac={},function(aa,ab)return string.find(aa
,ab,0,true)end,function(aa)local ab={}ab.Offset=0 ab.Source=aa ab.Length=string.
len(aa)ab.IsFinished=false ab.LastUnreadBytes=0 function ab.read(ac,ad,ae)local
af,ag=ad or 1,if ae~=nil then ae else true local ah=string.sub(ac.Source,ac.
Offset+1,ac.Offset+af)local ai=string.len(ah)local aj=af-ai if ag then ac:seek(
af)end ac.LastUnreadBytes=aj return ah end function ab.seek(ac,ad)local ae=ad or
1 ac.Offset=math.clamp(ac.Offset+ae,0,ac.Length)ac.IsFinished=ac.Offset>=ac.
Length end function ab.append(ac,ad)ac.Source..=ad ac.Length=string.len(ac.
Source)ac:seek(0)end function ab.toEnd(ac)ac:seek(ac.Length)end return ab end
function aa.compress(ad)local ae,af={},ac(ad)if af.Length>12 then local ag=af:
read(4)local ah,ai,aj,ak,al=ag,ag,'','',true repeat al=true local b=af:read()if
ab(ah,b)then local c=af:read(3,false)if string.len(c)<3 then ak=b..c af:seek(3)
else aj=b..c local d=ab(ah,aj)if d then af:seek(3)repeat local e=af:read(1,false
)local f=aj..e local g=ab(ah,f)if g then aj=f d=g af:seek(1)end until not ab(ah,
f)or af.IsFinished local e,f=string.len(aj),true if af.Length-af.Offset<=5 then
ak=aj f=false end if f then al=false local g=string.len(ah)-d ah=ah..aj table.
insert(ae,{Literal=ai,LiteralLength=string.len(ai),MatchOffset=g+1,MatchLength=e
})ai=''end else ak=b end end else ak=b end if al then ai=ai..ak ah=ah..b end
until af.IsFinished table.insert(ae,{Literal=ai,LiteralLength=string.len(ai)})
else local ag=af.Source ae[1]={Literal=ag,LiteralLength=string.len(ag)}end local
ag=string.rep('\0',4)local ah=function(ah)ag=ag..ah end for ai,aj in ae do local
ak,al=aj.LiteralLength,(aj.MatchLength or 4)-4 local b,c=math.clamp(ak,0,15),
math.clamp(al,0,15)local d=bit32.lshift(b,4)+c ah(string.pack('<I1',d))if ak>=15
then ak=ak-15 repeat local e=math.clamp(ak,0,0xff)ah(string.pack('<I1',e))if e==
0xff then ak=ak-255 end until e<0xff end ah(aj.Literal)if ai~=#ae then ah(string
.pack('<I2',aj.MatchOffset))if al>=15 then al=al-15 repeat local e=math.clamp(al
,0,0xff)ah(string.pack('<I1',e))if e==0xff then al=al-255 end until e<0xff end
end end local ai,aj=string.len(ag)-4,af.Length return string.pack('<I4',ai)..
string.pack('<I4',aj)..ag end function aa.decompress(ad)local ae=ac(ad)local af,
ag=string.unpack('<I4',ae:read(4)),string.unpack('<I4',ae:read(4))if af==0 then
return ae:read(ag)end local ah=ac''repeat local ai=string.byte(ae:read())local
aj,ak=bit32.rshift(ai,4),bit32.band(ai,15)+4 if aj>=15 then repeat local al=
string.byte(ae:read())aj+=al until al~=0xff end local al=ae:read(aj)ah:append(al
)ah:toEnd()if ah.Length<ag then local b=string.unpack('<I2',ae:read(2))if ak>=19
then repeat local c=string.byte(ae:read())ak+=c until c~=0xff end ah:seek(-b)
local c,d,e,f=ah.Offset,ah:read(ak),(ah.LastUnreadBytes)if e then repeat ah.
Offset=c f=ah:read(e)e=ah.LastUnreadBytes d..=f until e<=0 end ah:append(d)ah:
toEnd()end until ah.Length>=ag return ah.Source end return aa end function a.p()
local ab=a.cache.p if not ab then ab={c=aa()}a.cache.p=ab end return ab.c end
end do local aa=function()local aa,ab,ac,ad={99,124,119,123,242,107,111,197,48,1
,103,43,254,215,171,118,202,130,201,125,250,89,71,240,173,212,162,175,156,164,
114,192,183,253,147,38,54,63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,
24,150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179
,41,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,239,
170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,157,56,245,188
,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,167,126,61,100,93,25,
115,96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219,224,50,58,10,73,6,36
,92,194,211,172,98,145,149,228,121,231,200,55,109,141,213,78,169,108,86,244,234,
101,122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,75,189,139,138,112,62,
181,102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,
155,30,135,233,206,85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,
187,22},{82,9,106,213,48,54,165,56,191,64,163,158,129,243,215,251,124,227,57,130
,155,47,255,135,52,142,67,68,196,222,233,203,84,123,148,50,166,194,35,61,238,76,
149,11,66,250,195,78,8,46,161,102,40,217,36,178,118,91,162,73,109,139,209,37,114
,248,246,100,134,104,152,22,212,164,92,204,93,101,182,146,108,112,72,80,253,237,
185,218,94,21,70,87,167,141,157,132,144,216,171,0,140,188,211,10,247,228,88,5,
184,179,69,6,208,44,30,143,202,63,15,2,193,175,189,3,1,19,138,107,58,145,17,65,
79,103,220,234,151,242,207,206,240,180,230,115,150,172,116,34,231,173,53,133,226
,249,55,232,28,117,223,110,71,241,26,113,29,41,197,137,111,183,98,14,170,24,190,
27,252,86,62,75,198,210,121,32,154,219,192,254,120,205,90,244,31,221,168,51,136,
7,199,49,177,18,16,89,39,128,236,95,96,81,127,169,25,181,74,13,45,229,122,159,
147,201,156,239,160,224,59,77,174,42,245,176,200,235,187,60,131,83,153,97,23,43,
4,126,186,119,214,38,225,105,20,99,85,33,12,125},{0,1,2,4,8,16,32,64,128,27,54,
108,216,171,77,154,47,94,188,99,198,151,53,106,212,179,125,250,239,197,145,57},
function(aa)local ab=bit32.lshift(aa,1)return if bit32.band(aa,128)==0 then ab
else bit32.bxor(ab,27)%256 end local ae,af,ag,ah,ai,aj,ak=function(ae,af)af=if
af then ab else aa for ag=1,4 do for ah=1,4 do ae[ag][ah]=af[ae[ag][ah]+1]end
end end,function(ae,af)ae[1][3],ae[2][3],ae[3][3],ae[4][3]=ae[3][3],ae[4][3],ae[
1][3],ae[2][3]if af then ae[1][2],ae[2][2],ae[3][2],ae[4][2]=ae[4][2],ae[1][2],
ae[2][2],ae[3][2]ae[1][4],ae[2][4],ae[3][4],ae[4][4]=ae[2][4],ae[3][4],ae[4][4],
ae[1][4]else ae[1][2],ae[2][2],ae[3][2],ae[4][2]=ae[2][2],ae[3][2],ae[4][2],ae[1
][2]ae[1][4],ae[2][4],ae[3][4],ae[4][4]=ae[4][4],ae[1][4],ae[2][4],ae[3][4]end
end,function(ae,af)for ag=1,4 do for ah=1,4 do ae[ag][ah]=bit32.bxor(ae[ag][ah],
af[ag][ah])end end end,function(ae,af)local ag,ah if af then for ai=1,4 do ag=
ad(ad(bit32.bxor(ae[ai][1],ae[ai][3])))ah=ad(ad(bit32.bxor(ae[ai][2],ae[ai][4]))
)ae[ai][1],ae[ai][2]=bit32.bxor(ae[ai][1],ag),bit32.bxor(ae[ai][2],ah)ae[ai][3],
ae[ai][4]=bit32.bxor(ae[ai][3],ag),bit32.bxor(ae[ai][4],ah)end end local ai for
aj=1,4 do ai=ae[aj]ag,ah=bit32.bxor(ai[1],ai[2],ai[3],ai[4]),ai[1]for ak=1,4 do
ai[ak]=bit32.bxor(ai[ak],ag,ad(bit32.bxor(ai[ak],ai[ak+1]or ah)))end end end,
function(ae,af,ag)if ag then table.move(af[1],1,4,1,ae)table.move(af[2],1,4,5,ae
)table.move(af[3],1,4,9,ae)table.move(af[4],1,4,13,ae)else for ah=1,#af/4 do
table.clear(ae[ah])table.move(af,ah*4-3,ah*4,1,ae[ah])end end return ae end,
function(ae,af,ag)table.clear(ae)for ah=1,math.min(#af,#ag)do table.insert(ae,
bit32.bxor(af[ah],ag[ah]))end return ae end,function(ae,af)local ag=true for ah=
if af then 1 else#ae,if af then#ae else 1,if af then 1 else-1 do if ae[ah]==255
then ae[ah]=0 else ae[ah]+=1 ag=false break end end return ag,ae end local al,b,
c,d=function(al)local b,c,d,e,f=ai(if#al==16 then{{},{},{},{}}elseif#al==24 then
{{},{},{},{},{},{}}else{{},{},{},{},{},{},{},{}},al),#al/4,2,{}while#b<(#al/4+7)
*4 do f=table.clone(b[#b])if#b%c==0 then table.insert(f,table.remove(f,1))for g=
1,4 do f[g]=aa[f[g]+1]end f[1]=bit32.bxor(f[1],ac[d])d+=1 elseif#al==32 and#b%c
==4 then for g=1,4 do f[g]=aa[f[g]+1]end end table.clear(e)aj(f,table.move(f,1,4
,1,e),b[#b-c+1])table.insert(b,f)end table.clear(e)for g=1,#b/4 do table.insert(
e,{})table.move(b,g*4-3,g*4,1,e[#e])end return e end,function(al,b,c,d,e)ai(d,c)
ag(d,b[1])for f=2,#al/4+6 do ae(d)af(d)ah(d)ag(d,b[f])end ae(d)af(d)ag(d,b[#b])
return ai(e,d,true)end,function(al,b,c,d,e)ai(d,c)ag(d,b[#b])af(d,true)ae(d,true
)for f=#al/4+6,2,-1 do ag(d,b[f])ah(d,true)af(d,true)ae(d,true)end ag(d,b[1])
return ai(e,d,true)end,function(al)if type(al)=='string'then local b={}for c=1,
string.len(al),7997 do table.move({string.byte(al,c,c+7996)},1,7997,c,b)end
return b elseif type(al)=='table'then for b,c in ipairs(al)do assert(type(c)==
'number'and math.floor(c)==c and 0<=c and c<256,'Unable to cast value to bytes')
end return al else error'Unable to cast value to bytes'end end local e=function(
e,f,g,h,i)e=d(e)assert(#e==16 or#e==24 or#e==32,
'Key must be either 16, 24 or 32 bytes long')f=d(f)assert(#f%(i or 16)==0,
'Input must be a multiple of '..(if i then'segment size '..i else'16')..
' bytes in length')if g then if type(h)=='table'then h=table.clone(h)local j,k=h
.Length,h.LittleEndian assert(type(j)=='number'and 0<j and j<=16,
'Counter value length must be between 1 and 16 bytes')h.Prefix=d(h.Prefix or{})h
.Suffix=d(h.Suffix or{})assert(#h.Prefix+#h.Suffix+j==16,
'Counter must be 16 bytes long')h.InitValue=if h.InitValue==nil then{1}else
table.clone(d(h.InitValue))assert(#h.InitValue<=j,
'Initial value length must be of the counter value')h.InitOverflow=if h.
InitOverflow==nil then table.create(j,0)else table.clone(d(h.InitOverflow))
assert(#h.InitOverflow<=j,
'Initial overflow value length must be of the counter value')for l=1,j-#h.
InitValue do table.insert(h.InitValue,1+if k then#h.InitValue else 0,0)end for l
=1,j-#h.InitOverflow do table.insert(h.InitOverflow,1+if k then#h.InitOverflow
else 0,0)end elseif type(h)~='function'then local j,k=if h then d(h)else table.
create(16,0),{}assert(#j==16,'Counter must be 16 bytes long')h={Length=16,Prefix
=k,Suffix=k,InitValue=j,InitOverflow=table.create(16,0)}end elseif g==false then
h=if h==nil then table.create(16,0)else d(h)assert(#h==16,
'Initialization vector must be 16 bytes long')end if i then i=math.floor(
tonumber(i)or 1)assert(type(i)=='number'and 0<i and i<=16,
'Segment size must be between 1 and 16 bytes')end return e,f,al(e),h,i end
return{encrypt_ECB=function(f,g)local h f,g,h=e(f,g)local i,j,k,l={},{},{{},{},{
},{}},{}for m=1,#g,16 do table.move(g,m,m+15,1,j)table.move(b(f,h,j,k,l),1,16,m,
i)end return i end,decrypt_ECB=function(f,g)local h f,g,h=e(f,g)local i,j,k,l={}
,{},{{},{},{},{}},{}for m=1,#g,16 do table.move(g,m,m+15,1,j)table.move(c(f,h,j,
k,l),1,16,m,i)end return i end,encrypt_CBC=function(f,g,h)local i f,g,i,h=e(f,g,
false,h)local j,k,l,m,n={},{},h,{{},{},{},{}},{}for o=1,#g,16 do table.move(g,o,
o+15,1,k)table.move(b(f,i,aj(n,k,l),m,l),1,16,o,j)end return j end,decrypt_CBC=
function(f,g,h)local i f,g,i,h=e(f,g,false,h)local j,k,l,m,n={},{},h,{{},{},{},{
}},{}for o=1,#g,16 do table.move(g,o,o+15,1,k)table.move(aj(k,c(f,i,k,m,n),l),1,
16,o,j)table.move(g,o,o+15,1,l)end return j end,encrypt_PCBC=function(f,g,h)
local i f,g,i,h=e(f,g,false,h)local j,k,l,m,n,o={},{},h,table.create(16,0),{{},{
},{},{}},{}for p=1,#g,16 do table.move(g,p,p+15,1,k)table.move(b(f,i,aj(k,aj(o,l
,k),m),n,l),1,16,p,j)table.move(g,p,p+15,1,m)end return j end,decrypt_PCBC=
function(f,g,h)local i f,g,i,h=e(f,g,false,h)local j,k,l,m,n,o={},{},h,table.
create(16,0),{{},{},{},{}},{}for p=1,#g,16 do table.move(g,p,p+15,1,k)table.
move(aj(m,c(f,i,k,n,o),aj(k,l,m)),1,16,p,j)table.move(g,p,p+15,1,l)end return j
end,encrypt_CFB=function(f,g,h,i)local j f,g,j,h,i=e(f,g,false,h,if i==nil then
1 else i)local k,l,m,n,o,p={},{},h,{},{{},{},{},{}},{}for q=1,#g,i do table.
move(g,q,q+i-1,1,l)table.move(aj(n,b(f,j,m,o,p),l),1,i,q,k)for r=16,i+1,-1 do
table.insert(n,1,m[r])end table.move(n,1,16,1,m)end return k end,decrypt_CFB=
function(f,g,h,i)local j f,g,j,h,i=e(f,g,false,h,if i==nil then 1 else i)local k
,l,m,n,o,p={},{},h,{},{{},{},{},{}},{}for q=1,#g,i do table.move(g,q,q+i-1,1,l)
table.move(aj(n,b(f,j,m,o,p),l),1,i,q,k)for r=16,i+1,-1 do table.insert(l,1,m[r]
)end table.move(l,1,16,1,m)end return k end,encrypt_OFB=function(f,g,h)local i f
,g,i,h=e(f,g,false,h)local j,k,l,m,n={},{},h,{{},{},{},{}},{}for o=1,#g,16 do
table.move(g,o,o+15,1,k)table.move(b(f,i,l,m,n),1,16,1,l)table.move(aj(n,k,l),1,
16,o,j)end return j end,encrypt_CTR=function(f,g,h)local i f,g,i,h=e(f,g,true,h)
local j,k,l,m,n,o,p={},{},{},{{},{},{},{}},{},(type(h)=='table')for q=1,#g,16 do
if o then if q>1 and ak(h.InitValue,h.LittleEndian)then table.move(h.
InitOverflow,1,16,1,h.InitValue)end table.clear(l)table.move(h.Prefix,1,#h.
Prefix,1,l)table.move(h.InitValue,1,h.Length,#l+1,l)table.move(h.Suffix,1,#h.
Suffix,#l+1,l)else p=d(h(l,(q+15)/16))assert(#p==16,
'Counter must be 16 bytes long')table.move(p,1,16,1,l)end table.move(g,q,q+15,1,
k)table.move(aj(l,b(f,i,l,m,n),k),1,16,q,j)end return j end}end function a.q()
local ab=a.cache.q if not ab then ab={c=aa()}a.cache.q=ab end return ab.c end
end do local aa=function()local aa,ab,ac,ad,ae,af=a.o(),a.p(),a.q(),buffer.
tostring,bit32.lshift(1,10),{}function af.encrypt(ag,ah,ai)return ac.
encrypt_CBC(ah,ag,ai)end function af.decrypt(ag,ah,ai)return ac.decrypt_CBC(ah,
ag,ai)end function af.base64encode(ag)return aa.Encode(ag)end function af.
base64decode(ag)return aa.Decode(ag)end function af.lz4compress(ag)return ab.
compress(ag)end function af.lz4decompress(ag)return ab.decompress(ag)end
function af.random(ag)if ag>ae or ag<0 then error(
'Expected number within range (0, 1024), got: '..tostring(ag),0)else local ah={}
for ai=33,57 do table.insert(ah,string.char(ai))end for ai=65,90 do table.
insert(ah,string.char(ai))end for ai=97,122 do table.insert(ah,string.char(ai))
end local ai={}for aj=1,ag do local ak=math.random(1,#ah)table.insert(ai,ah[ak])
end return table.concat(ai)end end return af end function a.r()local ab=a.cache.
r if not ab then ab={c=aa()}a.cache.r=ab end return ab.c end end do local aa=
function()return function()local aa=a.r()if not crypt or not crypt.encrypt then
return{status=400,message='Global not found'}end local ab,ac,ad,ae=
'1234567890abcdef','GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY','1234567890abcdef','CBC'
local af,ag=pcall(function()return crypt.encrypt(ab,ac,ad,ae)end)if not af then
return{status=0,message='Encrypt failed: '..tostring(ag)}end local ah,ai=
'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh',aa.base64encode(ag)if ai~=ah then return{
status=500,message="Encrypted data doesn't match reference data"}end local aj,ak
=a.b(){}if not aj then return{status=501,message=`Alias not found: {ak}`}end
return{status=200,message='Passed'}end end function a.s()local ab=a.cache.s if
not ab then ab={c=aa()}a.cache.s=ab end return ab.c end end do local aa=function
()return function()local aa=a.r()if not crypt or not crypt.decrypt then return{
status=400,message='Global not found'}end local ab,ac,ad,ae=aa.base64decode
'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh','GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY',
'1234567890abcdef','CBC'local af,ag=pcall(function()return crypt.decrypt(ab,ac,
ad,ae)end)if not af then return{status=0,message='Decrypt failed: '..tostring(ag
)}elseif not ag then return{status=500,message='Decrypt returned nothing'}elseif
ag~='1234567890abcdef'then return{status=500,message=
"Decrypted data doesn't match reference data"}end local ah,ai=a.b(){}if not ah
then return{status=501,message=`Alias not found: {ai}`}end return{status=200,
message='Passed'}end end function a.t()local ab=a.cache.t if not ab then ab={c=
aa()}a.cache.t=ab end return ab.c end end do local aa=function()return function(
)local aa=a.r()if not crypt or not crypt.generatekey then return{status=400,
message='Global not found'}end local ab=aa.base64decode(crypt.generatekey())if
type(ab)~='string'then return{status=500,message=
"Generated key doesn't form a string"}elseif#ab~=32 then return{status=500,
message="Key dosen't match the expected length"}end local ac,ad=a.b(){}if not ac
then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message='Passed'}end end function a.u()local ab=a.cache.u if not ab then ab={c=
aa()}a.cache.u=ab end return ab.c end end do local aa=function()return function(
)local aa=a.r()if not crypt or not crypt.generatebytes then return{status=400,
message='Global not found'}end local ab=math.random(1,512)local ac=crypt.
generatebytes(ab)local ad=aa.base64decode(ac)if type(ad)~='string'then return{
status=500,message='Generated bytes do not form a string'}elseif#ad~=ab then
return{status=500,message='Bytes length mismatch: '..tostring(#ad)..' != '..
tostring(ab)}end local ae,af=a.b(){'base64_decode','crypt.base64.decode',
'base64.decode','crypt.base64_decode'}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message='Passed'}end end function a.v()local ab=a.
cache.v if not ab then ab={c=aa()}a.cache.v=ab end return ab.c end end do local
aa=function()return function()local aa=a.r()if not crypt or not crypt.
base64encode then return{status=400,message='Global not found'}end local ab=
'MYRIAD'local ac=crypt.base64encode(ab)if not ac or typeof(ac)~='string'then
return{status=500,message='Did not return the expected type'}elseif ac~=aa.
base64encode(ab)then return{status=500,message=
"Encoded data doesn't match reference data"}end local ad,ae=a.b(){
'base64_encode','crypt.base64.encode','base64.encode','crypt.base64_encode'}if
not ad then return{status=501,message=`Alias not found: {ae}`}end return{status=
200,message='Passed'}end end function a.w()local ab=a.cache.w if not ab then ab=
{c=aa()}a.cache.w=ab end return ab.c end end do local aa=function()return
function()local aa=a.r()if not crypt or not crypt.base64decode then return{
status=400,message='Global not found'}end local ab='MYRIAD'local ac=aa.
base64encode(ab)local ad=crypt.base64decode(ac)if not ac or typeof(ac)~='string'
then return{status=500,message='Reference crypt failed'}elseif not ad or typeof(
ad)~='string'then return{status=500,message='Did not return the expected type'}
elseif ad~=ab then return{status=500,message=
"Decoded data doesn't match reference data"}end local ae,af=a.b(){
'base64_decode','crypt.base64.decode','base64.decode','crypt.base64_decode'}if
not ae then return{status=501,message=`Alias not found: {af}`}end return{status=
200,message='Passed'}end end function a.x()local ab=a.cache.x if not ab then ab=
{c=aa()}a.cache.x=ab end return ab.c end end do local aa=function()return
function()if not crypt or not crypt.hash then return{status=400,message=
'Global not found'}end local aa,ab='MYRIAD',{md5=
[[4f4c0116fe2faa1318448c548b35db329d04b95d6a564c9952674be7470292a8]],sha1=
[[fc7f43037330bdab9a8a3b19a7cbcde1ca35f0f3413e8109f2378d448e09d746]],sha224=
[[c289f37be9147ea83aea5178831674ac35512679c9ac728b0af58d1354aa9586]],sha256=
[[c9d5cae0702443d77159a3da3993a31e21fe71347946e8088e29c329b2fad67d]],sha384=
[[75805da0851cdb609be9cce35c7cf9b8c560fe1d015370d9ffdc7dc974cec3d2]],sha512=
[[9e5a7723b2776d0a26cfc7a1ee141ee7e23ab9be07a7bbe9a83ad9a44d6c932c]],['sha3-256'
]=[[508c76d7f914e8f434b11c84fa5c55a086f86b8b0b38ce0dffa861fdfbdc77b3]],[
'sha3-384']=[[1fb780f81b5a6013af2bfe6677a34439970c63b8447a00e0c23c0e5ff1a4bbd2]]
,['sha3-512']=
[[bc49e307d6fd0fc8f9ab5c9236ea93194dfa99dd89fea20e75aed6530bd6820b]]}for ac,ad
in pairs(ab)do local ae,af=pcall(crypt.hash,aa,ac)if not ae then return{status=0
,message=`Hashing failed with {ac}: {af}`}elseif not af then return{status=500,
message=`Hashing failed, expected a hash. Algorithm: {ac}`}elseif af~=ad then
return{status=500,message=`Hash mismatch. Algorithm: {ac}`}end end local ac,ad=a
.b(){}if not ac then return{status=501,message=`Alias not found: {ad}`}end
return{status=200,message='Passed'}end end function a.y()local ab=a.cache.y if
not ab then ab={c=aa()}a.cache.y=ab end return ab.c end end do local aa=function
()return function()if not crypt or not crypt.random then return{status=400,
message='Global not found'}end local aa=pcall(function()return crypt.random(512)
end)local ab=pcall(function()return crypt.random(-1)end)local ac,ad=pcall(
function()return crypt.random(64)end)if not ac then return{status=0,message=
'Failed: '..tostring(ad)}elseif ab then return{status=500,message=
'Arg[1] passed -1, should have failed.'}elseif not aa then return{status=500,
message='Arg[1] passed 512, should have passed.'}elseif#ad~=64 then return{
status=500,message='Len mismatch. Expected 64, got: '..tostring(#ad)}end local
ae,af=a.b(){}if not ae then return{status=501,message=`Alias not found: {af}`}
end return{status=200,message='Passed'}end end function a.z()local ab=a.cache.z
if not ab then ab={c=aa()}a.cache.z=ab end return ab.c end end do local aa=
function()return function()a.r()if not crypt or not crypt.hmac then return{
status=400,message='Global not found'}end local aa,ab,ac,ad='MYRIAD',
'secret_key','sha256','FaDPiTSLlbxRP5rKvomt0dzwl7zhszc46/QFPsZRGWY='local ae=
crypt.hmac(ab,aa,ac)if not ae then return{status=500,message=
'Did not return the expected type'}elseif ae~=ad then return{status=500,message=
"Data doesn't match reference data"}end local af,ag=a.b(){}if not af then return
{status=501,message=`Alias not found: {ag}`}end return{status=200,message=
'Passed'}end end function a.A()local ab=a.cache.A if not ab then ab={c=aa()}a.
cache.A=ab end return ab.c end end do local aa=function()return function()if not
debug or not debug.getconstant then return{status=400,message='Global not found'
}end local aa,ab=function()local aa,ab=2,'A'print(aa)tostring(ab)Date.now()end,{
[1]='print',[3]='A',[4]='tostring',[6]='Date',[7]='now'}for ac,ad in ipairs(ab)
do local ae=debug.getconstant(aa,ac)if ae~=ad then return{status=500,message=`Constant at {
ac} should be: {ad}. Got: {ae}`}end end local ac,ad=pcall(debug.getconstant,aa,9
)if not ac then return{status=500,message=
'Should pass nil instead of errroing for invalid indexes'}elseif ad then return{
status=500,message="Constant 9 shouldn't exist"}elseif pcall(debug.getconstant,
print,1)then return{status=500,message='Should error with C closures'}end local
ae,af=a.b(){'getconstant'}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message=`Passed`}end end function a.B()local ab=a.
cache.B if not ab then ab={c=aa()}a.cache.B=ab end return ab.c end end do local
aa=function()return function()if not debug or not debug.getconstants then return
{status=400,message='Global not found'}end local aa,ab=function()local aa,ab=2,
'A'print(aa)tostring(ab)Date.now()end,{[1]='print',[3]='A',[4]='tostring',[6]=
'Date',[7]='now'}for ac,ad in pairs(debug.getconstants(aa))do if not ab[ac]then
return{status=500,message=`{ac} dosen't exist in expected constant order`}elseif
ab[ac]~=ad then return{status=500,message=`Constant at {ac} should be: {ab[ac]}. Got: {
ad}`}end end if pcall(debug.getconstants,print)then return{status=500,message=
'Should error with C closures'}end local ac,ad=a.b(){'getconstants'}if not ac
then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message=`Passed`}end end function a.C()local ab=a.cache.C if not ab then ab={c=
aa()}a.cache.C=ab end return ab.c end end do local aa=function()return function(
)if not debug or not debug.getproto then return{status=400,message=
'Global not found'}end local aa=function()return function()return'MYRI'end end
local ab=debug.getproto(aa,1,true)[1]if aa()~=ab then return{status=500,message=
"Actual prototype dosen't match assumed prototype"}elseif ab()~='MYRI'then
return{status=500,message='Unexpected value of assumed prototype'}end local ac,
ad=a.b(){'getproto'}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.D()local ab=a.
cache.D if not ab then ab={c=aa()}a.cache.D=ab end return ab.c end end do local
aa=function()return function()if not debug or not debug.getprotos then return{
status=400,message='Global not found'}end local aa,ab=function()return function(
)return'MYRI1'end,function()return'MYRI2'end end,0 for ac,ad in ipairs(debug.
getprotos(aa))do ab+=ad()==(ac==1 and'MYRI1'or'MYRI2')and 1 or 0 end if ab~=2
then return{status=500,message=
[[Didn't recieve correct prototypes, or prototypes didn't return expected values.]]
}end local ac,ad=a.b(){'getprotos'}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.E()local ab=a.
cache.E if not ab then ab={c=aa()}a.cache.E=ab end return ab.c end end do local
aa=function()return function()if not debug or not debug.getupvalue then return{
status=400,message='Global not found'}end local aa,ab=a.b(){'getupvalue'}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.F()local ab=a.cache.F if not ab then ab={c=
aa()}a.cache.F=ab end return ab.c end end do local aa=function()return function(
)if not debug or not debug.getupvalues then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){'getupvalues'}if not aa then return{
status=501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`
}end end function a.G()local ab=a.cache.G if not ab then ab={c=aa()}a.cache.G=ab
end return ab.c end end do local aa=function()return function()if not debug or
not debug.getstack then return{status=400,message='Global not found'}end local
aa,ab=a.b(){'getstack'}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.H()local ab=a.
cache.H if not ab then ab={c=aa()}a.cache.H=ab end return ab.c end end do local
aa=function()return function()if not debug or not debug.setconstant then return{
status=400,message='Global not found'}end local aa,ab=a.b(){'setconstant'}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.I()local ab=a.cache.I if not ab then ab={c=
aa()}a.cache.I=ab end return ab.c end end do local aa=function()return function(
)if not debug or not debug.setupvalue then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){'setupvalue'}if not aa then return{
status=501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`
}end end function a.J()local ab=a.cache.J if not ab then ab={c=aa()}a.cache.J=ab
end return ab.c end end do local aa=function()return function()if not Drawing or
not Drawing.new then return{status=400,message='Global Drawing API not found'}
end local aa=function(aa,ab,ac)for ad,ae in ipairs(ac)do local af,ag=pcall(
function()return ab[ae]end)if not af or ag==nil then return{status=500,message=`{
aa} is missing property: {ae} (Did you give it a default value?)`}end ab:
Destroy()end end do local ab=Drawing.new'Line'if not ab then return{status=500,
message='Line drawing object not found'}end local ac=aa('Line',ab,{'Visible',
'ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy','Thickness','From',
'To'})if ac then return ac end end do local ab=Drawing.new'Text'if not ab then
return{status=500,message='Text drawing object not found'}end local ac=aa('Text'
,ab,{'Visible','ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy',
'Text','TextBounds','Center','Size','Font','Outline','OutlineColor','Position'})
if ac then return ac end end do local ab=Drawing.new'Image'if not ab then return
{status=500,message='Image drawing object not found'}end local ac=aa('Image',ab,
{'Visible','ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy','Data',
'Size','Position'})if ac then return ac end end do local ab=Drawing.new'Circle'
if not ab then return{status=500,message='Circle drawing object not found'}end
local ac=aa('Circle',ab,{'Visible','ZIndex','Transparency','Color',
'__OBJECT_EXISTS','Destroy','NumSides','Radius','Position','Thickness','Filled'}
)if ac then return ac end end do local ab=Drawing.new'Square'if not ab then
return{status=500,message='Square drawing object not found'}end local ac=aa(
'Square',ab,{'Visible','ZIndex','Transparency','Color','__OBJECT_EXISTS',
'Destroy','Size','Position','Thickness','Filled'})if ac then return ac end end
do local ab=Drawing.new'Quad'if not ab then return{status=500,message=
'Quad drawing object not found'}end local ac=aa('Quad',ab,{'Destroy','Visible',
'ZIndex','Transparency','Color','__OBJECT_EXISTS','PointA','PointB','PointC',
'PointD','Thickness','Filled'})if ac then return ac end end do local ab=Drawing.
new'Triangle'if not ab then return{status=500,message=
'Triangle drawing object not found'}end local ac=aa('Triangle',ab,{'Destroy',
'Visible','ZIndex','Transparency','Color','__OBJECT_EXISTS','PointA','PointB',
'PointC','Thickness','Filled'})if ac then return ac end end local ab,ac,ad,ae,af
=math.random(1,255),math.random(1,255),math.random(1,255),gethui and gethui()or
game:GetService'CoreGui',Drawing.new'Line'af.Color=Color3.fromRGB(ab,ac,ad)af.
Transparency=1-ab/255 if ae then for ag,ah in pairs(ae:GetDescendants())do if ah
:IsA'Frame'and ah.BackgroundColor3==af.Color and ah.BackgroundTransparency==af.
Transparency then return{status=500,message=
'Drawing library almost certainly depends on ScreenGui'}end end end local ag,ah=
a.b(){}if not ag then return{status=501,message=`Alias not found: {ah}`}end
return{status=200,message='Passed'}end end function a.K()local ab=a.cache.K if
not ab then ab={c=aa()}a.cache.K=ab end return ab.c end end do local aa=function
()return function()if not Drawing or not Drawing.Fonts then return{status=400,
message='Global not found'}end if not Drawing.Fonts.UI then return{status=500,
message='UI font not found'}elseif not Drawing.Fonts.System then return{status=
500,message='System font not found'}elseif not Drawing.Fonts.Plex then return{
status=500,message='Plex font not found'}elseif not Drawing.Fonts.Monospace then
return{status=500,message='Monospace font not found'}elseif Drawing.Fonts.UI~=0
then return{status=500,message="UI font isn't ID 0"}elseif Drawing.Fonts.System
~=1 then return{status=500,message="System font isn't ID 1"}elseif Drawing.Fonts
.Plex~=2 then return{status=500,message="Plex font isn't ID 2"}elseif Drawing.
Fonts.Monospace~=3 then return{status=500,message="Monospace font isn't ID 3"}
end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.L()local ab=a.
cache.L if not ab then ab={c=aa()}a.cache.L=ab end return ab.c end end do local
aa=function()return function()if not getrenderproperty then return{status=400,
message='Global not found'}elseif not Drawing or not Drawing.new then return{
status=401,message='Drawing library needed to test this'}end local aa=Drawing.
new'Line'aa.Thickness=2 aa.Visible=false local ab,ac=getrenderproperty(aa,
'Thickness'),getrenderproperty(aa,'Visible')if ab~=2 or ac~=false then return{
status=500,message='Property not found or mismatch'}end local ad,ae=a.b(){}if
not ad then return{status=501,message=`Alias not found: {ae}`}end return{status=
200,message=`Passed`}end end function a.M()local ab=a.cache.M if not ab then ab=
{c=aa()}a.cache.M=ab end return ab.c end end do local aa=function()return
function()if not setrenderproperty then return{status=400,message=
'Global not found'}elseif not Drawing or not Drawing.new then return{status=401,
message='Drawing library needed to test this'}end local aa=Drawing.new'Line'
setrenderproperty(aa,'Thickness',2)setrenderproperty(aa,'Visible',false)if aa.
Thickness~=2 or aa.Visible~=false then return{status=500,message=
'Incorrect property value'}end local ab,ac=a.b(){}if not ab then return{status=
501,message=`Alias not found: {ac}`}end return{status=200,message=`Passed`}end
end function a.N()local ab=a.cache.N if not ab then ab={c=aa()}a.cache.N=ab end
return ab.c end end do local aa=function()return function()if not cleardrawcache
then return{status=400,message='Global not found'}elseif not Drawing or not
Drawing.new then return{status=401,message='Drawing library needed to test this'
}end local aa=Drawing.new'Line'aa.Visible=false aa.Thickness=2 task.defer(
cleardrawcache)task.wait(0.1)if aa.__OBJECT_EXISTS then return{status=500,
message='Drawing exists after draw clear'}end local ab,ac=a.b(){}if not ab then
return{status=501,message=`Alias not found: {ac}`}end return{status=200,message=
`Passed`}end end function a.O()local ab=a.cache.O if not ab then ab={c=aa()}a.
cache.O=ab end return ab.c end end do local aa=function()return function()if not
isrenderobj then return{status=400,message='Global not found'}elseif not Drawing
or not Drawing.new then return{status=401,message=
'Drawing library needed to test this'}end local aa=Drawing.new'Line'aa.Visible=
false if not isrenderobj(aa)then return{status=500,message=
"Didn't return true for a render object"}elseif isrenderobj{}or isrenderobj(game
:GetService'Workspace')then return{status=500,message=
'Returned true for a non-render object'}end local ab,ac=a.b(){}if not ab then
return{status=501,message=`Alias not found: {ac}`}end return{status=200,message=
`Passed`}end end function a.P()local ab=a.cache.P if not ab then ab={c=aa()}a.
cache.P=ab end return ab.c end end do local aa=function()return function()if not
getgenv then return{status=400,message='Global not found'}end getfenv().MYRI=
'Hello, World!'getgenv().MYRI1='Hello, World!'getgenv().MYRI2=123456789 if
getgenv().MYRI=='Hello, World!'then return{status=500,message=
'getfenv affected getgenv'}end if getgenv().MYRI1~='Hello, World!'then return{
status=500,message='MYRI1 not found or unexpected value'}elseif getgenv().MYRI2
~=123456789 then return{status=500,message='MYRI2 not found or unexpected value'
}end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.Q()local ab=a.
cache.Q if not ab then ab={c=aa()}a.cache.Q=ab end return ab.c end end do local
aa=function()return function()if not getrenv then return{status=400,message=
'Global not found'}end getrenv().MYRIR1='Hello, World!'getrenv().MYRIR2=
123456789 if getrenv().MYRIR1~='Hello, World!'then return{status=500,message=
'MYRIR1 not found or unexpected value'}elseif getrenv().MYRIR2~=123456789 then
return{status=500,message='MYRIR2 not found or unexpected value'}elseif getrenv(
).game~=game then return{status=500,message='game not found or unexpected value'
}elseif getrenv().print~=print then return{status=500,message=
'print not found or unexpected value'}elseif getrenv()._G==_G then return{status
=500,message="_G in roblox environment shouldn't match the executor's"}end local
aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {ab}`}
end return{status=200,message=`Passed`}end end function a.R()local ab=a.cache.R
if not ab then ab={c=aa()}a.cache.R=ab end return ab.c end end do local aa=
function()return function()if not getgc then return{status=400,message=
'Global not found'}end local aa,ab={},function()end task.wait(0.1)local ac,ad
for ae,af in pairs(getgc(true))do if af==ab then ac=true elseif af==aa then ad=
true end end if not ac then return{status=500,message=
'Original function not found'}elseif not ad then return{status=500,message=
'Original table not found'}end local ae,af=a.b(){}if not ae then return{status=
501,message=`Alias not found: {af}`}end return{status=200,message=`Passed`}end
end function a.S()local ab=a.cache.S if not ab then ab={c=aa()}a.cache.S=ab end
return ab.c end end do local aa=function()return function()if not filtergc then
return{status=400,message='Global not found'}end local aa='MYRIAD'local ab,ac=
function()return'MYRIAD',aa end,setmetatable({MYRIAD='MYRI'},{__index=function()
end})do local ad=ac.MYRIAD ab()end task.wait(0.1)local ad,ae=filtergc('function'
,{Constants={'MYRIAD'},Upvalues={'MYRIAD'},IgnoreExecutor=false},true),filtergc(
'table',{KeyValuePairs={MYRIAD='MYRI'},Metatable=getmetatable(ac)},true)if ad~=
ab then return{status=500,message=
'filtergc failed to retrieve the original function'}elseif ae~=ac then return{
status=500,message='filtergc failed to retrieve the original table'}end local af
,ag=a.b(){}if not af then return{status=501,message=`Alias not found: {ag}`}end
return{status=200,message='Passed'}end end function a.T()local ab=a.cache.T if
not ab then ab={c=aa()}a.cache.T=ab end return ab.c end end do local aa=function
()return function()if not getcustomasset then return{status=400,message=
'Global not found'}elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}end local aa=game:GetService'HttpService':
GenerateGUID(false):gsub('-','')writefile(aa,'31kr6ji222uvn7zvz6ue5yfyn7ky')task
.wait(0.2)local ab=getcustomasset(aa)if not typeof(ab)=='string'then return{
status=500,message='Asset is not of the expected type (string)'}elseif not ab:
match'rbxasset://'then return{status=500,message=
"Asset string dosen't include a rbxasset prefix"}end delfile(aa)local ac,ad=a.b(
){}if not ac then return{status=501,message=`Alias not found: {ad}`}end return{
status=200,message=`Passed`}end end function a.U()local ab=a.cache.U if not ab
then ab={c=aa()}a.cache.U=ab end return ab.c end end do local aa=function()
return function()if not isfile then return{status=400,message='Global not found'
}elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}elseif not delfile then return{status=401,
message="Dependency 'delfile' not found"}end local aa,ab,ac,ad=game:GetService
'HttpService':GenerateGUID(false):gsub('-',''),game:GetService'HttpService':
GenerateGUID(false):gsub('-',''),false,false writefile(aa,'')writefile(ab,'')
task.wait(0.2)for ae,af in listfiles''do if af==aa then ac=true end if af==ab
then ad=true end end if not ac and ad then return{status=500,message=
"Didn't find the expected files"}end delfile(aa)delfile(ab)local ae,af=a.b(){}if
not ae then return{status=501,message=`Alias not found: {af}`}end return{status=
200,message=`Passed`}end end function a.V()local ab=a.cache.V if not ab then ab=
{c=aa()}a.cache.V=ab end return ab.c end end do local aa=function()return
function()if not loadfile then return{status=400,message='Global not found'}
elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}elseif not delfile then return{status=401,
message="Dependency 'delfile' not found"}end local aa,ab,ac=math.random(1,100),
math.random(1,100),game:GetService'HttpService':GenerateGUID(false):gsub('-','')
writefile(ac,[[return function(...) return select(1, ...) + select(2, ...) end]]
)task.wait(0.2)local ad=loadfile(ac)if not ad then return{status=500,message=
'Failed to load file'}end if ad()(aa,ab)~=aa+ab then return{status=500,message=
'File did not return the expected value'}end delfile(ac)local ae,af=a.b(){}if
not ae then return{status=501,message=`Alias not found: {af}`}end return{status=
200,message=`Passed`}end end function a.W()local ab=a.cache.W if not ab then ab=
{c=aa()}a.cache.W=ab end return ab.c end end do local aa=function()return
function()if not appendfile then return{status=400,message='Global not found'}
elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}elseif not readfile then return{status=401,
message="Dependency 'readfile' not found"}elseif not delfile then return{status=
401,message="Dependency 'delfile' not found"}end local aa=game:GetService
'HttpService':GenerateGUID(false):gsub('-','')writefile(aa,'Hello, ')task.wait(
0.2)appendfile(aa,'World!')task.wait(0.2)if readfile(aa)~='Hello, World!'then
return{status=500,message='File did not read the expected value'}end delfile(aa)
local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.X()local ab=a.
cache.X if not ab then ab={c=aa()}a.cache.X=ab end return ab.c end end do local
aa=function()return function()if not delfile then return{status=400,message=
'Global not found'}elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}elseif not isfile then return{status=401,
message="Dependency 'isfile' not found"}end local aa,ab=pcall(writefile,
'test1.txt','Content')local ac,ad=pcall(writefile,'./test2.txt','Content')local
ae,af=pcall(writefile,'C:/test3.txt','Content'),pcall(writefile,'../test4.txt',
'Content')if not aa then return{status=0,message='Failed to write @ test1.txt: '
..ab}elseif not ac then return{status=0,message=
'Failed to write @ ./test2.txt: '..ad}elseif ae then return{status=500,message=
"Didn't fail to write in illegal location: @ C:/test3.txt"}elseif af then return
{status=500,message="Didn't fail to write in illegal location: @ ../test4.txt"}
elseif not isfile'test1.txt'then return{status=500,message=
"Didn't find: test1.txt"}elseif not isfile'./test2.txt'then return{status=500,
message="Didn't find: ./test2.txt"}end delfile'test1.txt'delfile'./test2.txt'
task.wait(0.2)if isfile'test1.txt'then return{status=500,message=
'Found: test1.txt'}elseif isfile'./test2.txt'then return{status=500,message=
'Found: ./test2.txt'}end local ag,ah=a.b(){}if not ag then return{status=501,
message=`Alias not found: {ah}`}end return{status=200,message=`Passed`}end end
function a.Y()local ab=a.cache.Y if not ab then ab={c=aa()}a.cache.Y=ab end
return ab.c end end do local aa=function()return function()if not delfolder then
return{status=400,message='Global not found'}elseif not makefolder then return{
status=401,message="Dependency 'makefolder' not found"}elseif not isfolder then
return{status=401,message="Dependency 'isfolder' not found"}end local aa=game:
GetService'HttpService':GenerateGUID(false):gsub('-','')if isfolder(aa)then
return{status=500,message=`Nonexistent file returned true`}end makefolder(aa)
task.wait(0.2)if not isfolder(aa)then return{status=500,message=`Existing file returned false`
}end delfolder(aa)task.wait(0.2)if isfolder(aa)then return{status=500,message=`Nonexistent file returned true`
}end local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.Z()local ab=a.
cache.Z if not ab then ab={c=aa()}a.cache.Z=ab end return ab.c end end do local
aa=function()return function()if not isfile then return{status=400,message=
'Global not found'}elseif not writefile then return{status=401,message=
"Dependency 'writefile' not found"}elseif not delfile then return{status=401,
message="Dependency 'delfile' not found"}end local aa=game:GetService
'HttpService':GenerateGUID(false):gsub('-','')if isfile(aa)then return{status=
500,message=`Nonexistent file returned true`}end writefile(aa,'')task.wait(0.2)
if not isfile(aa)then return{status=500,message=`Existing file returned false`}
end delfile(aa)local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a._()local ab=a.
cache._ if not ab then ab={c=aa()}a.cache._=ab end return ab.c end end do local
aa=function()return function()if not isfolder then return{status=400,message=
'Global not found'}elseif not makefolder then return{status=401,message=
"Dependency 'makefolder' not found"}elseif not delfolder then return{status=401,
message="Dependency 'delfolder' not found"}end local aa=game:GetService
'HttpService':GenerateGUID(false):gsub('-','')if isfolder(aa)then return{status=
500,message=`Nonexistent folder returned true`}end makefolder(aa)task.wait(0.2)
if not isfolder(aa)then return{status=500,message=`Existing folder returned false`
}end delfolder(aa)local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.aa()local ab=a.
cache.aa if not ab then ab={c=aa()}a.cache.aa=ab end return ab.c end end do
local aa=function()return function()if not writefile then return{status=400,
message='Global not found'}elseif not delfile then return{status=401,message=
"Dependency 'delfile' not found"}elseif not readfile then return{status=401,
message="Dependency 'readfile' not found"}end local aa,ab=pcall(writefile,
'test1.txt','Content')local ac,ad=pcall(writefile,'./test2.txt','Content')local
ae,af=pcall(writefile,'C:/test3.txt','Content'),pcall(writefile,'../test4.txt',
'Content')if not aa then return{status=0,message='Failed to write @ test1.txt: '
..ab}elseif not ac then return{status=0,message=
'Failed to write @ ./test2.txt: '..ad}elseif ae then return{status=500,message=
"Didn't fail to write in illegal location: @ C:/test3.txt"}elseif af then return
{status=500,message="Didn't fail to write in illegal location: @ ../test4.txt"}
elseif readfile'test1.txt'~='Content'then return{status=500,message=
"File didn't give expected contnet"}elseif readfile'test2.txt'~='Content'then
return{status=500,message="File didn't give expected contnet"}end delfile
'test1.txt'delfile'./test2.txt'local ag,ah=a.b(){}if not ag then return{status=
501,message=`Alias not found: {ah}`}end return{status=200,message=`Passed`}end
end function a.ab()local ab=a.cache.ab if not ab then ab={c=aa()}a.cache.ab=ab
end return ab.c end end do local aa=function()return function()if not readfile
then return{status=400,message='Global not found'}elseif not delfile then return
{status=401,message="Dependency 'delfile' not found"}elseif not writefile then
return{status=401,message="Dependency 'writefile' not found"}end local aa,ab=
pcall(writefile,'test1.txt','Content')if not aa then return{status=0,message=
'Failed to write @ test1.txt: '..ab}elseif readfile'test1.txt'~='Content'then
return{status=500,message="File didn't return the expected content"}end delfile
'test1.txt'local ac,ad=a.b(){}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.ac()local ab=a.
cache.ac if not ab then ab={c=aa()}a.cache.ac=ab end return ab.c end end do
local aa=function()return function()if not makefolder then return{status=400,
message='Global not found'}elseif not delfolder then return{status=401,message=
"Dependency 'delfolder' not found"}end local aa,ab=pcall(makefolder,'test1')
local ac,ad=pcall(makefolder,'./test2')local ae,af=pcall(makefolder,'C:/test3'),
pcall(makefolder,'../test4')if not aa then return{status=0,message=
'Failed to make @ test1: '..ab}elseif not ac then return{status=0,message=
'Failed to make @ ./test2: '..ad}elseif ae then return{status=500,message=
"Didn't fail to make in illegal location: @ C:/test3"}elseif af then return{
status=500,message="Didn't fail to make in illegal location: @ ../test4"}end
delfolder'test1'delfolder'./test2'local ag,ah=a.b(){}if not ag then return{
status=501,message=`Alias not found: {ah}`}end return{status=200,message=`Passed`
}end end function a.ad()local ab=a.cache.ad if not ab then ab={c=aa()}a.cache.ad
=ab end return ab.c end end do local aa=function()return function()if not
isrbxactive then return{status=400,message='Global not found'}end local aa,ab=a.
b(){'iswindowactive','isgameactive'}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.ae()local ab=a.
cache.ae if not ab then ab={c=aa()}a.cache.ae=ab end return ab.c end end do
local aa=function()return function()if not keypress then return{status=400,
message='Global not found'}end local aa,ab=a.b(){}if not aa then return{status=
501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end
end function a.af()local ab=a.cache.af if not ab then ab={c=aa()}a.cache.af=ab
end return ab.c end end do local aa=function()return function()if not keyrelease
then return{status=400,message='Global not found'}end local aa,ab=a.b(){}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.ag()local ab=a.cache.ag if not ab then ab={c
=aa()}a.cache.ag=ab end return ab.c end end do local aa=function()return
function()if not keytap then return{status=400,message='Global not found'}end
local aa,ab=a.b(){'keyclick'}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.ah()local ab=a.
cache.ah if not ab then ab={c=aa()}a.cache.ah=ab end return ab.c end end do
local aa=function()return function()if not mouse1click then return{status=400,
message='Global not found'}end local aa,ab=a.b(){}if not aa then return{status=
501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end
end function a.ai()local ab=a.cache.ai if not ab then ab={c=aa()}a.cache.ai=ab
end return ab.c end end do local aa=function()return function()if not
mouse1press then return{status=400,message='Global not found'}end local aa,ab=a.
b(){}if not aa then return{status=501,message=`Alias not found: {ab}`}end return
{status=200,message=`Passed`}end end function a.aj()local ab=a.cache.aj if not
ab then ab={c=aa()}a.cache.aj=ab end return ab.c end end do local aa=function()
return function()if not mouse1release then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.ak()local ab=a.cache.ak if not ab then ab={c=aa()}a.cache.ak=ab end
return ab.c end end do local aa=function()return function()if not mouse2click
then return{status=400,message='Global not found'}end local aa,ab=a.b(){}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.al()local ab=a.cache.al if not ab then ab={c
=aa()}a.cache.al=ab end return ab.c end end do local aa=function()return
function()if not mouse2press then return{status=400,message='Global not found'}
end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.am()local ab=a.
cache.am if not ab then ab={c=aa()}a.cache.am=ab end return ab.c end end do
local aa=function()return function()if not mouse2release then return{status=400,
message='Global not found'}end local aa,ab=a.b(){}if not aa then return{status=
501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end
end function a.an()local ab=a.cache.an if not ab then ab={c=aa()}a.cache.an=ab
end return ab.c end end do local aa=function()return function()if not
mousemoveabs then return{status=400,message='Global not found'}end local aa,ab=a
.b(){}if not aa then return{status=501,message=`Alias not found: {ab}`}end
return{status=200,message=`Passed`}end end function a.ao()local ab=a.cache.ao if
not ab then ab={c=aa()}a.cache.ao=ab end return ab.c end end do local aa=
function()return function()if not mousemoverel then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.ap()local ab=a.cache.ap if not ab then ab={c=aa()}a.cache.ap=ab end
return ab.c end end do local aa=function()return function()if not mousescroll
then return{status=400,message='Global not found'}end local aa,ab=a.b(){}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.aq()local ab=a.cache.aq if not ab then ab={c
=aa()}a.cache.aq=ab end return ab.c end end do local aa=function()return
function()if not setclipboard then return{status=400,message='Global not found'}
end local aa,ab=a.b(){'toclipboard'}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.ar()local ab=a.
cache.ar if not ab then ab={c=aa()}a.cache.ar=ab end return ab.c end end do
local aa=function()return function()if not setrbxclipboard then return{status=
400,message='Global not found'}end local aa,ab=a.b(){}if not aa then return{
status=501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`
}end end function a.as()local ab=a.cache.as if not ab then ab={c=aa()}a.cache.as
=ab end return ab.c end end do local aa=function()return function()if not gethui
then return{status=400,message='Global not found'}end local aa=gethui()if not(aa
:IsA'ScreenGui'or aa:IsA'BasePlayerGui'or aa:IsA'Folder')then return{status=500,
message='Container is not a ScreenGui, BasePlayerGui, or Folder'}end if aa==game
:GetService'CoreGui'then return{status=500,message=
'Container cannot be an uncloned reference to CoreGui'}end local ab,ac=a.b(){
'get_hidden_gui'}if not ab then return{status=501,message=`Alias not found: {ac}`
}end return{status=200,message=`Passed`}end end function a.at()local ab=a.cache.
at if not ab then ab={c=aa()}a.cache.at=ab end return ab.c end end do local aa=
function()return function()if not cloneref then return{status=400,message=
'Global not found'}end local aa,ab=Instance.new'Part',game:GetService'CoreGui'if
cloneref(aa)==aa then return{status=500,message=`Cloned part cannot be equal to original reference`
}elseif cloneref(ab)==ab then return{status=500,message=`Cloned service cannot be equal to original reference`
}end local ac,ad=a.b(){'clonereference'}if not ac then return{status=501,message
=`Alias not found: {ad}`}end return{status=200,message=`Passed`}end end function
a.au()local ab=a.cache.au if not ab then ab={c=aa()}a.cache.au=ab end return ab.
c end end do local aa=function()return function()if not compareinstances then
return{status=400,message='Global not found'}elseif not cloneref then return{
status=401,message="'cloneref' needed to test this reliably"}end local aa,ab=
Instance.new'Part',game:GetService'CoreGui'if cloneref(aa)==aa then return{
status=500,message=`(CR) Cloned part cannot be equal to original reference`}
elseif cloneref(ab)==ab then return{status=500,message=`(CR) Cloned service cannot be equal to original reference`
}elseif not compareinstances(game,game)then return{status=500,message=`Two equal instances (game, game) assumed unequal`
}elseif compareinstances(game,workspace)then return{status=500,message=`Two unequal instances (game, workspace) assumed equal`
}elseif not compareinstances(aa,cloneref(aa))then return{status=500,message=`Two equal instances (originalPart, clonedPart) assumed equal`
}elseif not compareinstances(ab,cloneref(ab))then return{status=500,message=`Two equal instances (originalService, clonedService) assumed equal`
}end local ac,ad=a.b(){}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.av()local ab=a.
cache.av if not ab then ab={c=aa()}a.cache.av=ab end return ab.c end end do
local aa=function()return function()if not getinstances then return{status=400,
message='Global not found'}end local aa,ab,ac,ad=Instance.new'Part',false,
Instance.new('Part',workspace),false ac.Anchored=true ac.Transparency=1 ac.
CanCollide=false ac.Position=Vector3.new(0,-100,0)for ae,af in pairs(
getinstances())do if af==aa then ab=true elseif af==ac then ad=true elseif not
af:IsA'Instance'then return{status=500,message=
"Found a part that isn't an instance"}end end if not ab then return{status=500,
message="Didn't find a part w/ a nil parent"}elseif not ad then return{status=
500,message="Didn't find a part w/ a parent"}end local ae,af=a.b(){}if not ae
then return{status=501,message=`Alias not found: {af}`}end return{status=200,
message=`Passed`}end end function a.aw()local ab=a.cache.aw if not ab then ab={c
=aa()}a.cache.aw=ab end return ab.c end end do local aa=function()return
function()if not getnilinstances then return{status=400,message=
'Global not found'}end local aa,ab,ac,ad,ae=Instance.new'Part',false,Instance.
new('Part',workspace),false,false ac.Anchored=true ac.Transparency=1 ac.
CanCollide=false ac.Position=Vector3.new(0,-100,0)for af,ag in pairs(
getnilinstances())do if ag==aa then ab=true elseif ag==ac then ad=true elseif ag
:IsDescendantOf(game)then ae=true elseif not ag:IsA'Instance'then return{status=
500,message="Found a part that isn't an instance"}end end if not ab then return{
status=500,message="Didn't find a part w/ a nil parent"}elseif ad or ae then
return{status=500,message='Found a part w/ a parent'}end local af,ag=a.b(){}if
not af then return{status=501,message=`Alias not found: {ag}`}end return{status=
200,message=`Passed`}end end function a.ax()local ab=a.cache.ax if not ab then
ab={c=aa()}a.cache.ax=ab end return ab.c end end do local aa=function()return
function()if not getinstances then return{status=400,message='Global not found'}
end local aa,ab,ac,ad,ae,af=math.random(1,10),math.random(1,10),math.random(1,10
),Instance.new'BindableFunction',Instance.new'BindableFunction',Instance.new
'RemoteFunction'ad.OnInvoke=function(ag,ah)return(ag+ah)^ac end af.
OnServerInvoke=function()return ac end local ag,ah,ai=getcallbackvalue(ad,
'OnInvoke'),getcallbackvalue(ae,'OnInvoke'),getcallbackvalue(af,'OnServerInvoke'
)if not ag then return{status=500,message=
"Didn't return a callback value for a bindable"}elseif ah then return{status=500
,message='Returned a callback value for a bindable with none'}elseif not ai then
return{status=500,message='Returned a callback value for a remote with none'}
elseif ag(aa,ab)~=(aa+ab)^ac then return{status=500,message=
"Bindable's callback value didn't return the expected value"}elseif ai(game.
Players.LocalPlayer)~=ac then return{status=500,message=
"Remote's callback value didn't return the expected value"}end local aj,ak=a.b()
{'getcallbackmember'}if not aj then return{status=501,message=`Alias not found: {
ak}`}end return{status=200,message=`Passed`}end end function a.ay()local ab=a.
cache.ay if not ab then ab={c=aa()}a.cache.ay=ab end return ab.c end end do
local aa=function()return function()if not fireclickdetector then return{status=
400,message='Global not found'}end local aa=Instance.new('Part',workspace)local
ab=Instance.new('ClickDetector',aa)aa.Anchored=true aa.Transparency=1 aa.
CanCollide=false aa.Position=Vector3.new(0,-100,0)local ac=function(ac)ab[ac]:
Connect(function(ad)if ad~=game:GetService'Players'.LocalPlayer then return{
status=500,message="Player passed wasn't the LocalPlayer"}end end)local ad,ae=
fireclickdetector(ab,0,ac)if not ad then return{status=0,message=`Failed w/ error: {
ae}`}end return true end local ad,ae,af,ag=ac'MouseClick',ac'RightMouseClick',ac
'MouseHoverEnter',ac'MouseHoverLeave'game:GetService'RunService'.PostSimulation:
Wait()if not ad then return{status=500,message='MouseClick event was not fired.'
}end if not ae then return{status=500,message=
'RightMouseClick event was not fired.'}end if not af then return{status=500,
message='MouseHoverEnter event was not fired.'}end if not ag then return{status=
500,message='MouseHoverLeave event was not fired.'}end local ah,ai=a.b(){}if not
ah then return{status=501,message=`Alias not found: {ai}`}end return{status=200,
message=`Passed`}end end function a.az()local ab=a.cache.az if not ab then ab={c
=aa()}a.cache.az=ab end return ab.c end end do local aa=function()return
function()if not fireproximityprompt then return{status=400,message=
'Global not found'}end local aa,ab,ac,ad=false,game:GetService'Players'.
LocalPlayer,game:GetService'ProximityPromptService',Instance.new('Part',
workspace)local ae=Instance.new('ProximityPrompt',ad)ad.Anchored=true ad.
Transparency=1 ad.CanCollide=false ad.Position=Vector3.new(0,-100,0)ae.
HoldDuration=1 ac.PromptButtonHoldBegan:Connect(function(af)return{status=500,
message='Proximity prompt was manually fired'}end)ac.PromptButtonHoldEnded:
Connect(function(af)return{status=500,message=
'Proximity prompt was manually fired'}end)ae:GetPropertyChangedSignal
'HoldDuration':Connect(function()return{status=500,message=
'Modified HoldDuration'}end)ae.Triggered:Connect(function(af)if af~=ab then
return{status=500,message="Player passed wasn't the LocalPlayer"}end aa=true end
)local af,ag=pcall(fireproximityprompt,ae)game:GetService'RunService'.
PostSimulation:Wait()if not af then return{status=0,message=`Failed w/ error: {
ag}`}elseif not aa then return{status=500,message=`Prompt was not triggered`}end
local ah,ai=a.b(){}if not ah then return{status=501,message=`Alias not found: {
ai}`}end return{status=200,message=`Passed`}end end function a.aA()local ab=a.
cache.aA if not ab then ab={c=aa()}a.cache.aA=ab end return ab.c end end do
local aa=function()return function()if not firetouchinterest then return{status=
400,message='Global not found'}end local aa,ab,ac,ad=game.Players.LocalPlayer.
Character.Head,false,false,Instance.new'Part'ad.Anchored=true ad.Transparency=1
ad.CanCollide=false ad.Position=Vector3.new(0,-100,0)ad.Parent=workspace ad.
Touched:Connect(function(ae)if ae~=aa then ad:Destroy()return{status=500,message
="Touch part given wasn't the passed touch part"}end ab=true end)ad.TouchEnded:
Connect(function(ae)if ae~=aa then ad:Destroy()return{status=500,message=
"Touch part given wasn't the passed touch part"}end ac=true end)
firetouchinterest(aa,ad,false)game:GetService'RunService'.PostSimulation:Wait()
if not ab then return{status=500,message="Touched event wasn't fired"}end
firetouchinterest(aa,ad,true)game:GetService'RunService'.PostSimulation:Wait()if
not ac then return{status=500,message="Touched event wasn't fired"}end ad:
Destroy()local ae,af=a.b(){}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message=`Passed`}end end function a.aB()local ab=a.
cache.aB if not ab then ab={c=aa()}a.cache.aB=ab end return ab.c end end do
local aa=function()return function()if not saveinstance then return{status=400,
message='Global not found'}elseif not listfiles then return{status=501,message=
"Dependant global 'listfiles' not found"}elseif not delfile then return{status=
501,message="Dependant global 'delfile' not found"}end local aa,ab=game:
GetService'HttpService':GenerateGUID(false):gsub('-',''),Instance.new'Part'
saveinstance(ab,{FileName=aa})task.wait(0.5)local ac=false for ad,ae in pairs(
listfiles'')do if ae:find(aa)then ac=true delfile(ae)end end if not ac then
return{status=500,message=
[[Couldn't find saved part. Args passed: (Instance, { FileName = string })]]}end
local ad,ae=a.b(){}if not ad then return{status=501,message=`Alias not found: {
ae}`}end return{status=200,message=`Passed`}end end function a.aC()local ab=a.
cache.aC if not ab then ab={c=aa()}a.cache.aC=ab end return ab.c end end do
local aa=function()return function()if not getrawmetatable then return{status=
400,message='Global not found'}end local aa=getrawmetatable(game)if typeof(aa)~=
'table'then return{status=500,message="Didn't return a table"}elseif aa.__index(
game,'Workspace')~=game:GetService'Workspace'then return{status=500,message=
"Didn't give correct index for Workspace"}elseif aa.__index(game,
'ReplicatedStorage')~=game:GetService'ReplicatedStorage'then return{status=500,
message="Didn't give correct index for ReplicatedStorage"}elseif aa.__index(game
,'Stats')~=game:GetService'Stats'then return{status=500,message=
"Didn't give correct index for Stats"}end local ab={__add='add',__sub='sub',
__mul='mul',__div='div',__mod='mod',__pow='pow',__unm='unm',__idiv='idiv',__band
='band',__bor='bor',__bxor='bxor',__bnot='bnot',__shl='shl',__shr='shr',__concat
='concat',__len='len',__eq='eq',__lt='lt',__le='le',__call='call'}for ac,ad in
pairs(ab)do if aa[ac]then return{status=500,message=`Found {ad} metamethod in the raw meta table`
}end end local ac,ad=a.b(){}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.aD()local ab=a.
cache.aD if not ab then ab={c=aa()}a.cache.aD=ab end return ab.c end end do
local aa=function()return function()if not setrawmetatable then return{status=
400,message='Global not found'}end local aa=setmetatable({},{__index=function()
return false end,__metatable='Locked'})local ab=setrawmetatable(aa,{__index=
function()return true end})if not aa then return{status=500,message=
'Original object not given'}elseif aa.MYRI~=true then return{status=500,message=
'Return function gave true, MYRI not found'}elseif not ab then return{status=500
,message='Returned object not given'}end local ac,ad=a.b(){}if not ac then
return{status=501,message=`Alias not found: {ad}`}end return{status=200,message=
'Passed'}end end function a.aE()local ab=a.cache.aE if not ab then ab={c=aa()}a.
cache.aE=ab end return ab.c end end do local aa=function()return function()if
not hookmetamethod then return{status=400,message='Global not found'}end local
aa,ab=false ab=hookmetamethod(game,'__namecall',function(...)aa=true return ab(
...)end)game:GetService'RunService'.Heartbeat:Wait()if not aa then return{status
=500,message='Failed to hook __namecall metamethod'}end local ac,ad=a.b(){}if
not ac then return{status=501,message=`Alias not found: {ad}`}end return{status=
200,message='Passed'}end end function a.aF()local ab=a.cache.aF if not ab then
ab={c=aa()}a.cache.aF=ab end return ab.c end end do local aa=function()return
function()if not getnamecallmethod then return{status=400,message=
'Global not found'}elseif not hookmetamethod then return{status=400,message=
'Global not found'}end local aa,ab,ac=Instance.new'Part',false ac=
hookmetamethod(aa,'__namecall',function(...)if not ab then ab=getnamecallmethod(
)end return ac(...)end)aa:Destroy()task.wait()if ab~='Destroy'then return{status
=500,message="Didn't return the correct method"}end local ad,ae=a.b(){}if not ad
then return{status=501,message=`Alias not found: {ae}`}end return{status=200,
message='Passed'}end end function a.aG()local ab=a.cache.aG if not ab then ab={c
=aa()}a.cache.aG=ab end return ab.c end end do local aa=function()return
function()if not setreadonly then return{status=400,message='Global not found'}
end local aa=table.freeze{MYRIAD='MYRI'}local ab=pcall(function()aa.MYRIAD=
'MYRIAD'end)local ac=pcall(function()setreadonly(aa,false)aa.MYRIAD='MYRIAD'end)
local ad,ae=pcall(function()setreadonly(aa,true)aa.MYRIAD='MYRIAD'end)if ab then
return{status=500,message='Frozen table writable (???): '..ae}elseif not ac then
return{status=500,message='Table unwritable after readonly was disabled: '..ae}
elseif ad then return{status=500,message=
'Table writable after readonly was enabled: '..ae}end local af,ag=a.b(){}if not
af then return{status=501,message=`Alias not found: {ag}`}end return{status=200,
message=`Passed`}end end function a.aH()local ab=a.cache.aH if not ab then ab={c
=aa()}a.cache.aH=ab end return ab.c end end do local aa=function()return
function()if not makereadonly then return{status=400,message='Global not found'}
end local aa=table.freeze{MYRIAD='MYRI'}local ab=pcall(function()aa.MYRIAD=
'MYRIAD'end)local ac,ad=pcall(function()makereadonly(aa)aa.MYRIAD='MYRIAD'end)if
ab then return{status=500,message='Frozen table writable (???): '..ad}elseif ac
then return{status=500,message='Table unwritable after readonly was disabled: '
..ad}end local ae,af=a.b(){}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message=`Passed`}end end function a.aI()local ab=a.
cache.aI if not ab then ab={c=aa()}a.cache.aI=ab end return ab.c end end do
local aa=function()return function()if not isreadonly then return{status=400,
message='Global not found'}end local aa={}if isreadonly(aa)then return{status=
500,message='Writable table is assumed read-only'}end table.freeze(aa)if not
isreadonly(aa)then return{status=500,message=
'Table assumed writable after being set as read-only'}end local ab,ac=a.b(){}if
not ab then return{status=501,message=`Alias not found: {ac}`}end return{status=
200,message=`Passed`}end end function a.aJ()local ab=a.cache.aJ if not ab then
ab={c=aa()}a.cache.aJ=ab end return ab.c end end do local aa=function()return
function()if not identifyexecutor then return{status=400,message=
'Global not found'}end local aa,ab=identifyexecutor()if not aa or not ab then
return{status=500,message=`Did not return expected data (executor, version)`}
elseif type(aa)~='string'or type(ab)~='string'then return{status=500,message=`Expected [string, string] got [{
aa}, {ab}]`}end local ac,ad=a.b(){'getexecutorname'}if not ac then return{status
=501,message=`Alias not found: {ad}`}end return{status=200,message=`Passed ({aa}, {
ab})`}end end function a.aK()local ab=a.cache.aK if not ab then ab={c=aa()}a.
cache.aK=ab end return ab.c end end do local aa=function()return function()if
not setfpscap then return{status=400,message='Global not found'}end local aa=
game:GetService'RunService'.RenderStepped local ab=function()aa:Wait()local ab=0
for ac=1,10 do ab+=1/aa:Wait()end return math.round(ab/10)end setfpscap(60)local
ac=ab()setfpscap(0)local ad,ae,af=ab(),a.b(){}if not ae then return{status=501,
message=`Alias not found: {af}`}end return{status=200,message=`Passed (60: {ac}, 0: {
ad})`}end end function a.aL()local ab=a.cache.aL if not ab then ab={c=aa()}a.
cache.aL=ab end return ab.c end end do local aa=function()return function()if
not getfpscap then return{status=400,message='Global not found'}end if typeof(
getfpscap())~='number'then return{status=500,message=`Did not return a number`}
end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.aM()local ab=a.
cache.aM if not ab then ab={c=aa()}a.cache.aM=ab end return ab.c end end do
local aa=function()return function()if not request then return{status=400,
message='Global not found'}end local aa=request{Url=
'https://httpbin.org/user-agent',Method='GET'}if typeof(aa)~='table'then return{
status=500,message="Reponse wasn't a table"}elseif aa.StatusCode~=200 then
return{status=500,message="Didn't give status 200 (is httpbin.org down?)"}end
local ab=game:GetService'HttpService':JSONDecode(aa.Body)if type(ab)~='table'and
type(ab['user-agent'])~='string'then return{status=500,message=
"Didn't give a table w/ user-agent string"}end local ac,ad=a.b(){'http.request',
'http_request'}if not ac then return{status=501,message=`Alias not found: {ad}`}
end return{status=200,message=`Passed ({ab['user-agent']})`}end end function a.
aN()local ab=a.cache.aN if not ab then ab={c=aa()}a.cache.aN=ab end return ab.c
end end do local aa=function()return function()local aa=a.r()if not lz4compress
then return{status=400,message='Global not found'}end local ab,ac='MYRIAD',aa.
base64decode'YE1ZUklBRA=='local ad=lz4compress(ab)if typeof(ad)~='string'then
return{status=500,message='Did not return the expected type'}elseif ad~=ac then
return{status=500,message="Compressed data doesn't match reference data"}end
local ae,af=a.b(){'crypt.lz4compress'}if not ae then return{status=501,message=`Alias not found: {
af}`}end return{status=200,message='Passed'}end end function a.aO()local ab=a.
cache.aO if not ab then ab={c=aa()}a.cache.aO=ab end return ab.c end end do
local aa=function()return function()local aa=a.r()if not lz4decompress then
return{status=400,message='Global not found'}end local ab,ac='MYRIAD',aa.
base64decode'YE1ZUklBRA=='local ad=lz4decompress(ac,#ab)if typeof(ad)~='string'
then return{status=500,message='Did not return the expected type'}elseif ad~=ab
then return{status=500,message="Compressed data doesn't match reference data"}
end local ae,af=a.b(){'crypt.lz4decompress'}if not ae then return{status=501,
message=`Alias not found: {af}`}end return{status=200,message='Passed'}end end
function a.aP()local ab=a.cache.aP if not ab then ab={c=aa()}a.cache.aP=ab end
return ab.c end end do local aa=function()return function()if not getfpscap then
return{status=400,message='Global not found'}end local aa,ab=a.b(){
'queueonteleport'}if not aa then return{status=501,message=`Alias not found: {ab
}`}end return{status=200,message=`Passed`}end end function a.aQ()local ab=a.
cache.aQ if not ab then ab={c=aa()}a.cache.aQ=ab end return ab.c end end do
local aa=function()return function()if not messagebox then return{status=400,
message='Global not found'}end local aa,ab=a.b(){}if not aa then return{status=
501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end
end function a.aR()local ab=a.cache.aR if not ab then ab={c=aa()}a.cache.aR=ab
end return ab.c end end do local aa=function()return function()if not
rconsoleprint then return{status=400,message='Global not found'}end local aa,ab=
a.b(){}if not aa then return{status=501,message=`Alias not found: {ab}`}end
return{status=200,message=`Passed`}end end function a.aS()local ab=a.cache.aS if
not ab then ab={c=aa()}a.cache.aS=ab end return ab.c end end do local aa=
function()return function()if not rconsoleinfo then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.aT()local ab=a.cache.aT if not ab then ab={c=aa()}a.cache.aT=ab end
return ab.c end end do local aa=function()return function()if not rconsolewarn
then return{status=400,message='Global not found'}end local aa,ab=a.b(){}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.aU()local ab=a.cache.aU if not ab then ab={c
=aa()}a.cache.aU=ab end return ab.c end end do local aa=function()return
function()if not rconsoleerr then return{status=400,message='Global not found'}
end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.aV()local ab=a.
cache.aV if not ab then ab={c=aa()}a.cache.aV=ab end return ab.c end end do
local aa=function()return function()if not rconsoleinput then return{status=400,
message='Global not found'}end local aa,ab=a.b(){}if not aa then return{status=
501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end
end function a.aW()local ab=a.cache.aW if not ab then ab={c=aa()}a.cache.aW=ab
end return ab.c end end do local aa=function()return function()if not
rconsoleclear then return{status=400,message='Global not found'}end local aa,ab=
a.b(){}if not aa then return{status=501,message=`Alias not found: {ab}`}end
return{status=200,message=`Passed`}end end function a.aX()local ab=a.cache.aX if
not ab then ab={c=aa()}a.cache.aX=ab end return ab.c end end do local aa=
function()return function()if not rconsolename then return{status=400,message=
'Global not found'}end local aa,ab=a.b(){}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.aY()local ab=a.cache.aY if not ab then ab={c=aa()}a.cache.aY=ab end
return ab.c end end do local aa=function()return function()if not rconsolehide
then return{status=400,message='Global not found'}end local aa,ab=a.b(){}if not
aa then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.aZ()local ab=a.cache.aZ if not ab then ab={c
=aa()}a.cache.aZ=ab end return ab.c end end do local aa=function()return
function()if not rconsoleshow then return{status=400,message='Global not found'}
end local aa,ab=a.b(){}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.a_()local ab=a.
cache.a_ if not ab then ab={c=aa()}a.cache.a_=ab end return ab.c end end do
local aa=function()return function()if not sethiddenproperty then return{status=
400,message='Global not found'}elseif not gethiddenproperty then return{status=
401,message="Dependant global 'gethiddenproperty' not found"}end local aa=
Instance.new'Part'local ab,ac=gethiddenproperty(aa,'Name')local ad,ae=
gethiddenproperty(aa,'siz')if ac then return{status=500,message=
'Non-hidden property assumed hidden'}elseif ab~='Part'then return{status=500,
message='Non-hidden property value incorrect'}elseif not ae then return{status=
500,message='Hidden property assumed non-hidden'}elseif ad~="can't get value"
then return{status=500,message='Hidden property value incorrect'}end
sethiddenproperty(aa,'siz','can get value')if not gethiddenproperty(aa,'siz')==
'can get value'then return{status=500,message=
"Hidden property's value was incorrectly set"}end local af,ag=a.b(){}if not af
then return{status=501,message=`Alias not found: {ag}`}end return{status=200,
message=`Passed`}end end function a.a0()local ab=a.cache.a0 if not ab then ab={c
=aa()}a.cache.a0=ab end return ab.c end end do local aa=function()return
function()if not gethiddenproperty then return{status=400,message=
'Global not found'}end local aa=Instance.new'Part'local ab,ac=gethiddenproperty(
aa,'Name')local ad,ae=gethiddenproperty(aa,'siz')if ac then return{status=500,
message='Non-hidden property assumed hidden'}elseif ab~='Part'then return{status
=500,message='Non-hidden property value incorrect'}elseif not ae then return{
status=500,message='Hidden property assumed non-hidden'}elseif ad~=
"can't get value"then return{status=500,message=
'Hidden property value incorrect'}end local af,ag=a.b(){}if not af then return{
status=501,message=`Alias not found: {ag}`}end return{status=200,message=`Passed`
}end end function a.a1()local ab=a.cache.a1 if not ab then ab={c=aa()}a.cache.a1
=ab end return ab.c end end do local aa=function()return function()if not
setthreadidentity then return{status=400,message='Global not found'}end local aa
,ab=a.b(){'setidentity','setthreadcontext'}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.a2()local ab=a.cache.a2 if not ab then ab={c=aa()}a.cache.a2=ab end
return ab.c end end do local aa=function()return function()if not
getthreadidentity then return{status=400,message='Global not found'}end if
typeof(getthreadidentity())~='number'then return{status=500,message=
'Did not return a number'}end local aa,ab=a.b(){'getidentity','getthreadcontext'
}if not aa then return{status=501,message=`Alias not found: {ab}`}end return{
status=200,message=`Passed`}end end function a.a3()local ab=a.cache.a3 if not ab
then ab={c=aa()}a.cache.a3=ab end return ab.c end end do local aa=function()
return function()if not setscriptable then return{status=400,message=
'Global not found'}end local aa=Instance.new'Part'if pcall(function()local ab=aa
.MaterialVariantSerialized end)then return{status=500,message=
'Unaccessible property accessible'}end setscriptable(aa,
'MaterialVariantSerialized',true)if not pcall(function()local ab=aa.
MaterialVariantSerialized end)then return{status=500,message=
[[MaterialVariantSerialized inaccessible after being set as scriptable]]}end
setscriptable(aa,'MaterialVariantSerialized',false)if pcall(function()local ab=
aa.MaterialVariantSerialized end)then return{status=500,message=
[[MaterialVariantSerialized accessible after being set as unscriptable]]}end
local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.a4()local ab=a.
cache.a4 if not ab then ab={c=aa()}a.cache.a4=ab end return ab.c end end do
local aa=function()return function()if not isscriptable then return{status=400,
message='Global not found'}end local aa=Instance.new'Part'if not isscriptable(aa
,'Name')then return{status=500,message=
"Accessible property 'Name' assumed inaccessible"}elseif isscriptable(aa,
'MaterialVariantSerialized')then return{status=500,message=
[[Inaccessible property 'MaterialVariantSerialized' assumed accessible]]}end
local ab,ac=a.b(){}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.a5()local ab=a.
cache.a5 if not ab then ab={c=aa()}a.cache.a5=ab end return ab.c end end do
local aa=function()return function()if not getscripts then return{status=400,
message='Global not found'}end local aa,ab,ac,ad=Instance.new'LocalScript',
Instance.new'ModuleScript',Instance.new'Script',Instance.new'Script'ad.
RunContext=Enum.RunContext.Client local ae=getscripts()if not table.find(ae,aa)
then return{status=500,message='LocalScript not found in returned table'}elseif
not table.find(ae,ab)then return{status=500,message=
'ModuleScript not found in returned table'}elseif not table.find(ae,ad)then
return{status=500,message=
[[ServerScript w/ client runcontext not found in returned table]]}elseif table.
find(ae,ac)then return{status=500,message='ServerScript found in returned table'
}end local af,ag=a.b(){}if not af then return{status=501,message=`Alias not found: {
ag}`}end return{status=200,message=`Passed`}end end function a.a6()local ab=a.
cache.a6 if not ab then ab={c=aa()}a.cache.a6=ab end return ab.c end end do
local aa=function()return function()if not getrunningscripts then return{status=
400,message='Global not found'}end local aa,ab,ac,ad,ae,af,ag,ah=game.Players.
LocalPlayer.Character:FindFirstChild'Animate',game.Players.LocalPlayer.Character
:FindFirstChild'whysoud',game.Players.LocalPlayer.Character:FindFirstChild
'whysodtc',game.Players.LocalPlayer.Character:FindFirstChild'maybeisdtc',
Instance.new'LocalScript',Instance.new'ModuleScript',Instance.new'Script',
Instance.new'Script'ah.RunContext=Enum.RunContext.Client local ai=
getrunningscripts()if table.find(ai,ae)then return{status=500,message=
'LocalScript found in returned table'}elseif table.find(ai,af)then return{status
=500,message='ModuleScript found in returned table'}elseif table.find(ai,ah)then
return{status=500,message=
'ServerScript w/ client runcontext found in returned table'}elseif table.find(ai
,ag)then return{status=500,message='ServerScript found in returned table'}elseif
table.find(ai,ac)then return{status=500,message=
'Disabled script found in returned table'}elseif table.find(ai,ad)then return{
status=500,message='Non-running script found in returned table'}elseif not table
.find(ai,aa)or not table.find(ai,ab)then return{status=500,message=
"Didn't find a running script in the returned table"}end local aj,ak=a.b(){}if
not aj then return{status=501,message=`Alias not found: {ak}`}end return{status=
200,message=`Passed`}end end function a.a7()local ab=a.cache.a7 if not ab then
ab={c=aa()}a.cache.a7=ab end return ab.c end end do local aa=function()return
function()if not getcallingscript then return{status=400,message=
'Global not found'}elseif not checkcaller then return{status=401,message=
"Dependency 'checkcaller' not found"}elseif not hookmetamethod then return{
status=401,message="Dependency 'hookmetamethod' not found"}end local aa aa=
hookmetamethod(game,'__index',function(ab,ac)if not checkcaller()then
getcallingscript()hookmetamethod(game,'__index',aa)end return aa(ab,ac)end)if
getcallingscript()then return{status=500,message=
'Executor call assumed to be a game call'}end local ab,ac=a.b(){}if not ab then
return{status=501,message=`Alias not found: {ac}`}end return{status=200,message=
`Passed`}end end function a.a8()local ab=a.cache.a8 if not ab then ab={c=aa()}a.
cache.a8=ab end return ab.c end end do local aa=function()return function()local
aa,ab=pcall(function()return game:GetService'StarterPlayer'.StarterPlayerScripts
.PlayerModule end)if not getloadedmodules then return{status=400,message=
'Global not found'}elseif not aa then return{status=401,message=
"Testing dependency 'PlayerModule' not found."}end local ac,ad,ae=require(ab),
Instance.new'ModuleScript',getloadedmodules()if not table.find(ae,ab)then return
{status=500,message='Loaded module not found in returned table'}elseif table.
find(ae,ad)then return{status=500,message=
'Unloaded module found in returned table'}end local af,ag=a.b(){}if not af then
return{status=501,message=`Alias not found: {ag}`}end return{status=200,message=
`Passed`}end end function a.a9()local ab=a.cache.a9 if not ab then ab={c=aa()}a.
cache.a9=ab end return ab.c end end do local aa=function()return function()local
aa,ab=pcall(function()return game.Players.LocalPlayer.Character.Animate end)if
not getloadedmodules then return{status=400,message='Global not found'}elseif
not aa then return{status=401,message="Testing dependency 'Animate' not found."}
end local ac=getsenv(ab)if not ac.onSwimming or not typeof(ac.onSwimming)==
'function'then return{status=500,message=
[[Global in test script wasn't found, or didn't return the right type]]}end
local ad,ae=a.b(){}if not ad then return{status=501,message=`Alias not found: {
ae}`}end return{status=200,message=`Passed`}end end function a.ba()local ab=a.
cache.ba if not ab then ab={c=aa()}a.cache.ba=ab end return ab.c end end do
local aa=function()return function()local aa,ab=pcall(function()return game.
Players.LocalPlayer.Character.Animate end)if not getscripthash then return{
status=400,message='Global not found'}elseif not aa then return{status=401,
message="Testing dependency 'Animate' not found."}end local ac,ad,ae=Instance.
new'LocalScript',pcall(function()return getscripthash(ab)end)local af=pcall(
function()return getscripthash(ac)end)if not ad then return{status=500,message=
"Failed to get bytecode of 'Animate': "..ae}elseif not af then return{status=500
,message=
[[Failed to get script w/ no bytecode. Errored instead of returning nil.]]}
elseif typeof(ae)~='string'then return{status=500,message=
'Did not return a hash string'}elseif hashNoBytecode~=nil then return{status=500
,message='A script with no bytecode returned non-nil data'}end local ag,ah=ab:
Clone(),ab.Source ab.Source='return 1'local ai=getscripthash(ab)if ae==ai then
return{status=500,message='Gave the same hash for a modified script'}end ab.
Source=ah local aj,ak=a.b(){}if not aj then return{status=501,message=`Alias not found: {
ak}`}end return{status=200,message=`Passed`}end end function a.bb()local ab=a.
cache.bb if not ab then ab={c=aa()}a.cache.bb=ab end return ab.c end end do
local aa=function()return function()if not loadstring then return{status=400,
message='Global not found'}end local aa=loadstring('MYRIAD','MYRIAD')loadstring
'\r\n\t\tglobalVar = {"Hello", "World"}\r\n\t'()if not globalVar or not(
globalVar[1]=='Hello'and globalVar[2]=='World')then return{status=500,message=
'Global variable insert from loadstring not found'}elseif aa~=nil then return{
status=500,message="Didn't error on incomplete expression"}end local ab,ac=a.b()
{}if not ab then return{status=501,message=`Alias not found: {ac}`}end return{
status=200,message=`Passed`}end end function a.bc()local ab=a.cache.bc if not ab
then ab={c=aa()}a.cache.bc=ab end return ab.c end end do local aa=function()
return function()a.r()if not getrunningscripts then return{status=400,message=
'Global not found'}end local aa=game.Players.LocalPlayer.Character:
FindFirstChild'whysoud'local ab,ac=getscriptbytecode(aa),{'sigma','task','wait',
[[GOT A DROP ON THIS FLEXING FELLA<MYRIAD_UD_MAX_UD_NEVER_SPEAK_TO_ME_AGAIN_KING_VON_IS_A_SAINT]]
,'tostring'}for ad,ae in pairs(ac)do if not ab:find(ae)then return{status=500,
message="Didn't find an expected segment in the bytecode"}end end local ad,ae=a.
b(){'dumpstring'}if not ad then return{status=501,message=`Alias not found: {ae}`
}end return{status=200,message=`Passed`}end end function a.bd()local ab=a.cache.
bd if not ab then ab={c=aa()}a.cache.bd=ab end return ab.c end end do local aa=
function()return function()a.r()if not getscriptclosure then return{status=400,
message='Global not found'}end local aa=game.Players.LocalPlayer.Character:
FindFirstChild'maybeisdtc'local ab=getscriptclosure(aa)if typeof(ab)~='function'
then return{status=500,message='Expected a closure'}elseif ab()~=
'GOT A DROP ON THIS FLEXING FELLA'then return{status=500,message=
'Closure did not return the expected value'}end local ac,ad=a.b(){
'getscriptfunction'}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.be()local ab=a.
cache.be if not ab then ab={c=aa()}a.cache.be=ab end return ab.c end end do
local aa=function()return function()local aa,ab=pcall(function()return game.
ReplicatedFirst.decompmeplssss end)if not decompile then return{status=400,
message='Global not found'}elseif not aa then return{status=401,message=
[[Testing dependency 'ReplicatedFirst.decompmeplssss' not found.]]}end local ac,
ad=function(ac,ad)local ae={}for af,ag in ipairs(ad)do if not ac:find(ag,1,true)
then table.insert(ae,ag)end end if#ae>0 then return false,ae end return true end
,decompile(ab)if typeof(ad)~='string'then return{status=500,message=
"Decompiled script isn't a string"}elseif#ad<=0 then return{status=500,message=
"Decompiled script didn't return anything"}end local ae,af=ac(ad,{'truthy',
'falsey','123','456','TableWeirdness','func','inline-fn','loopFn','nil-check',
'true-check','fallback','setmetatable','__index','secret','found','MethodStyle'}
)if not ae then return{status=500,message=
'Decompiled script missing expected strings: '..table.concat(af,', ')}end local
ag,ah=a.b(){}if not ag then return{status=501,message=`Alias not found: {ah}`}
end return{status=200,message='Passed'}end end function a.bf()local ab=a.cache.
bf if not ab then ab={c=aa()}a.cache.bf=ab end return ab.c end end do local aa=
function()return function()if not isparallel then return{status=400,message=
'Global not found'}elseif not run_on_actor then return{status=401,message=
"Dependency 'run_on_actor' not found"}end local aa=game.Players.LocalPlayer.
Character:FindFirstChild'PMOVON'if isparallel()then return{status=500,message=
'Non-parallel thread assumed to be in a parallel state'}end run_on_actor(aa,
'\r\n\t\tprint("MYRIAD: Ignore start -----------")\r\n\t\ttask.desynchronize()\r\n\t\tif isparallel() then\r\n\t\t\ttask.synchronize()\r\n\t\t\tprint("MYRIAD: Ignore end -----------")\r\n\t\t\tlocal originalPart = Instance.new("Part")\r\n\t\t\toriginalPart.Name = os.date("%H") .. "(1)"\r\n\t\t\toriginalPart.Parent = game.ReplicatedStorage\r\n\t\tend\r\n\t'
)task.wait(0.1)if not game.ReplicatedStorage:FindFirstChild(os.date'%H'..'(1)')
then return{status=500,message=
'Parallel thread assumed to be in a non-parallel state'}end task.wait()if
isparallel()then return{status=500,message=
'Non-parallel thread assumed to be in a parallel state'}end local ab,ac=a.b(){}
if not ab then return{status=501,message=`Alias not found: {ac}`}end return{
status=200,message=`Passed`}end end function a.bg()local ab=a.cache.bg if not ab
then ab={c=aa()}a.cache.bg=ab end return ab.c end end do local aa=function()
return function()if not run_on_actor then return{status=400,message=
'Global not found'}end local aa=game.Players.LocalPlayer.Character:
FindFirstChild'PMOVON'if not aa then return{status=500,message=
'Failed find to actor'}end run_on_actor(aa,
'local originalPart = Instance.new("Part")\r\n\t\toriginalPart.Name = os.date("%H")\r\n\t\toriginalPart.Parent = game.ReplicatedStorage\r\n\t'
)task.wait(0.1)if not game.ReplicatedStorage:FindFirstChild(os.date'%H')then
return{status=500,message='Failed to find a part created by the actor'}end game.
ReplicatedStorage:FindFirstChild(os.date'%H'):Destroy()local ab,ac=a.b(){}if not
ab then return{status=501,message=`Alias not found: {ac}`}end return{status=200,
message=`Passed`}end end function a.bh()local ab=a.cache.bh if not ab then ab={c
=aa()}a.cache.bh=ab end return ab.c end end do local aa=function()return
function()if not create_comm_channel then return{status=400,message=
'Global not found'}elseif not run_on_actor then return{status=401,message=
"Dependency 'run_on_actor' not found"}elseif not get_comm_channel then return{
status=401,message="Dependency 'get_comm_channel' not found"}end local aa,ab=0,
game.Players.LocalPlayer.Character:FindFirstChild'PMOVON'if not ab then return{
status=500,message='Failed to find actor'}end local ac,ad=create_comm_channel()
if not ad then return{status=500,message=`EventObject dosen't exist`}elseif
typeof(ac)~='number'then return{status=500,message=
"Communication ID isn't a number"}end ad.Event:Connect(function(ae)if ae~='abs'
then aa=-1 end aa=1 end)run_on_actor(ab,
"\r\n\t\tlocal channel = get_comm_channel(...)\r\n\t\tchannel:Fire('abs')\r\n\t"
,ac)task.wait(0.1)if aa==0 then return{status=500,message=
'Did not fire the event'}elseif not aa==-1 then return{status=500,message=
"Passed argument[1] wasn't the expected value"}end local ae,af=a.b(){}if not ae
then return{status=501,message=`Alias not found: {af}`}end return{status=200,
message=`Passed`}end end function a.bi()local ab=a.cache.bi if not ab then ab={c
=aa()}a.cache.bi=ab end return ab.c end end do local aa=function()return
function()if not get_comm_channel then return{status=400,message=
'Global not found'}elseif not run_on_actor then return{status=401,message=
"Dependency 'run_on_actor' not found"}elseif not create_comm_channel then return
{status=401,message="Dependency 'create_comm_channel' not found"}end local aa,ab
=0,game.Players.LocalPlayer.Character:FindFirstChild'PMOVON'if not ab then
return{status=500,message='Failed to find actor'}end local ac,ad=
create_comm_channel()if not ad then return{status=500,message=`EventObject dosen't exist`
}elseif typeof(ac)~='number'then return{status=500,message=
"Communication ID isn't a number"}end ad.Event:Connect(function(ae)if ae~='abs'
then aa=-1 end aa=1 end)run_on_actor(ab,
"\r\n\t\tlocal channel = get_comm_channel(...)\r\n\t\tchannel:Fire('abs')\r\n\t"
,ac)task.wait(0.1)if aa==0 then return{status=500,message=
'Did not fire the event'}elseif not aa==-1 then return{status=500,message=
"Passed argument[1] wasn't the expected value"}end local ae,af=a.b(){}if not ae
then return{status=501,message=`Alias not found: {af}`}end return{status=200,
message=`Passed`}end end function a.bj()local ab=a.cache.bj if not ab then ab={c
=aa()}a.cache.bj=ab end return ab.c end end do local aa=function()return
function()if not getactors then return{status=400,message='Global not found'}end
local aa,ab=false,game.Players.LocalPlayer.Character:FindFirstChild'PMOVON'for
ac,ad in pairs(getactors())do if ad==ab then aa=true end end if not aa then
return{status=500,message="Didn't find a game actor"}end local ac,ad=a.b(){}if
not ac then return{status=501,message=`Alias not found: {ad}`}end return{status=
200,message=`Passed`}end end function a.bk()local ab=a.cache.bk if not ab then
ab={c=aa()}a.cache.bk=ab end return ab.c end end do local aa=function()return
function()if not WebSocket or not WebSocket.connect then return{status=400,
message='Global not found'}end local aa=WebSocket.connect
'wss://echo.websocket.org/'if not(type(aa)=='table'or type(aa)=='userdata')then
return{status=500,message="Didn't give a table | userdata"}end for ab,ac in
pairs{OnClose={'RBXScriptSignal',{table={'Connect','Once','Wait'}}},OnMessage={
'RBXScriptSignal',{table={'Connect','Once','Wait'}}},Send='function',Close=
'function'}do local ad,ae=pcall(function()return aa[ab]end)if not ad or ae==nil
then return{status=500,message=`WebSocketObject is missing: {ab}`}end local af=
typeof(ac)=='table'and ac[1]or ac if typeof(ae)~=af then return{status=500,
message=`WebSocketObject.{ab} is not a {af} (got {typeof(ae)})`}end if typeof(ac
)=='table'and ac[2]and typeof(ac[2])=='table'then for ag,ah in pairs(ac[2])do if
ag=='table'and typeof(ae)=='table'then for ai,aj in ipairs(ah)do if typeof(ae[aj
])~='function'then return{status=500,message=`WebSocketObject.{ab}.{aj} is not a function`
}end end end end end end if result then return result end local ab,ac=a.b(){
'websocket.connect'}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.bl()local ab=a.
cache.bl if not ab then ab={c=aa()}a.cache.bl=ab end return ab.c end end do
local aa=function()return{cache={['cache.invalidate']=a.c(),['cache.iscached']=a
.d(),['cache.replace']=a.e()},Closures={islclosure=a.f(),iscclosure=a.g(),
isexecutorclosure=a.h(),newcclosure=a.i(),clonefunction=a.j(),hookfunction=a.k()
,restorefunction=a.l(),getfunctionhash=a.m(),checkcaller=a.n()},crypt={[
'crypt.encrypt']=a.s(),['crypt.decrypt']=a.t(),['crypt.generatekey']=a.u(),[
'crypt.generatebytes']=a.v(),['crypt.base64encode']=a.w(),['crypt.base64decode']
=a.x(),['crypt.hash']=a.y(),['crypt.random']=a.z(),['crypt.hmac']=a.A()},debug={
['debug.getconstant']=a.B(),['debug.getconstants']=a.C(),['debug.getproto']=a.D(
),['debug.getprotos']=a.E(),['debug.getupvalue']=a.F(),['debug.getupvalues']=a.
G(),['debug.getstack']=a.H(),['debug.setconstant']=a.I(),['debug.setupvalue']=a.
J()},Drawing={['Drawing.new']=a.K(),['Drawing.Fonts']=a.L(),getrenderproperty=a.
M(),setrenderproperty=a.N(),cleardrawcache=a.O(),isrenderobj=a.P()},Environment=
{getgenv=a.Q(),getrenv=a.R(),getgc=a.S(),filtergc=a.T()},Filesystem={
getcustomasset=a.U(),listfiles=a.V(),loadfile=a.W(),appendfile=a.X(),delfile=a.
Y(),delfolder=a.Z(),isfile=a._(),isfolder=a.aa(),writefile=a.ab(),readfile=a.ac(
),makefolder=a.ad()},Input={isrbxactive=a.ae(),keypress=a.af(),keyrelease=a.ag()
,keytap=a.ah(),mouse1click=a.ai(),mouse1press=a.aj(),mouse1release=a.ak(),
mouse2click=a.al(),mouse2press=a.am(),mouse2release=a.an(),mousemoveabs=a.ao(),
mousemoverel=a.ap(),mousescroll=a.aq(),setclipboard=a.ar(),setrbxclipboard=a.as(
)},Instances={gethui=a.at(),cloneref=a.au(),compareinstances=a.av(),getinstances
=a.aw(),getnilinstances=a.ax(),getcallbackvalue=a.ay(),fireclickdetector=a.az(),
fireproximityprompt=a.aA(),firetouchinterest=a.aB(),saveinstance=a.aC()},
Metatable={getrawmetatable=a.aD(),setrawmetatable=a.aE(),hookmetamethod=a.aF(),
getnamecallmethod=a.aG(),setreadonly=a.aH(),makereadonly=a.aI(),isreadonly=a.aJ(
)},Miscellaneous={identifyexecutor=a.aK(),setfpscap=a.aL(),getfpscap=a.aM(),
request=a.aN(),lz4compress=a.aO(),lz4decompress=a.aP(),queue_on_teleport=a.aQ()}
,External={messagebox=a.aR(),rconsoleprint=a.aS(),rconsoleinfo=a.aT(),
rconsolewarn=a.aU(),rconsoleerr=a.aV(),rconsoleinput=a.aW(),rconsoleclear=a.aX()
,rconsolename=a.aY(),rconsolehide=a.aZ(),rconsoleshow=a.a_()},Reflection={
sethiddenproperty=a.a0(),gethiddenproperty=a.a1(),setthreadidentity=a.a2(),
getthreadidentity=a.a3(),setscriptable=a.a4(),isscriptable=a.a5()},Scripts={
getscripts=a.a6(),getrunningscripts=a.a7(),getcallingscript=a.a8(),
getloadedmodules=a.a9(),getsenv=a.ba(),getscripthash=a.bb(),loadstring=a.bc(),
getscriptbytecode=a.bd(),getscriptclosure=a.be(),decompile=a.bf()},Signals={},
Actors={isparallel=a.bg(),run_on_actor=a.bh(),create_comm_channel=a.bi(),
get_comm_channel=a.bj(),getactors=a.bk()},WebSocket={connect=a.bl()}}end
function a.bm()local ab=a.cache.bm if not ab then ab={c=aa()}a.cache.bm=ab end
return ab.c end end do local aa=function()return function(aa,ab)local ac,ad,ae,
af,ag,ah,ai,aj=a.bm(),{},{},{checkpointDelay=0,statusFilter=false,stripRichtext=
false,formatDiff=false,includeMetadata=false},{bullet='\u{2022}'},{[0]=
'\u{2753}',[200]='\u{2705}',[400]='\u{1f50e}',[401]='\u{1f4e6}',[500]=
'\u{1f6e0}\u{fe0f}',[501]='\u{1f3f7}\u{fe0f}'}local ak,al=function(...)local ak=
table.concat({...},' ')aj:AppendText(ak)end,function(...)local ak=table.concat({
...},' ')aj:AppendText(`<font color="#FFA500">{ak}</font>`)end local function b(
)if ai then task.cancel(ai)end ai=task.spawn(function()local c,d,e,f=time(),0,0,
0 for g,h in ac do ad[g]=nil ae[g]={}for i in h do f+=1 ad[g]=i end end local g=
{}for h,i in ac do for j,k in i do table.insert(g,{groupName=h,name=j,test=k})
end end for h,i in ipairs(g)do local j,k,l,m=i.groupName,i.name,i.test,g[h+1]
local n,o=pcall(l)local p,q if not n then p=0 q=o e+=1 aj:SetValue(`<font color="#FFA500">{
k} failed</font>`)elseif o.status==200 then p=o.status q=o.message d+=1 aj:
SetValue(`<font color="#84FF00">{k} passed</font>`)else p=o.status q=o.message e
+=1 aj:SetValue(`<font color="#FFA500">{k} failed</font>`)end if m then ak(`Next test: {
m.name}`)end table.insert(ae[j],{name=k,status=p,message=q})if af.
checkpointDelay~=0 then task.wait(af.checkpointDelay)end end aj:Clear()for h,i
in ae do local j,k=false,false for l,m in i do if not af.statusFilter or ah[m.
status]==af.statusFilter then if not k then ak(h..':')k=true end local n=(m.
status==200)and ak or al n(`{ag.bullet} {ah[m.status]} {m.name}: {m.message}`)j=
true end end if j then ak''end end if af.stripRichtext then aj:SetValue(aj:
GetValue():gsub('<br%s*/>','\n'):gsub('<[^<>]->',''))end if af.formatDiff then
aj:SetValue(aj:GetValue():gsub('<br%s*/>','\n'):gsub('<[^<>]->',''))local h,i=aj
:GetValue(),{}for j,k in ipairs(string.split(h,'\n'))do local l=k:gsub(
'^\u{2022}%s*',''):gsub('^%s*(.-)%s*$','%1')if l~=''then if l:find'\u{2705}'then
i[j]='+ '..l elseif l:find'\u{1f50e}'or l:find'\u{2753}'or l:find
'\u{1f6e0}\u{fe0f}'or l:find'\u{1f4e6}'or l:find'\u{1f3f7}\u{fe0f}'then i[j]=
'- '..l else i[j]=l end else i[j]=''end end aj:SetValue(table.concat(i,'\n'))end
local h,i,j=math.floor((time()-c)*100+0.5)/100,identifyexecutor()ak(`Summary:`)
ak(`{ag.bullet} Took: {h}s`)ak(`{ag.bullet} Executor: {i or'Unknown'}`)ak(`{ag.
bullet} Tested: {f}`)ak(`{ag.bullet} Passed: {d}`)ak(`{ag.bullet} Failed: {e}`)
ak(`{ag.bullet} Pass Rate: {math.round(d/f*100)}%`)if af.includeMetadata then
local k,l=aj:GetValue(),string.format(
[[@metadata {
  "generated": "%s",
  "executor": "%s",
  "version": "%s",
} 

]]
,DateTime.now():ToIsoDate(),i,j)aj:SetValue(l..k)end game.ReplicatedStorage.res:
FireServer(ae,{testBuildMetadata=_P,executor=i,executorVersion=j,tested=f,passed
=d,failed=e,testTime=h,generated=DateTime.now():ToIsoDate()})end)end ab:Button{
Text='Run test',Callback=function()coroutine.wrap(b)()end}do local c=ab:TreeNode
{Title='Test options'}c:Combo{Label='Status filter',Selected='All',Items={'All',
'\u{2705} Pass','\u{2753} Ambiguous','\u{1f50e} Missing','\u{1f4e6} Dependency',
'\u{1f6e0}\u{fe0f} Functionality','\u{1f3f7}\u{fe0f} Alias'},Callback=function(d
,e)local f={All=false,['\u{2705} Pass']=ah[200],['\u{2753} Ambiguous']=ah[0],[
'\u{1f50e} Missing']=ah[400],['\u{1f4e6} Dependency']=ah[401],[
'\u{1f6e0}\u{fe0f} Functionality']=ah[500],['\u{1f3f7}\u{fe0f} Alias']=ah[501]}
af.statusFilter=f[e]end}c:SliderFloat{Label='Checkpoint delay',Default=0,Minimum
=0,Maximum=1,Format='Delay = %.2f',Callback=function(d,e)af.checkpointDelay=e
end}c:Checkbox{Value=false,Label='Include Metadata',Callback=function(d,e)af.
includeMetadata=e end}c:Checkbox{Value=false,Label='Strip Rich-text',Callback=
function(d,e)af.stripRichtext=e end}c:Checkbox{Value=false,Label=
'Format in diff',Callback=function(d,e)af.formatDiff=e end}end do local c=ab:
TreeNode{Title='Info'}c:Label{Text=
[[Test checks are in this order:
- Global check
- Dependency check 
- Functionality check 
- Alias Test
This means that if you are missing an alias, you still passed the functionality test. Aliases are important, it helps preserve old scripts, and conventions for programmers who use one over the other.]]
,TextWrapped=true}end aj=ab:Console{ReadOnly=true,RichText=true,LineHeight=1.3,
Fill=true}:Clear()return ae end end function a.bn()local ab=a.cache.bn if not ab
then ab={c=aa()}a.cache.bn=ab end return ab.c end end do local aa=function()
return function(aa,ab)local ac,ad,ae=nil,0,0 local af=function(...)local af=
table.concat({...},' ')ac:AppendText(af)end ac=ab:Console{ReadOnly=true,RichText
=true,LineHeight=1.3,Fill=true}:Clear()af'Not implemented.'return{passed=ad,
failed=ae}end end function a.bo()local ab=a.cache.bo if not ab then ab={c=aa()}a
.cache.bo=ab end return ab.c end end end local aa,ab,ac,ad=a.a(),game:GetService
'Players',game:GetService'ReplicatedStorage',game:GetService'TeleportService'
local ae,af,ag=ab.LocalPlayer,80776325854596,{Standards=a.bn(),Vulnerability=a.
bo()}if game.PlaceId~=af then local ah=aa:PopupModal{Title=
'Teleporting you to the test game...'}ah:Label{Text=
[[If teleporting dosen't work, press 'Copy' to copy the game link]],TextWrapped=
true}ah:Separator()local ai=ah:Row{Expanded=true}ai:Button{Text='Copy',Callback=
function()if setclipboard or toclipboard then(setclipboard or toclipboard)
'https://www.roblox.com/games/80776325854596'else print
[[Failed to copy link: https://www.roblox.com/games/80776325854596]]end ah:
ClosePopup()end}ai:Button{Text='Cancel',Callback=function()ah:ClosePopup()end}ad
:Teleport(af,ae)else ac:FindFirstChild'connected':FireServer()local ah=aa:
TabsWindow{Title='Myriad General Validity Test',Size=UDim2.fromOffset(400,500),
Theme='ImGui'}local ai=ah:PopupModal{Title=
'Would you like to copy our discord link?'}ai:Label{Text=
[[Get commit logs when we push changes, interact with the community, and get support for problems]]
,TextWrapped=true}ai:Separator()local aj=ai:Row{Expanded=true}aj:Button{Text=
'Yes',Callback=function()if setclipboard or toclipboard then(setclipboard or
toclipboard)'https://discord.gg/nn4NxHU3Pu'else print
'Failed to copy link: https://discord.gg/nn4NxHU3Pu'end ai:ClosePopup()end}aj:
Button{Text='No',Callback=function()ai:ClosePopup()end}do local ak=ah:CreateTab{
Name='Home'}ak:Label{RichText=true,Text=
'<b>Myriad General Validity Test (2025)</b>'}ak:Label{RichText=true,Text=`Build: <b>{
_P.cfg}</b>`}ak:Label{RichText=true,Text=`Build Version: <b>{_P.vers}</b>`}ak:
Label{RichText=true,Text=`Executor: <b>{(identifyexecutor and identifyexecutor()
or'Unknown')}</b>`}ak:Label{RichText=true,Text='\nContributors:'}ak:BulletText{
RichText=true,Rows={'biggaboy212'}}end for ak,al in ag do local b=ah:CreateTab{
Name=ak}coroutine.wrap(function()ag[ak](ak,b)end)()end end