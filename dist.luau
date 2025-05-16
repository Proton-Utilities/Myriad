--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    @repository https://github.com/Proton-Utilities/Myriad

    @author Proton-Utilities
    @name Myriad

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={Version='1.4.2',Author=
'Depso',License='MIT',Repository='https://github.com/depthso/Dear-ReGui/',Debug=
false,PrefabsId=71968920594655,DefaultTitle='ReGui',ContainerName='ReGui',
DoubleClickThreshold=0.3,TooltipOffset=15,IniToSave={'Value'},Container=nil,
Prefabs=nil,FocusedWindow=nil,ThemeConfigs={},Elements={},Signaling={},Animation
={DefaultTweenInfo=TweenInfo.new(0.08)},_FlagCache={},_ErrorCache={},Windows={},
ActiveTooltips={},IniSettings={},AnimationConnections={}}b.Icons={Dot=
'rbxasset://textures/whiteCircle.png',Arrow=
[[rbxasset://textures/DeveloperFramework/button_arrow_right.png]],Close=
'rbxasset://textures/AnimationEditor/icon_close.png',Checkmark=
'rbxasset://textures/AnimationEditor/icon_checkmark.png',Cat=
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
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}b.Accent={Light=
Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),ExtraDark=Color3.
fromRGB(28,39,53),White=Color3.fromRGB(240,240,240),Gray=Color3.fromRGB(172,171,
175),Black=Color3.fromRGB(15,19,24),Yellow=Color3.fromRGB(230,180,0),Orange=
Color3.fromRGB(230,150,0),Green=Color3.fromRGB(130,188,91),Red=Color3.fromRGB(
255,69,69),ImGui={Light=Color3.fromRGB(66,150,250),Dark=Color3.fromRGB(41,74,122
),Black=Color3.fromRGB(15,15,15),Gray=Color3.fromRGB(36,36,36)}}local c=b.
ThemeConfigs c.DarkTheme={Values={AnimationTweenInfo=TweenInfo.new(0.08),
TextFont=Font.fromName'Inconsolata',TextSize=13,Text=b.Accent.White,TextDisabled
=b.Accent.Gray,ErrorText=b.Accent.Red,FrameBg=b.Accent.Dark,FrameBgTransparency=
0.4,FrameBgActive=b.Accent.Light,FrameBgTransparencyActive=0.4,FrameRounding=
UDim.new(0,2),SliderGrab=b.Accent.Light,ButtonsBg=b.Accent.Light,
CollapsingHeaderBg=b.Accent.Light,CollapsingHeaderText=b.Accent.White,CheckMark=
b.Accent.Light,ResizeGrab=b.Accent.Light,HeaderBg=b.Accent.Gray,
HeaderBgTransparency=0.7,HistogramBar=b.Accent.Yellow,ProgressBar=b.Accent.
Yellow,RegionBg=b.Accent.Dark,RegionBgTransparency=0.1,Separator=b.Accent.Gray,
SeparatorTransparency=0.5,ConsoleLineNumbers=b.Accent.White,LabelPaddingTop=UDim
.new(0,0),LabelPaddingBottom=UDim.new(0,0),MenuBar=b.Accent.ExtraDark,
MenuBarTransparency=0.1,PopupCanvas=b.Accent.Black,TabTextPaddingTop=UDim.new(0,
3),TabTextPaddingBottom=UDim.new(0,8),TabText=b.Accent.Gray,TabBg=b.Accent.Dark,
TabTextActive=b.Accent.White,TabBgActive=b.Accent.Light,TabsBarBg=Color3.
fromRGB(36,36,36),TabsBarBgTransparency=1,TabPagePadding=UDim.new(0,8),
ModalWindowDimBg=Color3.fromRGB(230,230,230),ModalWindowDimTweenInfo=TweenInfo.
new(0.2),WindowBg=b.Accent.Black,WindowBgTransparency=0.05,Border=b.Accent.Gray,
BorderTransparency=0.8,BorderTransparencyActive=0.5,Title=b.Accent.White,
TitleAlign=Enum.TextXAlignment.Left,TitleBarBg=b.Accent.Black,
TitleBarTransparency=0,TitleActive=b.Accent.White,TitleBarBgActive=b.Accent.Dark
,TitleBarTransparencyActive=0.05,TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6}}c.LightTheme={BaseTheme=c.DarkTheme,Values={
Text=b.Accent.Black,TextFont=Font.fromName'Ubuntu',TextSize=14,FrameBg=b.Accent.
Gray,FrameBgTransparency=0.4,FrameBgActive=b.Accent.Light,
FrameBgTransparencyActive=0.6,SliderGrab=b.Accent.Light,ButtonsBg=b.Accent.Light
,CollapsingHeaderText=b.Accent.Black,Separator=b.Accent.Black,ConsoleLineNumbers
=b.Accent.Yellow,MenuBar=Color3.fromRGB(219,219,219),PopupCanvas=b.Accent.White,
TabText=b.Accent.Black,TabTextActive=b.Accent.Black,WindowBg=b.Accent.White,
Border=b.Accent.Gray,ResizeGrab=b.Accent.Gray,Title=b.Accent.Black,TitleAlign=
Enum.TextXAlignment.Center,TitleBarBg=b.Accent.Gray,TitleActive=b.Accent.Black,
TitleBarBgActive=Color3.fromRGB(186,186,186),TitleBarBgCollapsed=b.Accent.Gray}}
c.ImGui={BaseTheme=c.DarkTheme,Values={AnimationTweenInfo=TweenInfo.new(0),Text=
Color3.fromRGB(255,255,255),FrameBg=b.Accent.ImGui.Dark,FrameBgTransparency=0.4,
FrameBgActive=b.Accent.ImGui.Light,FrameBgTransparencyActive=0.5,FrameRounding=
UDim.new(0,0),ButtonsBg=b.Accent.ImGui.Light,CollapsingHeaderBg=b.Accent.ImGui.
Light,CollapsingHeaderText=b.Accent.White,CheckMark=b.Accent.ImGui.Light,
ResizeGrab=b.Accent.ImGui.Light,MenuBar=b.Accent.ImGui.Gray,MenuBarTransparency=
0,PopupCanvas=b.Accent.ImGui.Black,TabText=b.Accent.Gray,TabBg=b.Accent.ImGui.
Dark,TabTextActive=b.Accent.White,TabBgActive=b.Accent.ImGui.Light,WindowBg=b.
Accent.ImGui.Black,WindowBgTransparency=0.05,Border=b.Accent.Gray,
BorderTransparency=0.7,BorderTransparencyActive=0.4,Title=b.Accent.White,
TitleBarBg=b.Accent.ImGui.Black,TitleBarTransparency=0,TitleBarBgActive=b.Accent
.ImGui.Dark,TitleBarTransparencyActive=0}}b.ElementColors={MenuBar={
BackgroundColor3='MenuBar',BackgroundTransparency='MenuBarTransparency'},
FrameRounding={CornerRadius='FrameRounding'},PopupCanvas={BackgroundColor3=
'PopupCanvas'},ModalWindowDim={BackgroundColor3='ModalWindowDimBg'},Selectable=
'Button',MenuButton='Button',Separator={BackgroundColor3='Separator',
BackgroundTransparency='SeparatorTransparency'},Region={BackgroundColor3=
'RegionBg',BackgroundTransparency='RegionBgTransparency'},Label={TextColor3=
'Text',FontFace='TextFont',TextSize='TextSize'},ConsoleLineNumbers={TextColor3=
'ConsoleLineNumbers',FontFace='TextFont',TextSize='TextSize'},ConsoleText=
'Label',LabelDisabled={TextColor3='TextDisabled',FontFace='TextFont',TextSize=
'TextSize'},Plot={BackgroundColor3='HistogramBar'},Header={BackgroundColor3=
'HeaderBg',BackgroundTransparency='HeaderBgTransparency'},WindowTitle={
TextXAlignment='TitleAlign',FontFace='TextFont',TextSize='TextSize'},TitleBar={
BackgroundColor3='TitleBarBgActive'},Window={BackgroundColor3='WindowBg',
BackgroundTransparency='WindowBgTransparency'},TitleBarBgCollapsed={
BackgroundColor3='TitleBarBgCollapsed',BackgroundTransparency=
'TitleBarTransparencyCollapsed'},TitleBarBgActive={BackgroundColor3=
'TitleBarBgActive',BackgroundTransparency='TitleBarTransparencyActive'},
TitleBarBg={BackgroundColor3='TitleBarBg',BackgroundTransparency=
'TitleBarTransparency'},TabsBar={BackgroundColor3='TabsBarBg',
BackgroundTransparency='TabsBarBgTransparency'},Border={Color='Border',
Transparency='BorderTransparency'},ResizeGrab={TextColor3='ResizeGrab'},
BorderActive={Transparency='BorderTransparencyActive'},Frame={BackgroundColor3=
'FrameBg',BackgroundTransparency='FrameBgTransparency',TextColor3='Text',
FontFace='TextFont',TextSize='TextSize'},FrameActive={BackgroundColor3=
'FrameBgActive',BackgroundTransparency='FrameBgTransparencyActive'},SliderGrab={
BackgroundColor3='SliderGrab'},Button={BackgroundColor3='ButtonsBg',TextColor3=
'Text',FontFace='TextFont',TextSize='TextSize'},CollapsingHeader={FontFace=
'TextFont',TextSize='TextSize',TextColor3='CollapsingHeaderText',
BackgroundColor3='CollapsingHeaderBg'},Checkbox={BackgroundColor3='FrameBg'},
CheckMark={ImageColor3='CheckMark',BackgroundColor3='CheckMark'},RadioButton={
BackgroundColor3='ButtonsBg'}}b.Styles={RadioButton={Animation='RadioButtons',
CornerRadius=UDim.new(1,0)},Button={Animation='Buttons'},CollapsingHeader={
Animation='Buttons'},TreeNode={Animation='TransparentButtons'},TransparentButton
={Animation='TransparentButtons'}}b.Animations={Invisible={Connections={
MouseEnter={Visible=true},MouseLeave={Visible=false}},Init='MouseLeave'},Buttons
={Connections={MouseEnter={BackgroundTransparency=0.3},MouseLeave={
BackgroundTransparency=0.7}},Init='MouseLeave'},TextButtons={Connections={
MouseEnter={TextTransparency=0.3},MouseLeave={TextTransparency=0.7}},Init=
'MouseLeave'},TransparentButtons={Connections={MouseEnter={
BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=1}},Init=
'MouseLeave'},RadioButtons={Connections={MouseEnter={BackgroundTransparency=0.5}
,MouseLeave={BackgroundTransparency=1}},Init='MouseLeave'},Inputs={Connections={
MouseEnter={BackgroundTransparency=0},MouseLeave={BackgroundTransparency=0.5}},
Init='MouseLeave'},Plots={Connections={MouseEnter={BackgroundTransparency=0.3},
MouseLeave={BackgroundTransparency=0}},Init='MouseLeave'},Border={Connections={
Selected={Transparency=0,Thickness=1},Deselected={Transparency=0.7,Thickness=1}}
,Init='Selected'}}b.ElementFlags={{Properties={'Center'},Callback=function(d,e,f
)local g=e.Position b:SetProperties(e,{Position=UDim2.new(f:find'X'and 0.5 or g.
X.Scale,g.X.Offset,f:find'Y'and 0.5 or g.Y.Scale,g.Y.Offset),AnchorPoint=Vector2
.new(f:find'X'and 0.5 or 0,f:find'Y'and 0.5 or 0)})end},{Properties={
'ElementStyle'},Callback=function(d,e,f)b:ApplyStyle(e,f)end},{Properties={
'ColorTag'},Callback=function(d,e,f)local g,h=d.Class,d.WindowClass local i=g.
NoAutoTheme if not h then return end if i then return end b:UpdateColors{Object=
e,Tag=f,NoAnimation=true,Theme=h.Theme}end},{Properties={'Animation'},Callback=
function(d,e,f)local g=d.Class.NoAnimation if g then return end b:SetAnimation(e
,f)end},{Properties={'Icon','IconSize','IconRotation','IconPadding'},Callback=
function(d,e,f)local g=e:FindFirstChild('Icon',true)if not g then return b:Warn(
'No icon for',e)end local h=d.Class b:CheckConfig(h,{Icon='',IconSize=UDim2.
fromScale(1,1),IconRotation=0,IconPadding=UDim2.new(0,2)})local i=g.Parent:
FindFirstChild'UIPadding'b:SetPadding(i,h.IconPadding)local j=h.Icon j=b:
CheckAssetUrl(j)b:SetProperties(g,{Visible=g~='',Image=b:CheckAssetUrl(j),Size=h
.IconSize,Rotation=h.IconRotation})end},{Properties={'BorderThickness','Border',
'BorderColor'},Callback=function(d,e,f)local g,h=d.Class,d.WindowClass local i=g
.Border==true b:CheckConfig(g,{BorderTransparency=d:GetThemeKey
'BorderTransparencyActive',BorderColor=d:GetThemeKey'Border',BorderThickness=1,
BorderStrokeMode=Enum.ApplyStrokeMode.Border})local j=b:GetChildOfClass(e,
'UIStroke')b:SetProperties(j,{Transparency=g.BorderTransparency,Thickness=g.
BorderThickness,Color=g.BorderColor,ApplyStrokeMode=g.BorderStrokeMode,Enabled=i
})end},{Properties={'Ratio'},Callback=function(d,e,f)local g=d.Class b:
CheckConfig(g,{Ratio=1.3333333333333333,RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize})local h,i,j,k=g.Ratio,g.
RatioAxis,g.RatioAspectType,b:GetChildOfClass(e,'UIAspectRatioConstraint')b:
SetProperties(k,{DominantAxis=i,AspectType=j,AspectRatio=h})end},{Properties={
'FlexMode'},Callback=function(d,e,f)local g=b:GetChildOfClass(e,'UIFlexItem')g.
FlexMode=f end},{Properties={'CornerRadius'},Callback=function(d,e,f)local g=b:
GetChildOfClass(e,'UICorner')g.CornerRadius=f end},{Properties={'Fill'},Callback
=function(d,e,f)if f~=true then return end local g=d.Class b:CheckConfig(g,{Size
=UDim2.fromScale(1,1),UIFlexMode=Enum.UIFlexMode.Fill,AutomaticSize=Enum.
AutomaticSize.None})local h=b:GetChildOfClass(e,'UIFlexItem')h.FlexMode=g.
UIFlexMode e.Size=g.Size e.AutomaticSize=g.AutomaticSize end},{Properties={
'Label'},Callback=function(d,e,f)local g=e:FindFirstChild'Label'if not g then
return end local h=d.Class function h:SetLabel(i)g.Text=i return self end g.Text
=tostring(f)end},{Properties={'NoGradient'},WindowProperties={'NoGradients'},
Callback=function(d,e,f)local g=e:FindFirstChildOfClass'UIGradient'if not g then
return end g.Enabled=f end},{Properties={'UiPadding','PaddingBottom',
'PaddingTop','PaddingRight','PaddingTop'},Callback=function(d,e,f)f=f or 0 if
typeof(f)=='number'then f=UDim.new(0,f)end local g=d.Class local h=g.UiPadding
if h then b:CheckConfig(g,{PaddingBottom=f,PaddingLeft=f,PaddingRight=f,
PaddingTop=f})end local i=b:GetChildOfClass(e,'UIPadding')b:SetProperties(i,{
PaddingBottom=g.PaddingBottom,PaddingLeft=g.PaddingLeft,PaddingRight=g.
PaddingRight,PaddingTop=g.PaddingTop})end},{Properties={'Callback'},Callback=
function(d,e)local f=d.Class function f:SetCallback(g)self.Callback=g return
self end function f:FireCallback(g)self.Callback(e)return self end end},{
Properties={'Value'},Callback=function(d,e)local f=d.Class b:CheckConfig(f,{
GetValue=function(g)return f.Value end})end}}local d,e,f=function()end,
get_hidden_gui or gethui,cloneref or function(d)return d end local g,h=
setmetatable({},{__index=function(g,h)local i=game:GetService(h)return f(i)end})
,game:GetService'HttpService'local i,j,k,l,m=g.Players,g.CoreGui,g.
UserInputService,g.TweenService,g.RunService local n=i.LocalPlayer b.PlayerGui=n
.PlayerGui b.Mouse=n:GetMouse()local o=b.Animation function o:Tween(p)local q,r,
s=self.DefaultTweenInfo,p.Object,p.NoAnimation local t,u,v,w=p.Tweeninfo or q,p.
EndProperties,p.StartProperties,p.Completed if v then b:SetProperties(r,v)end if
s then b:SetProperties(r,u)if w then w()end return end local x for y,z in next,u
do local A={[y]=z}local B,C=pcall(function()return l:Create(r,t,A)end)if not B
then b:SetProperties(r,A)continue end if not x then x=C end C:Play()end if w
then if x then x.Completed:Connect(w)else w()end end return x end function o:
Animate(p)local q,r,s,t,u=p.NoAnimation,p.Objects,p.Tweeninfo,(p.Completed)for v
,w in next,r do local x=self:Tween{NoAnimation=q,Object=v,Tweeninfo=s,
EndProperties=w}if not u then u=x end end if t then u.Completed:Connect(t)end
return u end function o:HeaderCollapseToggle(p)b:CheckConfig(p,{Rotations={Open=
90,Closed=0}})local q,r,s,t,u=p.Toggle,p.NoAnimation,p.Rotations,p.Collapsed,p.
Tweeninfo local v=t and s.Closed or s.Open self:Tween{Tweeninfo=u,NoAnimation=r,
Object=q,EndProperties={Rotation=v}}end function o:HeaderCollapse(p)local q,r,s,
t,u,v,w,x,y,z,A=p.Tweeninfo,p.Collapsed,p.ClosedSize,p.OpenSize,p.Toggle,p.
Resize,p.Hide,p.NoAnimation,p.NoAutomaticSize,p.IconRotations,p.Completed if not
y then v.AutomaticSize=Enum.AutomaticSize.None end if not r then w.Visible=true
end self:HeaderCollapseToggle{Tweeninfo=q,Collapsed=r,NoAnimation=x,Toggle=u,
Rotations=z}local B=self:Tween{Tweeninfo=q,NoAnimation=x,Object=v,
StartProperties={Size=r and t or s},EndProperties={Size=r and s or t},Completed=
function()w.Visible=not r if A then A()end if r then return end if y then return
end v.Size=UDim2.fromScale(1,0)v.AutomaticSize=Enum.AutomaticSize.Y end}return B
end local p,q=b.Signaling,{}q.__index=q function q:Fire(...)local r=self:
GetConnections()if#r<=0 then return end for s,t in next,r do t(...)end end
function q:GetConnections()local r=self.Connections return r end function q:
Connect(r)local s=self:GetConnections()table.insert(s,r)end function q:
DisconnectConnections()local r=self:GetConnections()table.clear(r)end function p
:NewSignal()return NewClass(q,{Connections={}})end function GetAndRemove(r,s)
local t=s[r]if t then s[r]=nil end return t end function MoveTableItem(r,s,t)
local u=table.find(r,s)if not u then return end local v=table.remove(r,u)table.
insert(r,t,v)end function Merge(r,s)for t,u in next,s do r[t]=u end end function
Copy(r,s)local t=table.clone(r)if s then Merge(t,s)end return t end function
NewClass(r,s)s=s or{}r.__index=r return setmetatable(s,r)end function b:Warn(...
)warn('[ReGui]::',...)end function b:IsDoubleClick(r)local s=self.
DoubleClickThreshold return r<s end function b:Init(r)r=r or{}if self.
Initialised then return end Merge(self,r)Merge(self,{Initialised=true,HasGamepad
=self:IsConsoleDevice(),HasTouchScreen=self:IsMobileDevice()})self:CheckConfig(
self,{ContainerParent=function()return self:ResolveUIParent()end,Prefabs=
function()return self:LoadPrefabs()end},true)self:CheckConfig(self,{Container=
function()return self:InsertPrefab('Container',{Parent=self.ContainerParent,Name
=self.ContainerName})end},true)local s,t,u=self.Container,self.TooltipOffset,
self.ActiveTooltips local v,w=s.Overlays,0 self.TooltipsContainer=b.Elements:
Overlay{Parent=v}k.InputBegan:Connect(function(x)if not self:IsMouseEvent(x,true
)then return end local y=tick()local z=y-w local A=self:IsDoubleClick(z)w=A and
0 or y self:UpdateWindowFocuses()end)local x=function()local x,y=self.
TooltipsContainer,#u>0 x.Visible=y if not y then return end local z,A=b:
GetMouseLocation()local B=v.AbsolutePosition x.Position=UDim2.fromOffset(z-B.X+t
,A-B.Y+t)end m:BindToRenderStep('ReGui_InputUpdate',Enum.RenderPriority.Input.
Value,x)end function b:GetVersion()return self.Version end function b:
IsMobileDevice()return k.TouchEnabled end function b:IsConsoleDevice()return k.
GamepadEnabled end function b:GetScreenSize()return workspace.CurrentCamera.
ViewportSize end function b:LoadPrefabs()local r,s=self.PlayerGui,
'ReGui-Prefabs'local t=script:WaitForChild(s,2)if t then return t end local u=r:
WaitForChild(s,2)if u then return u end return nil end function b:
ResolveUIParent()local r,s=self.PlayerGui,self.Debug local t,u={[1]=function()
local t=e()if t.Parent==j then return end return t end,[2]=function()return j
end,[3]=function()return r end},self:CreateInstance'ScreenGui'for v,w in next,t
do local x,y=pcall(w)if not x or not y then continue end local z=pcall(function(
)u.Parent=y end)if not z then continue end if s then self:Warn(`Step: {v} was chosen as the parent!: {
y}`)end return y end self:Warn
'The ReGui container does not have a parent defined'return nil end function b:
CheckConfig(r,s,t,u)if not r then return end for v,w in next,s do if r[v]~=nil
then continue end if u then if table.find(u,v)then continue end end if t then w=
w()end r[v]=w end return r end function b:CheckAssetUrl(r)if tonumber(r)then
return`rbxassetid://{r}`end return r end function b:CreateInstance(r,s,t)local u
=Instance.new(r,s)if t then local v=t.UsePropertiesList if not v then self:
SetProperties(u,t)else self:ApplyFlags{Object=u,Class=t}end end return u end
function b:ConnectMouseEvent(r,s)local t,u,v,w,x=s.Callback,s.DoubleClick,s.
OnlyMouseHovering,0 if v then x=self:DetectHover(v)end r.Activated:Connect(
function(...)local y=tick()local z=y-w if x and not x.Hovering then return end
if u then if not b:IsDoubleClick(z)then w=y return end w=0 end t(...)end)end
function b:GetAnimation(r)return r and self.Animation or TweenInfo.new(0)end
function b:GetDictSize(r)local s=0 for t,u in r do s+=1 end return s end
function b:RemoveAnimations(r)local s=self:GetAnimationData(r)local t=s.
Connections for u,v in next,t do v:Disconnect()end end function b:
GetAnimationData(r)local s=self.AnimationConnections local t=s[r]if t then
return t end local u={Connections={}}s[r]=u return u end function b:
AddAnimationSignal(r,s)local t=self:GetAnimationData(r)local u=t.Connections
table.insert(u,s)end function b:SetAnimationsEnabled(r)self.NoAnimations=not r
end function b:SetAnimation(r,s,t)t=t or r local u,v=self.Animations,s if
typeof(s)~='table'then v=u[s]end assert(v,`No animation data for Class {s}!`)
self:RemoveAnimations(t)local w,x,y,z,A=v.Init,v.Connections,v.Tweeninfo,v.
NoAnimation,self:GetAnimationData(r)local B,C,D,E,F,G=A.State,true,{},{}function
E:Reset(H)if not F then return end F(H)end function E:FireSignal(H,I)D[H](I)end
function E:Refresh(H)if not G then return end D[G](H)end function E:SetEnabled(H
)C=H end for H,I in next,x do local J,K=function(J)J=J==true G=H local K=self.
NoAnimations if K then return end if not C then return end A.State=H o:Tween{
NoAnimation=J or z,Object=r,Tweeninfo=y,EndProperties=I}end,t[H]local L=K:
Connect(J)self:AddAnimationSignal(t,L)D[H]=J if H==w then F=J end end if B then
E:FireSignal(B)else E:Reset(true)end return E end function b:GetChildOfClass(r,s
)local t=r:FindFirstChildOfClass(s)if not t then t=self:CreateInstance(s,r)end
return t end function b:SetPadding(r,s)if not r then return end self:
SetProperties(r,{PaddingBottom=s,PaddingLeft=s,PaddingRight=s,PaddingTop=s})end
function b:ConnectDrag(r,s)self:CheckConfig(s,{DragStart=d,DragEnd=d,
DragMovement=d,OnDragStateChange=d})local t,u,v,w,x,y=s.DragStart,s.DragEnd,s.
DragMovement,s.OnDragStateChange,{StartAndEnd={Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch},Movement={Enum.UserInputType.MouseMovement,Enum.
UserInputType.Touch}},false local z,A,B=function(z,A)local B=z.UserInputType
return table.find(x[A],B)end,function(z)local A=z.Position return Vector2.new(A.
X,A.Y)end,function(z)self._DraggingDisabled=z y=z w(z)end local C=function(C)
local D,E,F=C.IsDragging,C.InputType,C.Callback return function(G)if C.
DraggingRequired~=y then return end if C.CheckDraggingDisabled and self.
_DraggingDisabled then return end if not z(G,E)then return end if C.UpdateState
then B(D)end local H=A(G)F(H)end end r.InputBegan:Connect(C{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=t})k.InputEnded:Connect(C{DraggingRequired
=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',Callback=u})k.
InputChanged:Connect(C{DraggingRequired=true,InputType='Movement',Callback=v})
end function b:MakeDraggable(r)local s,t,u,v,w,x=r.Move,r.Grab,r.
OnDragStateChange,{}function v:SetEnabled(y)local z=r.StateChanged self.Enabled=
y if z then z(self)end end function v:CanDrag(y)if not self.Enabled then return
end return true end local y,z,A,B,C=function(y)if not v:CanDrag()then return end
local z=r.DragBegin x=y z(x)end,function(y)if not v:CanDrag()then return end
local z,A=y-x,r.OnUpdate A(z)end,function(y)w=s.Position end,function(y)local z=
UDim2.new(w.X.Scale,w.X.Offset+y.X,w.Y.Scale,w.Y.Offset+y.Y)r:SetPosition(z)end,
function(y,z)o:Tween{Object=s,EndProperties={Position=z}}end self:CheckConfig(r,
{Enabled=true,OnUpdate=B,SetPosition=C,DragBegin=A})self:ConnectDrag(t,{
DragStart=y,DragMovement=z,OnDragStateChange=u})local D=r.Enabled v:SetEnabled(D
)return v end function b:MakeResizable(r)b:CheckConfig(r,{MinimumSize=Vector2.
new(160,90),MaximumSize=Vector2.new(math.huge,math.huge)})local s,t,u,v,w=r.
MaximumSize,r.MinimumSize,r.Resize,(r.OnUpdate)local x=b:InsertPrefab(
'ResizeGrab',{Parent=u})local y,z,A=function(y)x.Visible=y.Enabled end,function(
y)local z=w+y local A=UDim2.fromOffset(math.clamp(z.X,t.X,s.X),math.clamp(z.Y,t.
Y,s.Y))if v then v(A)return end o:Tween{Object=u,EndProperties={Size=A}}end,
function(y)w=u.AbsoluteSize end local B=self:MakeDraggable{Grab=x,OnUpdate=z,
DragBegin=A,StateChanged=y}B.Grab=x return B end function b:IsMouseEvent(r,s)
local t=r.UserInputType.Name if s and t:find'Movement'then return end return t:
find'Touch'or t:find'Mouse'end function b:DetectHover(r,s)s=s or{}local t,u,v,w,
x,y=s.OnInput,s.OnHoverChange,s.Anykey,s.MouseMove,s.MouseEnter,s.MouseOnly s.
Hovering=false local z=function(z,A,B)if z and y then if not b:IsMouseEvent(z,
true)then return end end if A~=nil then local C=s.Hovering s.Hovering=A if A~=C
and u then u(A)end end if not x and B then return end if t then local C=s.
Hovering return t(C,z)end end local A={r.MouseEnter:Connect(function()z(nil,true
,true)end),r.MouseLeave:Connect(function()z(nil,false,true)end)}if v or y then
table.insert(A,k.InputBegan:Connect(function(B)z(B)end))end if w then local B=r.
MouseMoved:Connect(function()z()end)table.insert(A,B)end function s:Disconnect()
for B,C in next,A do C:Disconnect()end end return s end function b:StackWindows(
)local r,s=self.Windows,20 for t,u in next,r do local v,w=u.WindowFrame,UDim2.
fromOffset(s*t,s*t)u:Center()v.Position+=w end end function b:GetElementFlags(r)
local s=self._FlagCache return s[r]end function b:UpdateColors(r)local s,t,u,v,w
,x,y,z,A=r.Object,r.Tag,r.NoAnimation,r.TagsList,r.Theme,r.Tweeninfo,self.
ElementColors,self.ThemeConfigs,self.Debug local B,C=self:GetElementFlags(s),y[t
]if typeof(C)=='string'then C=y[C]end if typeof(t)=='table'then C=t elseif v
then v[s]=t end if not C then return end local D={}for E,F in next,C do local G=
self:GetThemeKey(w,F)if B and B[E]then continue end if not G then if A then self
:Warn(`Color: '{F}' does not exist!`)end continue end D[E]=G end o:Tween{
Tweeninfo=x,Object=s,NoAnimation=u,EndProperties=D}end function b:
MultiUpdateColors(r)local s=r.Objects for t,u in next,s do self:UpdateColors{
TagsList=r.TagsList,Theme=r.Theme,NoAnimation=not r.Animate,Tweeninfo=r.
Tweeninfo,Object=t,Tag=u}end end function b:ApplyStyle(r,s)local t=self.Styles
local u=t[s]if not u then return end self:ApplyFlags{Object=r,Class=u}end
function b:MergeMetatables(r,s)local t,u=self.Debug,{}u.__index=function(v,w)
local x=r[w]if x~=nil then return x end local y,z=pcall(function()local y=s[w]
return self:PatchSelf(s,y)end)return y and z or nil end u.__newindex=function(v,
w,y)local z=r[w]~=nil or typeof(y)=='function'if z then r[w]=y return end
xpcall(function()s[w]=y end,function(A)if t then self:Warn(`Newindex Error: {s}.{
w} = {y}\n{A}`)end r[w]=y end)end return setmetatable({},u)end function b:Concat
(r,s)local t=''for u,v in next,r do t..=tostring(v)..(u~=#r and s or'')end
return t end function b:GetValueFromAliases(r,s)for t,u in r do local v=s[u]if v
~=nil then return v end end return nil end function b:RecursiveCall(r,s)for t,u
in next,r:GetDescendants()do s(u)end end function b:ApplyFlags(r)local s,t,u,v=
self.ElementFlags,r.Object,r.Class,r.WindowClass function r:GetThemeKey(w)if v
then return v:GetThemeKey(w)else return b:GetThemeKey(nil,w)end end self:
SetProperties(t,u)for w,y in next,s do local z,A,B,C=y.Properties,y.Callback,y.
Recursive,y.WindowProperties local D=self:GetValueFromAliases(z,u)if v and C and
D==nil then D=self:GetValueFromAliases(C,v)end if D==nil then continue end A(r,t
,D)if B then self:RecursiveCall(t,function(E)A(r,E,D)end)end end end function b:
SetProperties(r,s)for t,u in next,s do pcall(function()r[t]=u end)end end
function b:InsertPrefab(r,s)local t=self.Prefabs local u=t.Prefabs local v=u:
WaitForChild(r)local w=v:Clone()if s then local y=s.UsePropertiesList if not y
then self:SetProperties(w,s)else self:ApplyFlags{Object=w,Class=s}end end return
w end function b:GetContentSize(r,s)local t,u,v,w=r:FindFirstChildOfClass
'UIListLayout',r:FindFirstChildOfClass'UIPadding',(r:FindFirstChildOfClass
'UIStroke')if t and not s then w=t.AbsoluteContentSize else w=r.AbsoluteSize end
if u then local y,z,A,B=u.PaddingTop.Offset,u.PaddingBottom.Offset,u.PaddingLeft
.Offset,u.PaddingRight.Offset w+=Vector2.new(A+B,y+z)end if v then local y=v.
Thickness w+=Vector2.new(y/2,y/2)end return w end function b:PatchSelf(r,s)if
typeof(s)~='function'then return s end return function(t,...)return s(r,...)end
end function b:MakeCanvas(r)local s,t,u,v,w,y,z=self.Elements,self.Debug,self.
Signaling,r.Element,r.WindowClass,r.Class,r.OnChildChange local A=u:NewSignal()
if z then A:Connect(z)end if not w and t then self:Warn(`No WindowClass for {v}`
)self:Warn(r)end local B=NewClass(s,{Class=y,RawObject=v,WindowClass=w or false,
OnChildChange=A,Elements={}})local C={__index=function(C,D)local E=B[D]if E~=nil
then return self:PatchSelf(B,E)end local F=y[D]if F~=nil then return self:
PatchSelf(y,F)end local G=v[D]return self:PatchSelf(v,G)end,__newindex=function(
C,D,E)local F=y[D]~=nil if F then y[D]=E else v[D]=E end end}return
setmetatable({},C)end function b:GetIniData(r)local s,t=self.IniToSave,{}for u,v
in next,s do t[v]=r[v]end return t end function b:DumpIni(r)local s,t=self.
IniSettings,{}for u,v in next,s do t[u]=self:GetIniData(v)end if r then return h
:JSONEncode(t)end return t end function b:LoadIniIntoElement(r,s)local t={Value=
function(t)r:SetValue(t)end}for u,v in next,s do local w=t[u]if w then w(v)
continue end r[u]=v end end function b:LoadIni(r,s)local t=self.IniSettings
assert(r,'No Ini configuration was passed')if s then r=h:JSONDecode(r)end for u,
v in next,r do local w=t[u]self:LoadIniIntoElement(w,v)end end function b:
AddIniFlag(r,s)local t=self.IniSettings t[r]=s end function b:OnElementCreate(r)
local s,t,u,v,w=self._FlagCache,r.Flags,r.Object,r.Canvas,r.Class local y,z,A,B,
C,D=v.WindowClass,t.NoAutoTag,t.NoAutoFlags,t.ColorTag,t.NoStyle,t.IniFlag s[u]=
t if D then self:AddIniFlag(D,w)end if C then return end if not z and y then y:
TagElements{[u]=B}end if y then y:LoadStylesIntoElement(r)end if not A then self
:ApplyFlags{Object=u,Class=t,WindowClass=y}end end function b:WrapGeneration(r,s
)local t,u,v=self._ErrorCache,s.Base,s.IgnoreDefaults return function(w,y,...)y=
y or{}self:CheckConfig(y,u)local z=y.CloneTable if z then y=table.clone(y)end
local A,B,C=w.RawObject,w.Elements,w.OnChildChange self:CheckConfig(y,{Parent=A,
Name=y.ColorTag},nil,v)if w==self then w=self.Elements end local D,E,F=pcall(r,w
,y,...)if D==false then if A then if t[A]then return end t[A]=E end if w.Error
then w:Error{Parent=A,Text=E}end self:Warn('Class:',E)self:Warn(debug.traceback(
))end if F==nil then F=E end if C then C:Fire(E)end if F then if B then table.
insert(B,F)end self:OnElementCreate{Object=F,Flags=y,Class=E,Canvas=w}end return
E,F end end function b:DefineElement(r,s)local t,u,v=self.Elements,self.
ThemeConfigs,self.ElementColors local w,y,z,A,B,C=u.DarkTheme,s.Base,s.Create,s.
Export,s.ThemeTags,s.ColorData self:CheckConfig(y,{ColorTag=r,ElementStyle=r})if
B then Merge(w,B)end if C then Merge(v,C)end local D=self:WrapGeneration(z,s)if
A then self[r]=D end t[r]=D return D end function b:DefineGlobalFlag(r)local s=
self.ElementFlags table.insert(s,r)end function b:DefineTheme(r,s)local t=self.
ThemeConfigs self:CheckConfig(s,{BaseTheme=t.DarkTheme})local u=GetAndRemove(
'BaseTheme',s)local v={BaseTheme=u,Values=s}t[r]=v return v end function b:
GetMouseLocation()local r=self.Mouse return r.X,r.Y end function b:
SetWindowFocusesEnabled(r)self.WindowFocusesEnabled=r end function b:
UpdateWindowFocuses()local r,s=self.Windows,self.WindowFocusesEnabled if not s
then return end for t,u in r do local v=u.HoverConnection if not v then continue
end local w=v.Hovering if w then self:SetFocusedWindow(u)return end end self:
SetFocusedWindow(nil)end function b:WindowCanFocus(r)if r.NoSelect then return
false end if r.Collapsed then return false end if r._SelectDisabled then return
false end return true end function b:GetFocusedWindow()return self.FocusedWindow
end function b:BringWindowToFront(r)local s,t=self.Windows,r.
NoBringToFrontOnFocus if t then return end MoveTableItem(s,r,1)end function b:
SetFocusedWindow(r)local s,t=self:GetFocusedWindow(),self.Windows if s==r then
return end self.FocusedWindow=r if r then local u=self:WindowCanFocus(r)if not u
then return end self:BringWindowToFront(r)end local u=#t for v,w in t do local y
,z=self:WindowCanFocus(w),w.WindowFrame if not y then continue end u-=1 if u
then z.ZIndex=u end local A=w==r w:SetFocused(A,u)end end function b:
SetItemTooltip(r,s)local t,u,v=self.Elements,self.TooltipsContainer,self.
ActiveTooltips local w,y=u:Canvas{Visible=false,UiPadding=UDim.new()}task.spawn(
s,w)b:DetectHover(r,{MouseMove=true,MouseEnter=true,OnHoverChange=function(z)if
z then table.insert(v,w)return end local A=table.find(v,w)table.remove(v,A)end,
OnInput=function(z,A)y.Visible=z end})end function b:CheckFlags(r,s)for t,u in
next,r do local v=s[t]if not v then continue end u(v)end end function b:
GetThemeKey(r,s)local t=self.ThemeConfigs if typeof(r)=='string'then r=t[r]end
local u=t.DarkTheme r=r or u local v,w=r.BaseTheme,r.Values local y=w[s]if y
then return y end if v then return self:GetThemeKey(v,s)end end function b:
SelectionGroup(r)local s,t,v=false,function(s,t)for v,w in next,r do if typeof(w
)=='Instance'then continue end if w==t then continue end s(w)end end local w=
function(w)if s then return end s=true local y=v v=w:GetValue()if not y then y=v
end t(function(z)z:SetValue(y)end,w)s=false end t(function(y)y.Callback=w end)
end local r=b.Elements r.__index=r function r:GetObject()return self.RawObject
end function r:Remove()local s,t,v=self.OnChildChange,self:GetObject(),self.
Class local w=v.Remove if w then return w(v)end if s then s:Fire(v or self)end
if v then table.clear(v)end t:Destroy()table.clear(self)end function r:
GetChildElements()local s=self.Elements return s end function r:
ClearChildElements()local s=self:GetChildElements()for t,v in next,s do v:
Destroy()end end function r:TagElements(s)local t,v=self.WindowClass,b.Debug if
not t then if v then b:Warn('No WindowClass for TagElements:',s)end return end t
:TagElements(s)end function r:GetThemeKey(s)local t=self.WindowClass if t then
return t:GetThemeKey(s)end return b:GetThemeKey(nil,s)end function r:
SetColorTags(s,t)local v=self.WindowClass if not v then return end local w,y=v.
TagsList,v.Theme b:MultiUpdateColors{Animate=t,Theme=y,TagsList=w,Objects=s}end
function r:SetElementFocused(s,t)local v,w,y,z=self.WindowClass,b.HasTouchScreen
,t.Focused,t.Animation b:SetAnimationsEnabled(not y)if not y and z then z:
Refresh()end if not v then return end if not w then return end local A=v.
ContentCanvas A.Interactable=not y end b:DefineElement('Dropdown',{Base={
ColorTag='PopupCanvas',Disabled=false,AutoClose=true,OnSelected=d},Create=
function(s,t)t.Parent=b.Container.Overlays local v,w,y,z,A=t.Selected,t.Items,t.
OnSelected,s:PopupCanvas(t)local B,C,D=b:MergeMetatables(t,z),{},function(B)y(B)
end function t:ClearEntries()for E,F in C do F:Remove()end end function t:
SetItems(E,F)local G=E[1]self:ClearEntries()for H,I in E do local J,K=G and I or
H,H==F or I==F local L=z:Selectable{Text=tostring(J),Selected=K,ZIndex=6,
Callback=function()return D(J)end}table.insert(C,L)end end if w then t:SetItems(
w,v)end return B,A end})b:DefineElement('OverlayScroll',{Base={ElementClass=
'OverlayScroll',Spacing=UDim.new(0,4)},Create=function(s,t)local v,w,y=s.
WindowClass,t.ElementClass,t.Spacing local z=b:InsertPrefab(w,t)local A,B=z:
FindFirstChild'ContentFrame'or z,z:FindFirstChild('UIListLayout',true)B.Padding=
y local C=b:MergeMetatables(s,t)local D=b:MakeCanvas{Element=A,WindowClass=v,
Class=C}function t:GetCanvasSize()return A.AbsoluteCanvasSize end return D,z end
})b:DefineElement('Overlay',{Base={ElementClass='Overlay'},Create=r.
OverlayScroll})b:DefineElement('Image',{Base={Image='',Callback=d},Create=
function(s,t)local v=t.Image t.Image=b:CheckAssetUrl(v)local w=b:InsertPrefab(
'Image',t)w.Activated:Connect(function(...)local y=t.Callback return y(w,...)end
)return w end})b:DefineElement('VideoPlayer',{Base={Video='',Callback=d},Create=
function(s,t)local v=t.Video t.Video=b:CheckAssetUrl(v)local w=b:InsertPrefab(
'VideoPlayer',t)return w end})b:DefineElement('Button',{Base={Text='Button',
DoubleClick=false,Callback=d},Create=function(s,t)local v,w=b:InsertPrefab(
'Button',t),t.DoubleClick b:ConnectMouseEvent(v,{DoubleClick=w,Callback=function
(...)local y=t.Callback return y(v,...)end})return v end})b:DefineElement(
'Selectable',{Base={Text='Selectable',Callback=d,Selected=false,Disabled=false,
Size=UDim2.fromScale(1,0),AutomaticSize=Enum.AutomaticSize.Y,TextXAlignment=Enum
.TextXAlignment.Left,AnimationTags={Selected='Buttons',Unselected=
'TransparentButtons'}},Create=function(s,t)local v,w,y,z=s.Class.AfterClick,t.
Selected,t.Disabled,b:InsertPrefab('Button',t)local A=b:MergeMetatables(t,z)z.
Activated:Connect(function(...)local B=t.Callback B(z,...)if v then v(z,...)end
end)function t:SetSelected(B)local C=self.AnimationTags local D=B and C.Selected
or C.Unselected self.Selected=B b:SetAnimation(z,D)end function t:SetDisabled(B)
self.Disabled=B z.Interactable=not B end t:SetSelected(w)t:SetDisabled(y)return
A,z end})b:DefineElement('ImageButton',{Base={ElementStyle='Button',Callback=d},
Create=r.Image})b:DefineElement('SmallButton',{Base={Text='Button',PaddingTop=
UDim.new(),PaddingBottom=UDim.new(),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.
new(0,2),ColorTag='Button',ElementStyle='Button',Callback=d},Create=r.Button})b:
DefineElement('Keybind',{Base={Label='Keybind',ColorTag='Frame',Value=nil,
DeleteKey=Enum.KeyCode.Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=
false,Callback=d,OnKeybindSet=d,OnBlacklistedKeybindSet=d,KeyBlacklist={},
UiPadding=UDim.new(),AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.3,0,
0,19)},Create=function(s,t)local v,w,y,z,A=t.Value,t.Label,t.Disabled,t.
KeyBlacklist,b:InsertPrefab('Button',t)local B,C,D,E=b:MergeMetatables(t,A),s:
Label{Parent=A,Text=w,Position=UDim2.new(1,4,0.5),AnchorPoint=Vector2.new(0,0.5)
},function(B,...)return B(A,...)end,function(B)local C=table.find(z,B)return C
end function t:SetDisabled(F)self.Disabled=F A.Interactable=not F s:
SetColorTags({[C]=F and'LabelDisabled'or'Label'},true)end function t:SetValue(F)
local G,H=self.OnKeybindSet,self.DeleteKey if F==H then F=nil end self.Value=F A
.Text=F and F.Name or'Not set'D(G,F)end function t:WaitForNewKey()self.
_WaitingForNewKey=true A.Text='...'A.Interactable=false end local F=function(F)
local G,H=F.KeyCode,F.UserInputType if H~=Enum.UserInputType.Keyboard then
return H end return G end local G=function(G)local H,I,J=t.
OnBlacklistedKeybindSet,t.Value,F(G)if not k.WindowFocused then return end if E(
J)then D(H,J)return end A.Interactable=true t._WaitingForNewKey=false if J.Name
=='Unknown'then return t:SetValue(I)end t:SetValue(J)end local H=function(H,I)
local J,K,L,M,N,O=t.IgnoreGameProcessed,t.DeleteKey,t.Enabled,t.Value,t.Callback
,F(H)if t._WaitingForNewKey then G(H)return end if not L and A.Interactable then
return end if not J and I then return end if not M then return end if O==K then
return end if O.Name~=M.Name then return end D(N,O)end t:SetValue(v)t:
SetDisabled(y)t.Connection=k.InputBegan:Connect(H)A.Activated:Connect(function()
t:WaitForNewKey()end)b:SetAnimation(A,'Inputs')return B,A end})b:DefineElement(
'ArrowButton',{Base={Direction='Left',ColorTag='Button',Icon=b.Icons.Arrow,Size=
UDim2.fromOffset(21,21),IconSize=UDim2.fromScale(1,1),IconPadding=UDim.new(0,4),
Rotations={Left=180,Right=0}},Create=function(s,t)local v,w=t.Direction,t.
Rotations local y=w[v]t.IconRotation=y local z=b:InsertPrefab('ArrowButton',t)z.
Activated:Connect(function(...)local A=t.Callback return A(z,...)end)return z
end})b:DefineElement('Label',{Base={Font='Inconsolata'},ColorData={LabelPadding=
{PaddingTop='LabelPaddingTop',PaddingBottom='LabelPaddingBottom'}},Create=
function(s,t)local v,w,y,z,A,B,C,D=t.Bold,t.Italic,t.Font,t.FontFace,Enum.
FontWeight.Medium,Enum.FontWeight.Bold,Enum.FontStyle.Normal,Enum.FontStyle.
Italic local E,F,G=v and B or A,w and D or C,v or w if not z and G then t.
FontFace=Font.fromName(y,E,F)end local H=b:InsertPrefab('Label',t)local I=H:
FindFirstChildOfClass'UIPadding's:TagElements{[I]='LabelPadding'}return H end})b
:DefineElement('Error',{Base={RichText=true,TextWrapped=true},ColorData={Error={
TextColor3='ErrorText',FontFace='TextFont'}},Create=function(s,t)local v=t.Text
t.Text=`<b>\u{26d4} Error:</b> {v}`return s:Label(t)end})local s={Engaged=false}
s.__index=s function s:SetEngaged(t)local v,w=self.Object,self.WindowClass self.
Engaged=t if w then w:SetCanvasInteractable(not t)end end function s:IsHovering(
)local t=false self:Foreach(function(v)t=v.Popup:IsMouseHovering()return t end)
return t end function s:Foreach(t)local v=self.Menus for w,y in next,v do local
z=t(y)if z then break end end end function s:SetFocusedMenu(t)self:Foreach(
function(v)local w=v==t v:SetActiveState(w)end)end function s:Close()self:
SetEngaged(false)self:SetFocusedMenu(nil)end function s:MenuItem(t)local v,w=
self.Canvas,self.Menus local y=v:MenuButton(t)local z=v:PopupCanvas{RelativeTo=y
,MaxSizeX=210,Visible=false,AutoClose=false,AfterClick=function()self:Close()end
}local A={Popup=z,Button=y}b:DetectHover(y,{MouseEnter=true,OnInput=function()if
not self.Engaged then return end self:SetFocusedMenu(A)end})function A:
SetActiveState(B)z:SetPopupVisible(B)y:SetSelected(B)end y.Activated:Connect(
function()self:SetFocusedMenu(A)self:SetEngaged(true)end)table.insert(w,A)return
z,A end b:DefineElement('MenuBar',{Base={},Create=function(t,v)local w,y=t.
WindowClass,b:InsertPrefab('MenuBar',v)local z=b:MakeCanvas{Element=y,
WindowClass=w,Class=v}local A=NewClass(s,{WindowClass=w,Canvas=z,Object=y,Menus=
{}})Merge(A,v)b:DetectHover(y,{MouseOnly=true,OnInput=function()if not A.Engaged
then return end if A:IsHovering()then return end A:Close()end})local B=b:
MergeMetatables(A,z)return B,y end})b:DefineElement('MenuButton',{Base={Text=
'MenuButton',PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),Size=UDim2.
fromOffset(0,19),AutomaticSize=Enum.AutomaticSize.XY},Create=r.Selectable})local
t={ColorTags={BGSelected={[true]='SelectedTab',[false]='DeselectedTab'},
LabelSelected={[true]='SelectedTabLabel',[false]='DeselectedTabLabel'}}}function
t:SetButtonSelected(v,w)if v.IsSelected==w then return end v.IsSelected=w local
y,z,A=self.NoAnimation,self.WindowClass,self.ColorTags local B,C,D,E,F=z.Theme,z
.TagsList,A.BGSelected,A.LabelSelected,v.TabButton local G=F.Button local H=G.
Label b:MultiUpdateColors{Animate=not y,Theme=B,TagsList=C,Objects={[G]=D[w],[H]
=E[w]}}end function t:CompareTabs(v,w)if not v then return false end return v.
MatchBy==w or v==w end function t:ForEachTab(v,w)local y,z=typeof(v)=='string',
self.Tabs for A,B in z do local C,D=B.Name,false if y then D=C==v else D=self:
CompareTabs(B,v)end w(B,D,A)end end function t:RemoveTab(v)local w,y=self.
OnTabRemove,self.Tabs self:ForEachTab(v,function(z,A,B)if not A then return end
local C,D=z.TabButton,z.OnClosure table.remove(y,B)C:Destroy()w(self,z)D(z)end)
return self end function t:CreateTab(v)v=v or{}b:CheckConfig(v,{Name='Tab',
AutoSize='Y',Focused=false,OnClosure=d})local w,y,z,A,B,C,D,E,F=self.
AutoSelectNewTabs,self.WindowClass,self.ParentCanvas,self.Tabs,self.TabsFrame,
self.OnTabCreate,v.Focused,v.Name,v.Icon local G,H=D or#A<=0 and w,b:
InsertPrefab('TabButton',v)H.Parent=B local I=H.Button local J,K=I:
FindFirstChildOfClass'UIPadding',I.Label K.Text=tostring(E)Merge(v,{TabButton=H}
)local L,M=function()self:SetActiveTab(v)end,{Closeable=function()local L=z:
RadioButton{Parent=I,Visible=not self.NoClose,Icon=b.Icons.Close,IconSize=UDim2.
fromOffset(11,11),LayoutOrder=3,ZIndex=2,UsePropertiesList=true,Callback=
function()self:RemoveTab(v)end}local M=L.Icon b:SetAnimation(M,{Connections={
MouseEnter={ImageTransparency=0},MouseLeave={ImageTransparency=1}},Init=
'MouseLeave'},H)end}I.Activated:Connect(L)b:CheckFlags(M,v)table.insert(A,v)if y
then y:TagElements{[J]='TabPadding'}end b:SetAnimation(I,'Buttons')self:
SetButtonSelected(v,G)b:ApplyFlags{Object=H,Class=v}local N=C(self,v)if G then
self:SetActiveTab(v)end return N or v end function t:SetActiveTab(v)local w,y,z,
A,B=self.Tabs,self.NoAnimation,self.ActiveTab,self.OnActiveTabChange,typeof(v)==
'string'self:ForEachTab(v,function(C,D,E)if D then MatchedTab=C end self:
SetButtonSelected(C,D)end)if not MatchedTab then return self end if self:
CompareTabs(MatchedTab,z)then return self end self.ActiveTab=MatchedTab A(self,
MatchedTab,z)return self end b:DefineElement('TabBar',{Base={AutoSelectNewTabs=
true,OnActiveTabChange=d,OnTabCreate=d,OnTabRemove=d},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabsBarSeparator={
BackgroundColor3='TabBgActive'},TabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabPagePadding={PaddingBottom=
'TabPagePadding',PaddingLeft='TabPagePadding',PaddingRight='TabPagePadding',
PaddingTop='TabPagePadding'}},Create=function(v,w)local y,z,A=v.WindowClass,b:
InsertPrefab('TabsBar',w),NewClass(t)local B,C=z.Separator,z.TabsFrame local D=b
:MakeCanvas{Element=C,WindowClass=y,Class=A}Merge(A,w)Merge(A,{ParentCanvas=v,
Object=z,TabsFrame=C,WindowClass=y,Tabs={}})v:TagElements{[z]='TabsBar',[B]=
'TabsBarSeparator'}local E=b:MergeMetatables(D,z)return E,z end})b:
DefineElement('TabSelector',{Base={NoTabsBar=false,OnActiveTabChange=d,
OnTabCreate=d,OnTabRemove=d},Create=function(v,w)local y,z,A,B=v.WindowClass,w.
NoTabsBar,w.NoAnimation,b:InsertPrefab('TabSelector',w)local C=B.Body local D=C.
PageTemplate D.Visible=false local E,F=function(E,F,...)local G,H,I=F.AutoSize,F
.Name,D:Clone()local J=b:GetChildOfClass(I,'UIPadding')b:SetProperties(I,{Parent
=C,Name=H,AutomaticSize=Enum.AutomaticSize[G],Size=UDim2.fromScale(G=='Y'and 1
or 0,G=='X'and 1 or 0)})v:TagElements{[J]='TabPagePadding'}local K=b:MakeCanvas{
Element=I,WindowClass=y,Class=F}w.OnTabCreate(E,F,...)Merge(F,{Page=I,MatchBy=K}
)return K end,function(E,F,...)E:ForEachTab(F,function(G,H,I)local J=G.Page J.
Visible=H if not H then return end local K=v:GetThemeKey'AnimationTweenInfo'o:
Tween{Object=J,Tweeninfo=K,NoAnimation=A,StartProperties={Position=UDim2.
fromOffset(0,4)},EndProperties={Position=UDim2.fromOffset(0,0)}}end)w.
OnActiveTabChange(E,F,...)end local G=v:TabBar{Parent=B,Visible=not z,
OnTabCreate=E,OnActiveTabChange=F,OnTabRemove=function(G,H,...)H.Page:Remove()w.
OnTabRemove(...)end}local H=b:MergeMetatables(G,B)return H,B end})b:
DefineElement('RadioButton',{Base={Callback=d},Create=function(v,w)local y=b:
InsertPrefab('RadioButton',w)y.Activated:Connect(function(...)local z=w.Callback
return z(y,...)end)return y end})b:DefineElement('Checkbox',{Base={Label=
'Checkbox',IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.
fromScale(1,1),UntickedImageSize=UDim2.fromScale(0,0),Callback=d,Disabled=false}
,Create=function(v,w)local y,z,A,B,C,D,E=w.IsRadio,w.Value,w.Label,w.
TickedImageSize,w.UntickedImageSize,w.Disabled,b:InsertPrefab('CheckBox',w)local
F,G=b:MergeMetatables(w,E),E.Tickbox local H=G.Tick H.Image=b.Icons.Checkmark
local I,J,K,L=G:FindFirstChildOfClass'UIPadding',b:GetChildOfClass(G,'UICorner')
,v:Label{Text=A,Parent=E,LayoutOrder=2},UDim.new(0,3)if y then H.
ImageTransparency=1 H.BackgroundTransparency=0 J.CornerRadius=UDim.new(1,0)else
L=UDim.new(0,2)end b:SetProperties(I,{PaddingBottom=L,PaddingLeft=L,PaddingRight
=L,PaddingTop=L})local M,N=function(...)local M=w.Callback return M(F,...)end,
function(M,N)local O,P=v:GetThemeKey'AnimationTweenInfo',M and B or C o:Tween{
Object=H,Tweeninfo=O,NoAnimation=N,EndProperties={Size=P}}end function w:
SetDisabled(O)self.Disabled=O E.Interactable=not O v:SetColorTags({[K]=O and
'LabelDisabled'or'Label'},true)end function w:SetValue(O,P)self.Value=O N(O,P)M(
O)return self end function w:SetTicked(...)b:Warn
'Checkbox:SetTicked is deprecated, please use :SetValue'return self:SetValue(...
)end function w:Toggle()local O=not self.Value self.Value=O self:SetValue(O)
return self end local O=function()w:Toggle()end E.Activated:Connect(O)G.
Activated:Connect(O)w:SetValue(z,true)w:SetDisabled(D)b:SetAnimation(G,'Buttons'
,E)v:TagElements{[H]='CheckMark',[G]='Checkbox'}return F,E end})b:DefineElement(
'Radiobox',{Base={IsRadio=true,CornerRadius=UDim.new(1,0)},Create=r.Checkbox})b:
DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label='Histogram'},Create=
function(v,w)local y,z,A=w.Label,w.Points,b:InsertPrefab('Histogram',w)local B,C
=b:MergeMetatables(w,A),A.Canvas local D=C.PointTemplate D.Visible=false v:Label
{Text=y,Parent=A,Position=UDim2.new(1,4)}b:SetItemTooltip(A,function(E)
ValueLabel=E:Label()end)Merge(w,{_Plots={},_Cache={}})function w:GetBaseValues()
local E,F=self.Minimum,self.Maximum if E and F then return E,F end local G=self.
_Plots for H,I in G do local J=I.Value if not E or J<E then E=J end if not F or
J>F then F=J end end return E,F end function w:UpdateGraph()local E,F,G=self.
_Plots,self:GetBaseValues()if not F or not G then return end local H=G-F for I,J
in E do local K,L=J.Point,J.Value local M=(L-F)/H M=math.clamp(M,0.05,1)K.Size=
UDim2.fromScale(1,M)end return self end function w:Plot(E)local F,G,H=self.
_Plots,{},D:Clone()local I=H.Bar b:SetProperties(H,{Parent=C,Visible=true})local
J,K=b:DetectHover(H,{MouseEnter=true,OnInput=function()G:UpdateTooltip()end}),{
Object=H,Point=I,Value=E}function G:UpdateTooltip()local L=G:GetPointIndex()
ValueLabel.Text=`{L}:\t{K.Value}`end function G:SetValue(L)K.Value=L w:
UpdateGraph()if J.Hovering then self:UpdateTooltip()end end function G:
GetPointIndex()return table.find(F,K)end function G:Remove(L)table.remove(F,self
:GetPointIndex())H:Remove()w:UpdateGraph()end table.insert(F,K)self:UpdateGraph(
)b:SetAnimation(I,'Plots',H)v:TagElements{[I]='Plot'}return G end function w:
PlotGraph(E)local F=self._Cache local G=#F-#E if G>=1 then for H=1,G do local I=
table.remove(F,H)if I then I:Remove()end end end for H,I in E do local J=F[H]if
J then J:SetValue(I)continue end F[H]=self:Plot(I)end return self end if z then
w:PlotGraph(z)end return B,A end})b:DefineElement('Viewport',{Base={IsRadio=true
},Create=function(v,w)local y,z,A=w.Model,w.Camera,b:InsertPrefab('Viewport',w)
local B,C=b:MergeMetatables(w,A),A.Viewport local D=C.WorldModel if not z then z
=b:CreateInstance('Camera',C)z.CFrame=CFrame.new(0,0,0)end Merge(w,{Camera=z,
WorldModel=D,Viewport=C})function w:SetCamera(E)self.Camera=E C.CurrentCamera=E
return self end function w:SetModel(E,F)local G=self.Clone D:ClearAllChildren()
if G then E=E:Clone()end if F then E:PivotTo(F)end E.Parent=D self.Model=E
return E end if y then w:SetModel(y)end w:SetCamera(z)return B,A end})b:
DefineElement('InputText',{Base={Value='',Placeholder='',Label='Input text',
Callback=d,MultiLine=false,NoAutoTag=true,Disabled=false},Create=function(v,w)
local y,z,A,B,C,D=w.MultiLine,w.Placeholder,w.Label,w.Disabled,w.Value,b:
InsertPrefab('InputBox',w)local E=D.Frame local F,G=E.Input,b:MergeMetatables(w,
D)v:Label{Parent=D,Text=A,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=2}b:SetProperties(F,{
PlaceholderText=z,MultiLine=y})local H=function(...)local H=w.Callback H(G,...)
end function w:SetValue(I)F.Text=tostring(I)self.Value=I return self end
function w:SetDisabled(I)self.Disabled=I D.Interactable=not I v:SetColorTags({[A
]=I and'LabelDisabled'or'Label'},true)return self end function w:Clear()F.Text=
''return self end local I=function()local I=F.Text w.Value=I H(I)end F:
GetPropertyChangedSignal'Text':Connect(I)w:SetDisabled(B)w:SetValue(C)v:
TagElements{[F]='Frame'}return G,D end})b:DefineElement('InputInt',{Base={Value=
0,Increment=1,Placeholder='',Label='Input Int',Callback=d},Create=function(v,w)
local y,z,A,B,C,D=w.Value,w.Placeholder,w.Label,w.Disabled,w.NoButtons,b:
InsertPrefab('InputBox',w)local E,F=b:MergeMetatables(w,D),D.Frame local G=F.
Input G.PlaceholderText=z local H,I,J,K=v:Button{Text='-',Parent=F,LayoutOrder=2
,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),Visible=not C,Callback=function()w:Decrease()end},v:
Button{Text='+',Parent=F,LayoutOrder=3,Ratio=1,AutomaticSize=Enum.AutomaticSize.
None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not C,
Callback=function()w:Increase()end},v:Label{Parent=D,Text=A,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,4),LayoutOrder=
4},function(...)local H=w.Callback H(E,...)end function w:Increase()local L,M=
self.Value,self.Increment w:SetValue(L+M)end function w:Decrease()local L,M=self
.Value,self.Increment w:SetValue(L-M)end function w:SetDisabled(L)self.Disabled=
L D.Interactable=not L v:SetColorTags({[J]=L and'LabelDisabled'or'Label'},true)
end function w:SetValue(L)local M,N,O=self.Value,self.Minimum,self.Maximum L=
tonumber(L)if not L then L=M end if N and O then L=math.clamp(L,N,O)end G.Text=L
w.Value=L K(L)return self end local L=function()local L=G.Text w:SetValue(L)end
w:SetValue(y)w:SetDisabled(B)G.FocusLost:Connect(L)v:TagElements{[I]='Button',[H
]='Button',[G]='Frame'}return E,D end})b:DefineElement('InputTextMultiline',{
Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,ColorTag='Frame'},Create=
function(v,w)return v:Console(w)end})b:DefineElement('Console',{Base={Enabled=
true,Value='',TextWrapped=false,Border=true,MaxLines=300,LinesFormat='%s',
Callback=d},Create=function(v,w)local y,z,A,B,C,D=w.ReadOnly,w.LineNumbers,w.
Fill,w.Value,w.Placeholder,b:InsertPrefab('Console',w)local E,F,G=b:
MergeMetatables(w,D),D.Source,D.Lines b:SetProperties(F,w)b:SetProperties(F,{
TextEditable=not y,Parent=D,PlaceholderText=C})G.Visible=z function w:
UpdateLineNumbers()local H,I=self.LineNumbers,self.LinesFormat if not H then
return end local J=#F.Text:split'\n'G.Text=''for K=1,J do local L,M=I:format(K),
K~=J and'\n'or''G.Text..=`{L}{M}`end local K=G.AbsoluteSize.X F.Size=UDim2.new(1
,-K,0,0)return self end function w:CheckLineCount()local H=w.MaxLines if not H
then return end local I=F.Text local J=I:split'\n'if#J>H then local K=`{J[1]}\\n`
local L=I:sub(#K)self:SetValue(L)end return self end function w:UpdateScroll()
local H=D.AbsoluteCanvasSize D.CanvasPosition=Vector2.new(0,H.Y)return self end
function w:SetValue(H)if not self.Enabled then return end F.Text=tostring(H)self
:Update()return self end function w:GetValue()return F.Text end function w:Clear
()F.Text=''self:Update()return self end function w:AppendText(...)local H,I,J=b:
Concat({...},' '),(self:GetValue())if I==''then J=H else J='\n'..H end self:
SetValue(I..J)self:CheckLineCount()return self end function w:Update()local H=w.
AutoScroll w:UpdateLineNumbers()if H then w:UpdateScroll()end end local H=
function()local H=w:GetValue()w:Update()w.Callback(H)end w:SetValue(B)v:
TagElements{[F]='ConsoleText',[G]='ConsoleLineNumbers'}F:
GetPropertyChangedSignal'Text':Connect(H)return E,D end})b:DefineElement('Table'
,{Base={VerticalAlignment=Enum.VerticalAlignment.Top,RowBackground=false,
RowBgTransparency=0.87,Border=false,Spacing=UDim.new(0,4)},Create=function(v,w)
local y,z,A,B,C,D,E,F=v.WindowClass,w.RowBgTransparency,w.RowBackground,w.Border
,w.VerticalAlignment,w.MaxColumns,w.Spacing,b:InsertPrefab('Table',w)local G,H,I
,J,K=b:MergeMetatables(w,F),F.RowTemp,0,{},B and A function w:Row(L)L=L or{}
local M,N,O,P=L.IsHeader,0,{},H:Clone()b:SetProperties(P,{Name='Row',Visible=
true,Parent=F})local Q=P:FindFirstChildOfClass'UIListLayout'b:SetProperties(Q,{
VerticalAlignment=C,Padding=not K and E or UDim.new(0,1)})if M then v:
TagElements{[P]='Header'}else I+=1 end if A and not M then local R=I%2~=1 and z
or 1 P.BackgroundTransparency=R end local R={}local S=b:MergeMetatables(R,P)
function R:Column(T)T=T or{}b:CheckConfig(T,{HorizontalAlign=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top})local U=P
.ColumnTemp:Clone()local V=U:FindFirstChildOfClass'UIListLayout'b:SetProperties(
V,T)local W=U:FindFirstChildOfClass'UIStroke'W.Enabled=B local X=U:
FindFirstChildOfClass'UIPadding'if not K then X:Destroy()end b:SetProperties(U,{
Parent=P,Visible=true,Name='Column'})return b:MakeCanvas{Element=U,WindowClass=y
,Class=S}end function R:NextColumn()N+=1 local T=N%D+1 local U=O[T]if not U then
U=self:Column()O[T]=U end return U end table.insert(J,R)return S end function w:
NextRow()return self:Row()end function w:HeaderRow()return self:Row{IsHeader=
true}end function w:ClearRows()I=0 for L,M in next,F:GetChildren()do if not M:
IsA'Frame'then continue end if M==H then continue end M:Destroy()end return w
end return G,F end})b:DefineElement('List',{Base={Spacing=4,HorizontalFlex=Enum.
UIFlexAlignment.None,VerticalFlex=Enum.UIFlexAlignment.None,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,
FillDirection=Enum.FillDirection.Horizontal},Create=function(v,w)local y,z,A,B,C
,D,E,F=v.WindowClass,w.Spacing,w.HorizontalFlex,w.VerticalFlex,w.
HorizontalAlignment,w.VerticalAlignment,w.FillDirection,b:InsertPrefab('List',w)
local G,H=b:MergeMetatables(w,F),F.UIListLayout b:SetProperties(H,{Padding=UDim.
new(0,z),HorizontalFlex=A,VerticalFlex=B,HorizontalAlignment=C,VerticalAlignment
=D,FillDirection=E})local I=b:MakeCanvas{Element=F,WindowClass=y,Class=G}return
I,F end})b:DefineElement('CollapsingHeader',{Base={Title='Collapsing Header',
CollapseIcon=b.Icons.Arrow,Collapsed=true,Offset=0,NoAutoTag=true,NoAutoFlags=
true,IconPadding=UDim.new(0,4),Activated=d},Create=function(v,w)local y,z,A,B,C,
D,E,F,G,H,I,J=w.Title,w.Collapsed,w.ElementStyle,w.Offset,w.TitleBarProperties,w
.OpenOnDoubleClick,w.OpenOnArrow,w.CollapseIcon,w.IconPadding,w.Icon,w.NoArrow,b
:InsertPrefab('CollapsingHeader',w)local K=J.TitleBar local L,M=K.Collapse,K.
Icon local N,O=L.CollapseIcon,L.UIPadding b:SetPadding(O,G)local P,Q,R=v:Label{
ColorTag='CollapsingHeader',Parent=K,LayoutOrder=2},v:Indent{Class=w,Parent=J,
Offset=B,LayoutOrder=2,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.None,PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,1)}N.Image=
b:CheckAssetUrl(F)local S=function()local S=w.Activated S(Q)end function w:
Remove()J:Destroy()table.clear(self)end function w:SetArrowVisible(T)N.Visible=T
end function w:SetTitle(T)P.Text=T end function w:SetVisible(T)J.Visible=T end
function w:SetIcon(T)local U=T and T~=''M.Visible=U if U then M.Image=b:
CheckAssetUrl(T)end end function w:SetCollapsed(T)self.Collapsed=T local U,V,W=b
:GetContentSize(R),Q:GetThemeKey'AnimationTweenInfo',UDim2.fromScale(1,0)local X
=W+UDim2.fromOffset(0,U.Y)o:HeaderCollapse{Tweeninfo=V,Collapsed=T,Toggle=N,
Resize=R,Hide=R,ClosedSize=W,OpenSize=X}return self end local T=function()w:
SetCollapsed(not w.Collapsed)end if C then b:ApplyFlags{Object=K,Class=C}end if
not E then b:ConnectMouseEvent(K,{DoubleClick=D,Callback=T})end N.Activated:
Connect(T)K.Activated:Connect(S)w:SetCollapsed(z)w:SetTitle(y)w:SetIcon(H)w:
SetArrowVisible(not I)b:ApplyStyle(K,A)Q:TagElements{[K]='CollapsingHeader'}
return Q,J end})b:DefineElement('TreeNode',{Base={Offset=21,IconPadding=UDim.
new(0,2),TitleBarProperties={Size=UDim2.new(1,0,0,13)}},Create=r.
CollapsingHeader})b:DefineElement('Separator',{Base={NoAutoTag=true,NoAutoTheme=
true},Create=function(v,w)local y,z=w.Text,b:InsertPrefab('SeparatorText',w)v:
Label{Text=tostring(y),Visible=y~=nil,Parent=z,LayoutOrder=2,Size=UDim2.new(),
PaddingLeft=UDim.new(0,4),PaddingRight=UDim.new(0,4)}v:TagElements{[z.Left]=
'Separator',[z.Right]='Separator'}return z end})b:DefineElement('Canvas',{Base={
},Create=function(v,w)local y,z,A=v.WindowClass,w.Scroll,w.Class or w local B=z
and'ScrollingCanvas'or'Canvas'local C=b:InsertPrefab(B,w)local D=b:MakeCanvas{
Element=C,WindowClass=y,Class=A}return D,C end})b:DefineElement(
'ScrollingCanvas',{Base={Scroll=true},Create=r.Canvas})b:DefineElement('Region',
{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},Create=function(v,w)
local y,z=v.WindowClass,w.Scroll local A=z and'ScrollingCanvas'or'Canvas'local B
=b:InsertPrefab(A,w)local C=b:MakeCanvas{Element=B,WindowClass=y,Class=w}return
C,B end})b:DefineElement('Group',{Base={Scroll=false,AutomaticSize=Enum.
AutomaticSize.Y},Create=function(v,w)local y,z=v.WindowClass,b:InsertPrefab(
'Group',w)local A=b:MakeCanvas{Element=z,WindowClass=y,Class=w}return A,z end})b
:DefineElement('Indent',{Base={Offset=15,PaddingTop=UDim.new(),PaddingBottom=
UDim.new(),PaddingRight=UDim.new()},Create=function(v,w)local y=w.Offset w.
PaddingLeft=UDim.new(0,y)return v:Canvas(w)end})b:DefineElement('BulletText',{
Base={},Create=function(v,w)local y=w.Rows for z,A in next,y do local B=v:
Bullet(w)B:Label{Text=tostring(A),LayoutOrder=2,Size=UDim2.fromOffset(0,14)}end
end})b:DefineElement('Bullet',{Base={Padding=3,Icon=b.Icons.Dot,IconSize=UDim2.
fromOffset(5,5)},Create=function(v,w)local y,z,A=v.WindowClass,w.Padding,b:
InsertPrefab('Bullet',w)local B,C=b:MakeCanvas{Element=A,WindowClass=y,Class=v},
A.UIListLayout C.Padding=UDim.new(0,z)return B,A end})b:DefineElement('Row',{
Base={Spacing=4,Expanded=false,HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None},Create=function(v,w)local y,z,A,B,C,D=v.
WindowClass,w.Spacing,w.Expanded,w.HorizontalFlex,w.VerticalFlex,b:InsertPrefab(
'Row',w)local E,F=b:MergeMetatables(w,D),D:FindFirstChildOfClass'UIListLayout'F.
Padding=UDim.new(0,z)F.HorizontalFlex=B F.VerticalFlex=C local G=b:MakeCanvas{
Element=D,WindowClass=y,Class=E}function w:Expand()F.HorizontalFlex=Enum.
UIFlexAlignment.Fill return self end if A then w:Expand()end return G,D end})b:
DefineElement('SliderBase',{Base={Format='%.f',Label='',Type='Slider',Callback=d
,NoGrab=false,NoClick=false,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=
false},Create=function(v,w)local y,z,A,B,C,D,E,F,G=w.Value or w.Minimum,w.Format
,w.Label,w.NoAnimation,w.NoGrab,w.NoClick,w.Type,w.Disabled,b:InsertPrefab
'Slider'local H=G.Track local I,J,K,L=H.Grab,H.ValueText,H:FindFirstChildOfClass
'UIPadding',b:MergeMetatables(w,G)local M,N,O=I.AbsoluteSize,b:SetAnimation(G,
'Inputs'),v:Label{Parent=G,Text=A,Position=UDim2.new(1,4),Size=UDim2.fromScale(0
,1)}Merge(w,{Grab=I,Name=A})if E=='Slider'then H.Position=UDim2.fromOffset(M.X/2
,0)H.Size=UDim2.new(1,-M.X,1,0)end local P,Q={Slider=function(P)return{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(P,0.5)}end,Progress=
function(P)return{Size=UDim2.fromScale(P,1)}end,Snap=function(P,Q,R,S)local T=(
math.round(Q)-R)/S return{Size=UDim2.fromScale(1/S,1),Position=UDim2.fromScale(T
,0.5)}end},function(...)local P=w.Callback return P(L,...)end function w:
SetDisabled(R)self.Disabled=R G.Interactable=not R v:SetColorTags({[O]=R and
'LabelDisabled'or'Label'},true)return self end function w:SetValueText(R)J.Text=
tostring(R)end function w:SetValue(R,S)local T,U,V,W=v:GetThemeKey
'AnimationTweenInfo',w.Minimum,w.Maximum,R local X=V-U if not S then W=(R-U)/X
else R=U+(X*W)end W=math.clamp(W,0,1)local Y=P[E](W,R,U,V)o:Tween{Object=I,
Tweeninfo=T,NoAnimation=B,EndProperties=Y}self.Value=R self:SetValueText(z:
format(R,V))Q(R)return self end local R,S=function(R)v:SetColorTags({[G]=R and
'FrameActive'or'Frame'},true)v:SetElementFocused(G,{Focused=R,Animation=N})end,
function()if w.Disabled then return end if w.ReadOnly then return end return
true end local T=function(T)if not S()then return end local U,V,W=H.
AbsolutePosition.X,H.AbsoluteSize.X,T.X local X=W-U local Y=math.clamp(X/V,0,1)w
:SetValue(Y,true)end local U,V=function(...)if not S()then return end R(true)if
not D then T(...)end end,function()R(false)end I.Visible=not C w:SetValue(y)w:
SetDisabled(F)v:TagElements{[J]='Label',[I]='SliderGrab'}b:ConnectDrag(H,{
DragStart=U,DragMovement=T,DragEnd=V})return L,G end})b:DefineElement(
'SliderEnum',{Base={Items={},Label='Slider Enum',Type='Snap',Minimum=1,Maximum=
10,Value=1,Callback=d,ColorTag='Frame'},Create=function(v,w)local y,z=w.Callback
,w.Value local A=function(A,B)B=math.round(B)local C=A.Items A.Maximum=#C return
C[B]end w.Callback=function(B,C,D)local E=A(B,C)B:SetValueText(E)w.Value=E
return y(B,E)end A(w,z)return v:SliderBase(w)end})b:DefineElement('SliderInt',{
Base={Label='Slider Int',ColorTag='Frame'},Create=r.SliderBase})b:DefineElement(
'SliderFloat',{Base={Label='Slider Float',Format='%.3f',ColorTag='Frame'},Create
=r.SliderBase})b:DefineElement('DragInt',{Base={Format='%.f',Label='Drag Int',
Callback=d,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=false},Create=
function(v,w)local y,z,A,B,C=w.Value or w.Minimum,w.Format,w.Label,w.Disabled,b:
InsertPrefab'Slider'local D,E=b:MergeMetatables(w,C),C.Track local F,G=E.
ValueText,E.Grab G.Visible=false local H,I,J,K,L,M=b:GetChildOfClass(E,
'UIDragDetector'),v:Label{Parent=C,Text=A,Position=UDim2.new(1,7),Size=UDim2.
fromScale(0,1)},0,0,b:SetAnimation(C,'Inputs'),function(...)local H=w.Callback
return H(D,...)end function w:SetValue(N,O)local P,Q=self.Minimum,self.Maximum
local R=Q-P if not O then J=((N-P)/R)*100 else N=P+(R*(J/100))end N=math.clamp(N
,P,Q)self.Value=N F.Text=z:format(N,Q)M(N)return self end function w:SetDisabled
(N)self.Disabled=N v:SetColorTags({[I]=N and'LabelDisabled'or'Label'},true)end
local N,O=function(N)v:SetColorTags({[C]=N and'FrameActive'or'Frame'},true)v:
SetElementFocused(C,{Focused=N,Animation=L})end,function()if w.Disabled then
return end if w.ReadOnly then return end return true end local P,Q,R=function(P)
if not O()then return end N(true)InputBeganPosition=P K=J end,function(P)if not
O()then return end local Q=P.X-InputBeganPosition.X local R=K+(Q/2)J=math.clamp(
R,0,100)w:SetValue(J,true)end,function()N(false)end w:SetValue(y)w:SetDisabled(B
)b:ConnectDrag(E,{DragStart=P,DragEnd=R,DragMovement=Q})v:TagElements{[F]=
'Label'}return D,C end})b:DefineElement('DragFloat',{Base={Format='%.3f',Label=
'Drag Float',ColorTag='Frame'},Create=r.DragInt})b:DefineElement('MultiElement',
{Base={Callback=d,Label='',Disabled=false,BaseInputConfig={},InputConfigs={},
Value={},Minimum={},Maximum={},MultiCallback=d},Create=function(v,w)local y,z,A,
B,C,D,E,F=w.Label,w.BaseInputConfig,w.InputConfigs,w.InputType,w.Disabled,w.
Value,w.Minimum,w.Maximum assert(B,'No input type provided for MultiElement')
local G,H=v:Row{Spacing=4}local I,J,K,L,M=G:Row{Size=UDim2.fromScale(0.65,0),
Expanded=true},G:Label{Size=UDim2.fromScale(0.35,0),LayoutOrder=2,Text=y},b:
MergeMetatables(w,G),{},false local N=function()local N={}for O,P in L do N[O]=P
:GetValue()end w.Value=N return N end local function O(...)local P=w.
MultiCallback P(K,...)end local P=function()if#L~=#A then return end if not M
then return end local P=N()O(P)end function w:SetDisabled(Q)self.Disabled=Q v:
SetColorTags({[J]=Q and'LabelDisabled'or'Label'},true)for R,S in L do S:
SetDisabled(Q)end end function w:SetValue(Q)M=false for R,S in Q do local T=L[R]
assert(T,`No input object for index: {R}`)T:SetValue(S)end M=true O(Q)end z=
Copy(z,{Size=UDim2.new(1,0,0,19),Label='',Callback=P})for Q,R in A do local S=
Copy(z,R)b:CheckConfig(S,{Minimum=E[Q],Maximum=F[Q]})local T=I[B](I,S)table.
insert(L,T)end Merge(w,{Row=I,Inputs=L})M=true w:SetDisabled(C)w:SetValue(D)
return K,H end})local v,w,y=function(v,w,y,z)b:DefineElement(v,{Base={Label=v,
Callback=d,InputType=w,InputConfigs=table.create(y,{}),BaseInputConfig={}},
Create=function(A,B)local C=(B.BaseInputConfig)if z then Merge(C,z)end b:
CheckConfig(C,{ReadOnly=B.ReadOnly,Format=B.Format})B.MultiCallback=function(...
)local D=B.Callback D(...)end return A:MultiElement(B)end})end,function(v,w,y,z)
z=z or{}b:DefineElement(v,{Base={Label=v,Callback=d,Value=b.Accent.Light,
Disabled=false,Minimum={0,0,0},Maximum={255,255,255,100},BaseInputConfig={},
InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]={Format='B: %.f'}}
},Create=function(A,B)local C,D,E,F=B.BaseInputConfig,B.InputConfigs,B.Value,B.
Disabled if z.Color4 then D[4]={Format='A: %.f'}end local G=Copy(B,{Value={1,1,1
},Callback=function(G,...)if B.ValueChanged then B:ValueChanged(...)end end})
local H,I=A[w](A,G)local J,K=b:MergeMetatables(B,H),H.Row local L,M=K:Button{
BackgroundTransparency=0,Size=UDim2.fromOffset(19,19),UiPadding=0,Text='',Ratio=
1,ColorTag='',ElementStyle=''},function(...)local L=B.Callback return L(J,...)
end local N=function(N)L.BackgroundColor3=N M(N)end function B:ValueChanged(O)
local P,Q,R=O[1],O[2],O[3]local S=Color3.fromRGB(P,Q,R)self.Value=S N(S)end
function B:SetValue(O)self.Value=O N(O)H:SetValue{math.round(O.R*255),math.
round(O.G*255),math.round(O.B*255)}end B:SetValue(E)return J,I end})end,function
(v,w,y,z)b:DefineElement(v,{Base={Label=v,Callback=d,Disabled=false,Value=CFrame
.new(10,10,10),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(100,100,100),
BaseInputConfig={},InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'},[3]
={Format='Z: %.f'}}},Create=function(A,B)local C,D,E,F,G=B.BaseInputConfig,B.
Value,B.Disabled,B.Maximum,B.Minimum local H=Copy(B,{Maximum={F.X,F.Y,F.Z},
Minimum={G.X,G.Y,G.Z},Value={D.X,D.Y,D.Z},Callback=function(H,...)if B.
ValueChanged then B:ValueChanged(...)end end})local I,J=A[w](A,H)local K,L=b:
MergeMetatables(B,I),I.Row local M=function(...)local M=B.Callback return M(K,
...)end function B:ValueChanged(N)local O,P,Q=N[1],N[2],N[3]local R=CFrame.new(O
,P,Q)self.Value=R M(R)end function B:SetValue(N)self.Value=N I:SetValue{math.
round(N.X),math.round(N.Y),math.round(N.Z)}end B:SetValue(D)return K,J end})end
v('InputInt2','InputInt',2,{NoButtons=true})v('InputInt3','InputInt',3,{
NoButtons=true})v('InputInt4','InputInt',4,{NoButtons=true})v('SliderInt2',
'SliderInt',2)v('SliderInt3','SliderInt',3)v('SliderInt4','SliderInt',4)v(
'SliderFloat2','SliderFloat',2)v('SliderFloat3','SliderFloat',3)v('SliderFloat4'
,'SliderFloat',4)v('DragInt2','DragInt',2)v('DragInt3','DragInt',3)v('DragInt4',
'DragInt',4)v('DragFloat2','DragFloat',2)v('DragFloat3','DragFloat',3)v(
'DragFloat4','DragFloat',4)w('InputColor3','InputInt3')w('SliderColor3',
'SliderInt3')w('DragColor3','DragInt3')y('InputCFrame','InputInt3')y(
'SliderCFrame','SliderInt3')y('DragCFrame','DragInt3')b:DefineElement(
'SliderProgress',{Base={Label='Slider Progress',Type='Progress',ColorTag='Frame'
},Create=r.SliderBase})b:DefineElement('ProgressBar',{Base={Label='Progress Bar'
,Type='Progress',ReadOnly=true,MinValue=0,MaxValue=100,Format='% i%%',
Interactable=false,ColorTag='Frame'},Create=function(z,A)function A:
SetPercentage(B)A:SetValue(B)end local B,C=z:SliderBase(A)local D=B.Grab z:
TagElements{[D]={BackgroundColor3='ProgressBar'}}return B,C end})b:
DefineElement('Combo',{Base={Value='',Placeholder='',Callback=d,Items={},
Disabled=false,WidthFitPreview=false,Label='Combo'},Create=function(z,A)local B,
C,D,E,F,G,H=A.Placeholder,A.NoAnimation,A.Selected,A.Label,A.Disabled,A.
WidthFitPreview,b:InsertPrefab('Combo',A)local I,J,K=b:MergeMetatables(A,H),(H.
Combo)local L,M,N=z:Label{Text=tostring(B),Parent=J,Name='ValueText'},z:
ArrowButton{Parent=J,Interactable=false,Size=UDim2.fromOffset(19,19),LayoutOrder
=2},z:Label{Text=E,Parent=H,LayoutOrder=2}if G then b:SetProperties(H,{
AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.new(0,0,0,0)})b:SetProperties(J,{
AutomaticSize=Enum.AutomaticSize.XY,Size=UDim2.fromScale(0,1)})end local O,P=
function(O,...)A:SetOpen(false)return A.Callback(I,O,...)end,function(O,P)local
Q=z:GetThemeKey'AnimationTweenInfo'H.Interactable=not O o:HeaderCollapseToggle{
Tweeninfo=Q,NoAnimation=P,Collapsed=not O,Toggle=M.Icon}end local function Q()
local R,S=A.GetItems,A.Items if R then return R()end return S end function A:
SetValueText(R)L.Text=tostring(R)end function A:ClosePopup()if K then K:
ClosePopup(true)end end function A:SetDisabled(R)self.Disabled=R H.Interactable=
not R z:SetColorTags({[N]=R and'LabelDisabled'or'Label'},true)end function A:
SetValue(R)local S=Q()local T=S[R]local U=T or R self.Selected=R self.Value=U
self:ClosePopup()if typeof(R)=='number'then self:SetValueText(U)else self:
SetValueText(R)end return O(R,U)end function A:SetOpen(R)local S=self.Selected
self.Open=R P(R,C)if not R then self:ClosePopup()return end K=z:Dropdown{
RelativeTo=J,Items=Q(),Selected=S,OnSelected=function(...)A:SetValue(...)end,
OnClosed=function()self:SetOpen(false)end}return self end local R=function()
local R=A.Open A:SetOpen(not R)end J.Activated:Connect(R)P(false,true)A:
SetDisabled(F)if D then A:SetValue(D)end b:SetAnimation(J,'Inputs')z:TagElements
{[J]='Frame'}return I,H end})local z={TileBarConfig={Close={Image=b.Icons.Close,
IconPadding=UDim.new(0,3)},Collapse={Image=b.Icons.Arrow,IconPadding=UDim.new(0,
3)}},CloseCallback=d,Collapsible=true,Open=true,Focused=false}function z:Tween(A
)b:CheckConfig(A,{Tweeninfo=self:GetThemeKey'AnimationTweenInfo'})return o:
Tween(A)end function z:TagElements(A)local B,C,D=b.Debug,self.TagsList,self.
Theme b:MultiUpdateColors{Theme=D,TagsList=C,Objects=A}end function z:
MakeTitleBarCanvas()local A=self.TitleBar local B=b:MakeCanvas{WindowClass=self,
Element=A}self.TitleBarCanvas=B return B end function z:AddDefaultTitleButtons()
local A,B=self.TileBarConfig,self.TitleBar local C,D,E=A.Collapse,A.Close,self.
TitleBarCanvas if not E then E=self:MakeTitleBarCanvas()end b:CheckConfig(self,{
Toggle=E:RadioButton{Icon=C.Image,IconPadding=C.IconPadding,LayoutOrder=1,Ratio=
1,Size=UDim2.new(0,0),Callback=function()self:ToggleCollapsed()end},CloseButton=
E:RadioButton{Icon=D.Image,IconPadding=D.IconPadding,LayoutOrder=3,Ratio=1,Size=
UDim2.new(0,0),Callback=function()self:SetVisible(false)end},TitleLabel=E:Label{
ColorTag='Title',LayoutOrder=2,Size=UDim2.new(1,0),Active=false,Fill=true,
ClipsDescendants=true,AutomaticSize=Enum.AutomaticSize.XY}})self:TagElements{[
self.TitleLabel]='WindowTitle'}end function z:Close()local A=self.CloseCallback
if A then local B=A(self)if B==false then return end end self:Remove()end
function z:SetVisible(A)local B,C=self.WindowFrame,self.NoFocusOnAppearing self.
Visible=A B.Visible=A if A and not C then b:SetFocusedWindow(self)end return
self end function z:ToggleVisibility(A)local B=self.Visible self:SetVisible(not
B)end function z:GetWindowSize()return self.WindowFrame.AbsoluteSize end
function z:GetTitleBarSizeY()local A=self.TitleBar return A.Visible and A.
AbsoluteSize.Y or 0 end function z:SetTitle(A)self.TitleLabel.Text=tostring(A)
return self end function z:SetPosition(A)self.WindowFrame.Position=A return self
end function z:SetSize(A,B)local C=self.WindowFrame if typeof(A)=='Vector2'then
A=UDim2.fromOffset(A.X,A.Y)end C.Size=A self.Size=A return self end function z:
SetCanvasInteractable(A)local B=self.Body B.Interactable=A end function z:Center
()local A=self:GetWindowSize()/2 local B=UDim2.new(0.5,-A.X,0.5,-A.Y)self:
SetPosition(B)return self end function z:LoadStylesIntoElement(A)local B,C,D=A.
Flags,A.Object,A.Canvas if not C then return end local E={FrameRounding=function
()if B.CornerRadius then return end if not D then return end local E=C:
FindFirstChild('FrameRounding',true)if not E then return end D:TagElements{[E]=
'FrameRounding'}end}for F,G in E do local H=self:GetThemeKey(F)if H==nil then
continue end task.spawn(G,H)end end function z:SetTheme(A)local B,C,D,E=b.
ThemeConfigs,self.TagsList,self.Focused,self.WindowState if not A then A=self.
Theme end assert(B[A],`{A} is not a valid theme!`)self.Theme=A b:
MultiUpdateColors{Animate=false,Theme=A,Objects=C}self:SetFocusedColors(E)return
self end function z:SetFocusedColors(A)local B,C,D,E,F=self.WindowFrame,self.
TitleBar,self.Theme,self.TitleLabel,self:GetThemeKey'AnimationTweenInfo'local G=
B:FindFirstChildOfClass'UIStroke'local H={Focused={[G]='BorderActive',[C]=
'TitleBarBgActive',[E]={TextColor3='TitleActive'}},UnFocused={[G]='Border',[C]=
'TitleBarBg',[E]={TextColor3='Title'}},Collapsed={[G]='Border',[C]=
'TitleBarBgCollapsed',[E]={TextColor3='Title'}}}b:MultiUpdateColors{Tweeninfo=F,
Animate=true,Objects=H[A],Theme=D}end function z:SetFocused(A)A=A==nil and true
or A local B,C=self.Collapsed,self.WindowState if A then b:SetFocusedWindow(self
)end local D=B and'Collapsed'or A and'Focused'or'UnFocused'if D==C then return
end self.Focused=A self.WindowState=D self:SetFocusedColors(D)end function z:
GetThemeKey(A)return b:GetThemeKey(self.Theme,A)end function z:ResetColors()
local A,B,C=b.Theme,self.Theme,self.TagsList table.clear(B)b:MultiUpdateColors{
Animate=false,Theme=A,Objects=C}return z end function z:SetCollapsible(A)self.
Collapsible=A return self end function z:ToggleCollapsed(A)local B,C=self.
Collapsed,self.Collapsible if not A and not C then return self end self:
SetCollapsed(not B)return self end function z:SetCollapsed(A,B)local C,D,E,F,G,H
,I,J,K=self.WindowFrame,self.Body,self.Toggle,self.ResizeGrab,self.Size,self.
AutoSize,self:GetThemeKey'AnimationTweenInfo',self:GetWindowSize(),self:
GetTitleBarSizeY()local L,M=E.Icon,UDim2.fromOffset(J.X,K)self.Collapsed=A self:
SetCollapsible(false)self:SetFocused(not A)o:HeaderCollapse{Tweeninfo=I,
NoAnimation=B,Collapsed=A,Toggle=L,Resize=C,NoAutomaticSize=not H,Hide=D,
ClosedSize=M,OpenSize=G,Completed=function()self:SetCollapsible(true)end}self:
Tween{Object=F,NoAnimation=B,EndProperties={TextTransparency=A and 1 or 0.6,
Interactable=not A}}return self end function z:UpdateConfig(A)local B={
NoTitleBar=function(B)local C=self.TitleBar C.Visible=not B end,NoClose=function
(B)local C=self.CloseButton C.Visible=not B end,NoCollapse=function(B)local C=
self.Toggle C.Visible=not B end,NoTabsBar=function(B)local C=self.
WindowTabSelector if not C then return end local D=C.TabsBar D.Visible=not B end
,NoScrollBar=function(B)local C,D,E,F=B and 0 or 9,self.NoScroll,self.
WindowTabSelector,self.ContentCanvas if E then E.Body.ScrollBarThickness=C end
if not D then F.ScrollBarThickness=C end end,NoScrolling=function(B)local C,D,E=
self.NoScroll,self.WindowTabSelector,self.ContentCanvas if D then D.Body.
ScrollingEnabled=not B end if not C then E.ScrollingEnabled=not B end end,NoMove
=function(B)local C=self.DragConnection C:SetEnabled(not B)end,NoResize=function
(B)local C=self.ResizeConnection C:SetEnabled(not B)end,NoBackground=function(B)
local C,D=self:GetThemeKey'WindowBgTransparency',self.CanvasFrame D.
BackgroundTransparency=B and 1 or C end}Merge(self,A)for C,D in A do local E=B[C
]if E then E(D)end end return self end function z:Remove()local A,B,C=self.
WindowFrame,self.WindowClass,b.Windows local D=table.find(C,B)if D then table.
remove(C,D)end A:Destroy()end function z:MenuBar(A,...)local B,C=self.
ContentCanvas,self.ContentFrame A=A or{}Merge(A,{Parent=C,Layout=-1})return B:
MenuBar(A,...)end b:DefineElement('Window',{Export=true,Base={Theme='DarkTheme',
NoSelect=false,NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize=
false,MinimumSize=Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,
NoWindowRegistor=false,NoBringToFrontOnFocus=false,IsDragging=false},Create=
function(A,B)local C,D=b.Windows,b.Container.Windows b:CheckConfig(B,{Parent=D,
Title=b.DefaultTitle})local E,F,G,H,I,J,K,L,M,N,O,P,Q=B.NoDefaultTitleBarButtons
,B.Collapsed,B.MinimumSize,B.Title,B.NoTabs,B.NoScroll,B.Theme,B.AutomaticSize,B
.NoWindowRegistor,B.AutoSelectNewTabs,B.OpenOnDoubleClick,B.NoCollapse,B.Parent
~=D local R={Scroll=not J,Fill=not L and true or nil,UiPadding=UDim.new(0,I and
8 or 0),AutoSelectNewTabs=N}if L then Merge(R,{AutomaticSize=L,Size=UDim2.new(1,
0)})end local S=b:InsertPrefab('Window',B)local T=S.Content local U,V=T.TitleBar
,NewClass(z)local W,X,Y,Z=(b:MakeCanvas{Element=T,WindowClass=V,Class=V})local _
,aa=W:Canvas(Copy(R,{Parent=T,CornerRadius=UDim.new(0,0)}))local ab=b:
MakeResizable{MinimumSize=G,Resize=S,OnUpdate=function(ab)V:SetSize(ab,true)end}
Merge(V,B)Merge(V,{WindowFrame=S,ContentFrame=T,CanvasFrame=aa,ResizeGrab=ab.
Grab,TitleBar=U,Elements=r,TagsList={},_SelectDisabled=Q,ResizeConnection=ab,
HoverConnection=b:DetectHover(T),DragConnection=b:MakeDraggable{Grab=T,Move=S,
SetPosition=function(ac,ad)local ae=X:GetThemeKey'AnimationTweenInfo'o:Tween{
Tweeninfo=ae,Object=ac.Move,EndProperties={Position=ad}}end,OnDragStateChange=
function(ac)V.IsDragging=ac aa.Interactable=not ac if ac then b:
SetFocusedWindow(Z)end b:SetWindowFocusesEnabled(not ac)end}})if I then X,Y=_,aa
else X,Y=_:TabSelector(R)V.WindowTabSelector=X end Z=b:MergeMetatables(V,X)
Merge(V,{ContentCanvas=X,WindowClass=Z,Body=Y})b:ConnectMouseEvent(T,{
DoubleClick=true,OnlyMouseHovering=U,Callback=function(...)if not V.
OpenOnDoubleClick then return end if V.NoCollapse then return end V:
ToggleCollapsed()end})if not E then V:AddDefaultTitleButtons()end V:SetTitle(H)V
:SetCollapsed(F,true)V:SetTheme(K)V:UpdateConfig(B)V:SetFocused()local ac=ab.
Grab b:SetAnimation(ac,'TextButtons')Z:TagElements{[ac]='ResizeGrab',[U]=
'TitleBar',[aa]='Window'}if not M then table.insert(C,Z)end return Z,S end})b:
DefineElement('TabsWindow',{Export=true,Base={NoTabs=false,AutoSelectNewTabs=
true},Create=function(aa,ab)return aa:Window(ab)end})b:DefineElement(
'PopupCanvas',{Base={AutoClose=false,Scroll=false,Visible=true,Spacing=UDim.new(
0,1),AutomaticSize=Enum.AutomaticSize.XY,MaxSizeY=150,MinSizeX=100,MaxSizeX=math
.huge,OnClosed=d},Create=function(aa,ab)ab.Parent=b.Container.Overlays local ac,
ad,ae,A,B,C,D,E,F=ab.RelativeTo,ab.MaxSizeY,ab.MinSizeX,ab.MaxSizeX,ab.Visible,
ab.AutoClose,ab.NoAnimation,aa:OverlayScroll(ab)local G=F.UIStroke local H,I,J,K
,L,M,N=G.Thickness,F.Parent.AbsolutePosition,(b:DetectHover(F,{MouseOnly=true,
OnInput=function(H,I)if H then return end if not F.Visible then return end ab:
OnFocusLost()end}))function ab:FetchScales()local O=E:GetCanvasSize()K=ac.
AbsolutePosition L=ac.AbsoluteSize M=math.clamp(O.Y,L.Y,ad)N=math.clamp(L.X,ae,A
)end function ab:UpdatePosition()F.Position=UDim2.fromOffset(K.X-I.X+H,K.Y-I.Y+L
.Y)end function ab:GetScale(O)local P,Q=UDim2.fromOffset(N,M),UDim2.fromOffset(N
,0)return O and P or Q end function ab:IsMouseHovering()return J.Hovering end
function ab:OnFocusLost()local O=self.OnClosed self:SetPopupVisible(false)O(self
)if C then self:ClosePopup()end end function ab:ClosePopup(O)self:
SetPopupVisible(false,D,O)J:Disconnect()F:Remove()end function ab:
SetPopupVisible(O,P)if F.Visible==O then return end ac.Interactable=not O self:
UpdateScales(O,D,P)self.Visible=O end function ab:UpdateScales(O,P,Q)local R=E:
GetThemeKey'AnimationTweenInfo'if O==nil then O=F.Visible end ab:FetchScales()ab
:UpdatePosition()local S=o:Tween{Tweeninfo=R,Object=F,NoAnimation=P,
EndProperties={Size=ab:GetScale(O),Visible=O}}if S and Q then S.Completed:Wait()
end end ab:UpdateScales(false,true)ab:SetPopupVisible(B)E.OnChildChange:Connect(
ab.UpdateScales)return E,F end})b:DefineElement('PopupModal',{Export=true,Base={
NoAnimation=false,NoCollapse=true,NoClose=true,NoResize=true,NoSelect=true,
NoAutoFlags=true,NoWindowRegistor=true,NoScroll=true},Create=function(aa,ab)ab.
Parent=b.Container.Overlays local ac,ad,ae=aa.WindowClass,(ab.NoAnimation)if ac
then ae=ac:GetThemeKey'ModalWindowDimTweenInfo'ab.Theme=ac.Theme end local A=b:
InsertPrefab('ModalEffect',ab)local B=aa:Window(Copy(ab,{NoAutoFlags=false,
Parent=A,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(372,38),AutomaticSize=Enum.AutomaticSize.Y}))function ab:
ClosePopup()o:Tween{Object=A,Tweeninfo=ae,NoAnimation=ad,EndProperties={
BackgroundTransparency=1},Completed=function()A:Destroy()end}B:Close()end o:
Tween{Object=A,Tweeninfo=ae,NoAnimation=ad,StartProperties={
BackgroundTransparency=1},EndProperties={BackgroundTransparency=0.8}}aa:
TagElements{[A]='ModalWindowDim'}local C=b:MergeMetatables(ab,B)return C,A end})
local aa=`rbxassetid://`..b.PrefabsId b:Init{Prefabs=game:GetService
'InsertService':LoadLocalAsset(aa)}return b end function a.b()return function(aa
)for ab,ac in ipairs(aa)do local ad=getfenv(0)for ae in string.gmatch(ac,
'[^%.]+')do ad=ad and ad[ae]if ad==nil then break end end if not ad then return
false,ac end end return true end end function a.c()return function()if not
getfenv(0).cache or not getfenv(0).cache.invalidate then return{status=400,
message='Global not found'}end local aa=game:GetService'BadgeService'if aa~=game
:GetService'BadgeService'then return{status=500,message=
[[Did a cosmic ray just hit your computer? This should never evaluate]]}end
cache.invalidate(aa)if aa==game:GetService'BadgeService'then return{status=500,
message='Reference to service object retained'}elseif typeof(aa)~='Instance'then
return{status=500,message="Reference type wasn't retained"}end local ab,ac=a.
load'b'{}if not ab then return{status=501,message=`Alias not found: {ac}`}end
return{status=200,message=`Passed`}end end function a.d()return function()if not
getfenv(0).cache or not getfenv(0).cache.iscached then return{status=400,message
='Global not found'}elseif not getfenv(0).cache.invalidate then return{status=
401,message="Dependency 'cache.invalidate' missing"}end local aa=Instance.new
'Part'if not cache.iscached(aa)then return{status=500,message=
'Cached part assumed uncached'}end cache.invalidate(aa)if cache.iscached(aa)then
return{status=500,message='Uncached part assumed cached'}end local ab,ac=a.load
'b'{}if not ab then return{status=501,message=`Alias not found: {ac}`}end return
{status=200,message=`Passed`}end end function a.e()return function()if not
getfenv(0).cache or not getfenv(0).cache.replace then return{status=400,message=
'Global not found'}end local aa,ab=game:GetService'BadgeService',game:GetService
'Stats'if aa==ab then return{status=500,message=
[[Did a cosmic ray just hit your computer? This should never evaluate]]}end
cache.replace(aa,ab)if aa==ab then return{status=500,message=
'Reference is old reference'}elseif aa==game:GetService'Stats'then return{status
=500,message='Reference is old references object'}end local ac,ad=a.load'b'{}if
not ac then return{status=501,message=`Alias not found: {ad}`}end return{status=
200,message=`Passed`}end end function a.f()return function()if not getfenv(0).
islclosure then return{status=400,message='Global not found'}end local aa,ab=
function()return 1 end,print if not islclosure(aa)then return{status=500,message
='Failed to identify lua closure'}elseif islclosure(ab)then return{status=500,
message='Identified C closure as lua closure'}end local ac,ad=a.load'b'{}if not
ac then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message=`Passed`}end end function a.g()return function()if not getfenv(0).
iscclosure then return{status=400,message='Global not found'}end local aa,ab,ac=
function()return 1 end,print,newcclosure(function()return 1 end)if iscclosure(aa
)then return{status=500,message='Lua closure identified as C closure'}elseif not
iscclosure(ab)then return{status=500,message=
'C closure not identified as C closure'}elseif not iscclosure(ac)then return{
status=500,message='C closure not identified as C closure'}end local ad,ae=a.
load'b'{}if not ad then return{status=501,message=`Alias not found: {ae}`}end
return{status=200,message=`Passed`}end end function a.h()return function()if not
getfenv(0).isexecutorclosure then return{status=400,message='Global not found'}
end local aa=function()return 1 end if not isexecutorclosure(isexecutorclosure)
then return{status=500,message='Failed to identify an executor closure'}elseif
not isexecutorclosure(aa)then return{status=500,message=
'Did not identify an lua closure as an executor closure'}elseif
isexecutorclosure(print)then return{status=500,message=
'Identified a lua standard closure as an executor closure'}end local ab,ac=a.
load'b'{'checkclosure','isourclosure'}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.i()return
function()local aa=getfenv(0)if not aa.newcclosure then return{status=400,
message='Global not found'}elseif not aa.iscclosure then return{status=500,
message='iscclosure required to test newcclosure'}end local ab=function(...)
return...end local ac=newcclosure(ab)if iscclosure(ab)then return{status=500,
message='iscclosure returned true a lua closure'}elseif not iscclosure(ac)then
return{status=500,message='Returned false for a C closure'}elseif ac(1)~=1 then
return{status=500,message='C closure did not return the expected value'}end
local ad,ae=a.load'b'{}if not ad then return{status=501,message=`Alias not found: {
ae}`}end return{status=200,message='Passed'}end end function a.j()return
function()if not getfenv(0).clonefunction then return{status=400,message=
'Global not found'}end local aa=function()return 1 end local ab=clonefunction(aa
)if ab==aa then return{status=500,message=
'Cloned function is the same as the original'}elseif ab()~=1 then return{status=
500,message='Cloned function behavior mismatch'}end local ac,ad=a.load'b'{}if
not ac then return{status=501,message=`Alias not found: {ad}`}end return{status=
200,message='Passed'}end end function a.k()return function()if not getfenv(0).
hookfunction then return{status=400,message='Global not found'}end local aa=
function()return 1 end local ab,ac=aa,function()return 2 end if ab()~=1 then
return{status=500,message=
[[This should never evaluate. Did a cosmic ray hit your computer and flip a bit?]]
}end local ad=hookfunction(ab,ac)if ab()~=2 then return{status=500,message=
'Hooked function did not return the expected value'}elseif ad()~=1 then return{
status=500,message='Old function did not return the expected value'}end
hookfunction(ab,ad)if ab()~=1 then return{status=500,message=
'Restored function did not return the expected value'}end local ae,b=a.load'b'{
'hookfunc','replaceclosure'}if not ae then return{status=501,message=`Alias not found: {
b}`}end return{status=200,message='Passed'}end end function a.l()return function
()if not getfenv(0).restorefunction then return{status=400,message=
'Global not found'}elseif not getfenv(0).hookfunction then return{status=401,
message="'hookfunction' needed to test this"}end local aa=function()return 1 end
local ab,ac=aa,function()return 2 end if ab()~=1 then return{status=500,message=
[[This should never evaluate. Did a cosmic ray hit your computer and flip a bit?]]
}end local ad=hookfunction(ab,ac)if ab()~=2 then return{status=500,message=
'Hooked function did not return the expected value'}elseif ad()~=1 then return{
status=500,message='Old function did not return the expected value'}end
restorefunction(ab)if ab()~=1 then hookfunction(ab,ad)return{status=500,message=
'Restored function did not return the expected value'}end local ae,b=a.load'b'{
'restorefunc'}if not ae then return{status=501,message=`Alias not found: {b}`}
end return{status=200,message='Passed'}end end function a.m()return function()if
not getfenv(0).getfunctionhash then return{status=400,message='Global not found'
}end local aa,ab,ac,ad,ae,b,c=function(aa)return#aa==96 and aa:match
'^[0-9a-fA-F]+$'~=nil end,function()end,function(...)end,function()end,function(
)return 1 end,function()return 2 end,pcall(function()getfunctionhash(print)end)
if not aa(getfunctionhash(ab))then return{status=500,message=
'Hash is not hex encoded'}elseif getfunctionhash(ab)==getfunctionhash(ac)then
return{status=500,message='Unequal functions returned equal hashes'}elseif
getfunctionhash(ab)~=getfunctionhash(ad)then return{status=500,message=
'Equal functions returned unequal hashes'}elseif getfunctionhash(ae)==
getfunctionhash(b)then return{status=500,message=
'Unequal returns gave equal returns'}elseif c then return{status=500,message=
'Passed when given a lua standard C closure'}end local d,e=a.load'b'{}if not d
then return{status=501,message=`Alias not found: {e}`}end return{status=200,
message=`Passed`}end end function a.n()return function()if not getfenv(0).
checkcaller then return{status=400,message='Global not found'}elseif not
getfenv(0).hookmetamethod then return{status=401,message=
"Dependency 'hookmetamethod' missing"}end local aa,ab,ac=(checkcaller())ac=
hookmetamethod(game,'__namecall',function(...)if ab==nil then ab=checkcaller()
end return ac(...)end)tostring(game)task.wait(0.1)hookmetamethod(game,
'__namecall',ac)if aa~=true then return{status=500,message=
'Returned false in executor thread'}elseif ab~=false then return{status=500,
message='Did not return false in a hook'}end local ad,ae=a.load'b'{}if not ad
then return{status=501,message=`Alias not found: {ae}`}end return{status=200,
message='Passed'}end end function a.o()local aa,ab={},{}for ac=65,90 do table.
insert(aa,ac)end for ac=97,122 do table.insert(aa,ac)end for ac=48,57 do table.
insert(aa,ac)end table.insert(aa,43)table.insert(aa,47)for ac,ad in ipairs(aa)do
ab[ad]=ac end local ac,ad,ae,b={},bit32.rshift,bit32.lshift,bit32.band function
ac.Encode(c)local d,e={},0 for f=1,#c,3 do local g,h,i=string.byte(c,f,f+2)local
j,k,l,m=ad(g,2),ae(b(g,3),4)+ad(h or 0,4),ae(b(h or 0,15),2)+ad(i or 0,6),b(i or
0,63)e=e+1 d[e]=aa[j+1]e=e+1 d[e]=aa[k+1]e=e+1 d[e]=h and aa[l+1]or 61 e=e+1 d[e
]=i and aa[m+1]or 61 end local f,g,h={},0 for i=1,e,4096 do g=g+1 h=i+4096-1 f[g
]=string.char(table.unpack(d,i,h>e and e or h))end return table.concat(f)end
function ac.Decode(c)local d,e={},0 for f=1,#c,4 do local g,h,i,j=string.byte(c,
f,f+3)local k,l,m,n=ab[g]-1,ab[h]-1,(ab[i]or 1)-1,(ab[j]or 1)-1 local o,p,q=ae(k
,2)+ad(l,4),ae(b(l,15),4)+ad(m,2),ae(b(m,3),6)+n e=e+1 d[e]=o if i~=61 then e=e+
1 d[e]=p end if j~=61 then e=e+1 d[e]=q end end local f,g,h={},0 for i=1,e,4096
do g=g+1 h=i+4096-1 f[g]=string.char(table.unpack(d,i,h>e and e or h))end return
table.concat(f)end return ac end function a.p()local aa,ab,ac={},function(aa,ab)
return string.find(aa,ab,0,true)end,function(aa)local ab={}ab.Offset=0 ab.Source
=aa ab.Length=string.len(aa)ab.IsFinished=false ab.LastUnreadBytes=0 function ab
.read(ac,ad,ae)local b,c=ad or 1,if ae~=nil then ae else true local d=string.
sub(ac.Source,ac.Offset+1,ac.Offset+b)local e=string.len(d)local f=b-e if c then
ac:seek(b)end ac.LastUnreadBytes=f return d end function ab.seek(ac,ad)local ae=
ad or 1 ac.Offset=math.clamp(ac.Offset+ae,0,ac.Length)ac.IsFinished=ac.Offset>=
ac.Length end function ab.append(ac,ad)ac.Source..=ad ac.Length=string.len(ac.
Source)ac:seek(0)end function ab.toEnd(ac)ac:seek(ac.Length)end return ab end
function aa.compress(ad)local ae,b={},ac(ad)if b.Length>12 then local c=b:read(4
)local d,e,f,g,h=c,c,'','',true repeat h=true local i=b:read()if ab(d,i)then
local j=b:read(3,false)if string.len(j)<3 then g=i..j b:seek(3)else f=i..j local
k=ab(d,f)if k then b:seek(3)repeat local l=b:read(1,false)local m=f..l local n=
ab(d,m)if n then f=m k=n b:seek(1)end until not ab(d,m)or b.IsFinished local l,m
=string.len(f),true if b.Length-b.Offset<=5 then g=f m=false end if m then h=
false local n=string.len(d)-k d=d..f table.insert(ae,{Literal=e,LiteralLength=
string.len(e),MatchOffset=n+1,MatchLength=l})e=''end else g=i end end else g=i
end if h then e=e..g d=d..i end until b.IsFinished table.insert(ae,{Literal=e,
LiteralLength=string.len(e)})else local c=b.Source ae[1]={Literal=c,
LiteralLength=string.len(c)}end local c=string.rep('\0',4)local d=function(d)c=c
..d end for e,f in ae do local g,h=f.LiteralLength,(f.MatchLength or 4)-4 local
i,j=math.clamp(g,0,15),math.clamp(h,0,15)local k=bit32.lshift(i,4)+j d(string.
pack('<I1',k))if g>=15 then g=g-15 repeat local l=math.clamp(g,0,0xff)d(string.
pack('<I1',l))if l==0xff then g=g-255 end until l<0xff end d(f.Literal)if e~=#ae
then d(string.pack('<I2',f.MatchOffset))if h>=15 then h=h-15 repeat local l=math
.clamp(h,0,0xff)d(string.pack('<I1',l))if l==0xff then h=h-255 end until l<0xff
end end end local e,f=string.len(c)-4,b.Length return string.pack('<I4',e)..
string.pack('<I4',f)..c end function aa.decompress(ad)local ae=ac(ad)local b,c=
string.unpack('<I4',ae:read(4)),string.unpack('<I4',ae:read(4))if b==0 then
return ae:read(c)end local d=ac''repeat local e=string.byte(ae:read())local f,g=
bit32.rshift(e,4),bit32.band(e,15)+4 if f>=15 then repeat local h=string.byte(ae
:read())f+=h until h~=0xff end local h=ae:read(f)d:append(h)d:toEnd()if d.Length
<c then local i=string.unpack('<I2',ae:read(2))if g>=19 then repeat local j=
string.byte(ae:read())g+=j until j~=0xff end d:seek(-i)local j,k,l,m=d.Offset,d:
read(g),(d.LastUnreadBytes)if l then repeat d.Offset=j m=d:read(l)l=d.
LastUnreadBytes k..=m until l<=0 end d:append(k)d:toEnd()end until d.Length>=c
return d.Source end return aa end function a.q()local aa,ab,ac,ad={99,124,119,
123,242,107,111,197,48,1,103,43,254,215,171,118,202,130,201,125,250,89,71,240,
173,212,162,175,156,164,114,192,183,253,147,38,54,63,247,204,52,165,229,241,113,
216,49,21,4,199,35,195,24,150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,
110,90,160,82,59,214,179,41,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57
,74,76,88,207,208,239,170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,
143,146,157,56,245,188,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,
167,126,61,100,93,25,115,96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219
,224,50,58,10,73,6,36,92,194,211,172,98,145,149,228,121,231,200,55,109,141,213,
78,169,108,86,244,234,101,122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,
75,189,139,138,112,62,181,102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,
152,17,105,217,142,148,155,30,135,233,206,85,40,223,140,161,137,13,191,230,66,
104,65,153,45,15,176,84,187,22},{82,9,106,213,48,54,165,56,191,64,163,158,129,
243,215,251,124,227,57,130,155,47,255,135,52,142,67,68,196,222,233,203,84,123,
148,50,166,194,35,61,238,76,149,11,66,250,195,78,8,46,161,102,40,217,36,178,118,
91,162,73,109,139,209,37,114,248,246,100,134,104,152,22,212,164,92,204,93,101,
182,146,108,112,72,80,253,237,185,218,94,21,70,87,167,141,157,132,144,216,171,0,
140,188,211,10,247,228,88,5,184,179,69,6,208,44,30,143,202,63,15,2,193,175,189,3
,1,19,138,107,58,145,17,65,79,103,220,234,151,242,207,206,240,180,230,115,150,
172,116,34,231,173,53,133,226,249,55,232,28,117,223,110,71,241,26,113,29,41,197,
137,111,183,98,14,170,24,190,27,252,86,62,75,198,210,121,32,154,219,192,254,120,
205,90,244,31,221,168,51,136,7,199,49,177,18,16,89,39,128,236,95,96,81,127,169,
25,181,74,13,45,229,122,159,147,201,156,239,160,224,59,77,174,42,245,176,200,235
,187,60,131,83,153,97,23,43,4,126,186,119,214,38,225,105,20,99,85,33,12,125},{0,
1,2,4,8,16,32,64,128,27,54,108,216,171,77,154,47,94,188,99,198,151,53,106,212,
179,125,250,239,197,145,57},function(aa)local ab=bit32.lshift(aa,1)return if
bit32.band(aa,128)==0 then ab else bit32.bxor(ab,27)%256 end local ae,b,c,d,e,f,
g=function(ae,b)b=if b then ab else aa for c=1,4 do for d=1,4 do ae[c][d]=b[ae[c
][d]+1]end end end,function(ae,b)ae[1][3],ae[2][3],ae[3][3],ae[4][3]=ae[3][3],ae
[4][3],ae[1][3],ae[2][3]if b then ae[1][2],ae[2][2],ae[3][2],ae[4][2]=ae[4][2],
ae[1][2],ae[2][2],ae[3][2]ae[1][4],ae[2][4],ae[3][4],ae[4][4]=ae[2][4],ae[3][4],
ae[4][4],ae[1][4]else ae[1][2],ae[2][2],ae[3][2],ae[4][2]=ae[2][2],ae[3][2],ae[4
][2],ae[1][2]ae[1][4],ae[2][4],ae[3][4],ae[4][4]=ae[4][4],ae[1][4],ae[2][4],ae[3
][4]end end,function(ae,b)for c=1,4 do for d=1,4 do ae[c][d]=bit32.bxor(ae[c][d]
,b[c][d])end end end,function(ae,b)local c,d if b then for e=1,4 do c=ad(ad(
bit32.bxor(ae[e][1],ae[e][3])))d=ad(ad(bit32.bxor(ae[e][2],ae[e][4])))ae[e][1],
ae[e][2]=bit32.bxor(ae[e][1],c),bit32.bxor(ae[e][2],d)ae[e][3],ae[e][4]=bit32.
bxor(ae[e][3],c),bit32.bxor(ae[e][4],d)end end local e for f=1,4 do e=ae[f]c,d=
bit32.bxor(e[1],e[2],e[3],e[4]),e[1]for g=1,4 do e[g]=bit32.bxor(e[g],c,ad(bit32
.bxor(e[g],e[g+1]or d)))end end end,function(ae,b,c)if c then table.move(b[1],1,
4,1,ae)table.move(b[2],1,4,5,ae)table.move(b[3],1,4,9,ae)table.move(b[4],1,4,13,
ae)else for d=1,#b/4 do table.clear(ae[d])table.move(b,d*4-3,d*4,1,ae[d])end end
return ae end,function(ae,b,c)table.clear(ae)for d=1,math.min(#b,#c)do table.
insert(ae,bit32.bxor(b[d],c[d]))end return ae end,function(ae,b)local c=true for
d=if b then 1 else#ae,if b then#ae else 1,if b then 1 else-1 do if ae[d]==255
then ae[d]=0 else ae[d]+=1 c=false break end end return c,ae end local h,i,j,k=
function(h)local i,j,k,l,m=e(if#h==16 then{{},{},{},{}}elseif#h==24 then{{},{},{
},{},{},{}}else{{},{},{},{},{},{},{},{}},h),#h/4,2,{}while#i<(#h/4+7)*4 do m=
table.clone(i[#i])if#i%j==0 then table.insert(m,table.remove(m,1))for n=1,4 do m
[n]=aa[m[n]+1]end m[1]=bit32.bxor(m[1],ac[k])k+=1 elseif#h==32 and#i%j==4 then
for n=1,4 do m[n]=aa[m[n]+1]end end table.clear(l)f(m,table.move(m,1,4,1,l),i[#i
-j+1])table.insert(i,m)end table.clear(l)for n=1,#i/4 do table.insert(l,{})table
.move(i,n*4-3,n*4,1,l[#l])end return l end,function(h,i,j,k,l)e(k,j)c(k,i[1])for
m=2,#h/4+6 do ae(k)b(k)d(k)c(k,i[m])end ae(k)b(k)c(k,i[#i])return e(l,k,true)end
,function(h,i,j,k,l)e(k,j)c(k,i[#i])b(k,true)ae(k,true)for m=#h/4+6,2,-1 do c(k,
i[m])d(k,true)b(k,true)ae(k,true)end c(k,i[1])return e(l,k,true)end,function(h)
if type(h)=='string'then local i={}for j=1,string.len(h),7997 do table.move({
string.byte(h,j,j+7996)},1,7997,j,i)end return i elseif type(h)=='table'then for
i,j in ipairs(h)do assert(type(j)=='number'and math.floor(j)==j and 0<=j and j<
256,'Unable to cast value to bytes')end return h else error
'Unable to cast value to bytes'end end local l=function(l,m,n,o,p)l=k(l)assert(#
l==16 or#l==24 or#l==32,'Key must be either 16, 24 or 32 bytes long')m=k(m)
assert(#m%(p or 16)==0,'Input must be a multiple of '..(if p then'segment size '
..p else'16')..' bytes in length')if n then if type(o)=='table'then o=table.
clone(o)local q,r=o.Length,o.LittleEndian assert(type(q)=='number'and 0<q and q
<=16,'Counter value length must be between 1 and 16 bytes')o.Prefix=k(o.Prefix
or{})o.Suffix=k(o.Suffix or{})assert(#o.Prefix+#o.Suffix+q==16,
'Counter must be 16 bytes long')o.InitValue=if o.InitValue==nil then{1}else
table.clone(k(o.InitValue))assert(#o.InitValue<=q,
'Initial value length must be of the counter value')o.InitOverflow=if o.
InitOverflow==nil then table.create(q,0)else table.clone(k(o.InitOverflow))
assert(#o.InitOverflow<=q,
'Initial overflow value length must be of the counter value')for s=1,q-#o.
InitValue do table.insert(o.InitValue,1+if r then#o.InitValue else 0,0)end for s
=1,q-#o.InitOverflow do table.insert(o.InitOverflow,1+if r then#o.InitOverflow
else 0,0)end elseif type(o)~='function'then local q,r=if o then k(o)else table.
create(16,0),{}assert(#q==16,'Counter must be 16 bytes long')o={Length=16,Prefix
=r,Suffix=r,InitValue=q,InitOverflow=table.create(16,0)}end elseif n==false then
o=if o==nil then table.create(16,0)else k(o)assert(#o==16,
'Initialization vector must be 16 bytes long')end if p then p=math.floor(
tonumber(p)or 1)assert(type(p)=='number'and 0<p and p<=16,
'Segment size must be between 1 and 16 bytes')end return l,m,h(l),o,p end return
{encrypt_ECB=function(m,n)local o m,n,o=l(m,n)local p,q,r,s={},{},{{},{},{},{}},
{}for t=1,#n,16 do table.move(n,t,t+15,1,q)table.move(i(m,o,q,r,s),1,16,t,p)end
return p end,decrypt_ECB=function(m,n)local o m,n,o=l(m,n)local p,q,r,s={},{},{{
},{},{},{}},{}for t=1,#n,16 do table.move(n,t,t+15,1,q)table.move(j(m,o,q,r,s),1
,16,t,p)end return p end,encrypt_CBC=function(m,n,o)local p m,n,p,o=l(m,n,false,
o)local q,r,s,t,v={},{},o,{{},{},{},{}},{}for w=1,#n,16 do table.move(n,w,w+15,1
,r)table.move(i(m,p,f(v,r,s),t,s),1,16,w,q)end return q end,decrypt_CBC=function
(m,n,o)local p m,n,p,o=l(m,n,false,o)local q,r,s,t,v={},{},o,{{},{},{},{}},{}for
w=1,#n,16 do table.move(n,w,w+15,1,r)table.move(f(r,j(m,p,r,t,v),s),1,16,w,q)
table.move(n,w,w+15,1,s)end return q end,encrypt_PCBC=function(m,n,o)local p m,n
,p,o=l(m,n,false,o)local q,r,s,t,v,w={},{},o,table.create(16,0),{{},{},{},{}},{}
for y=1,#n,16 do table.move(n,y,y+15,1,r)table.move(i(m,p,f(r,f(w,s,r),t),v,s),1
,16,y,q)table.move(n,y,y+15,1,t)end return q end,decrypt_PCBC=function(m,n,o)
local p m,n,p,o=l(m,n,false,o)local q,r,s,t,v,w={},{},o,table.create(16,0),{{},{
},{},{}},{}for y=1,#n,16 do table.move(n,y,y+15,1,r)table.move(f(t,j(m,p,r,v,w),
f(r,s,t)),1,16,y,q)table.move(n,y,y+15,1,s)end return q end,encrypt_CFB=function
(m,n,o,p)local q m,n,q,o,p=l(m,n,false,o,if p==nil then 1 else p)local r,s,t,v,w
,y={},{},o,{},{{},{},{},{}},{}for z=1,#n,p do table.move(n,z,z+p-1,1,s)table.
move(f(v,i(m,q,t,w,y),s),1,p,z,r)for A=16,p+1,-1 do table.insert(v,1,t[A])end
table.move(v,1,16,1,t)end return r end,decrypt_CFB=function(m,n,o,p)local q m,n,
q,o,p=l(m,n,false,o,if p==nil then 1 else p)local r,s,t,v,w,y={},{},o,{},{{},{},
{},{}},{}for z=1,#n,p do table.move(n,z,z+p-1,1,s)table.move(f(v,i(m,q,t,w,y),s)
,1,p,z,r)for A=16,p+1,-1 do table.insert(s,1,t[A])end table.move(s,1,16,1,t)end
return r end,encrypt_OFB=function(m,n,o)local p m,n,p,o=l(m,n,false,o)local q,r,
s,t,v={},{},o,{{},{},{},{}},{}for w=1,#n,16 do table.move(n,w,w+15,1,r)table.
move(i(m,p,s,t,v),1,16,1,s)table.move(f(v,r,s),1,16,w,q)end return q end,
encrypt_CTR=function(m,n,o)local p m,n,p,o=l(m,n,true,o)local q,r,s,t,v,w,y={},{
},{},{{},{},{},{}},{},(type(o)=='table')for z=1,#n,16 do if w then if z>1 and g(
o.InitValue,o.LittleEndian)then table.move(o.InitOverflow,1,16,1,o.InitValue)end
table.clear(s)table.move(o.Prefix,1,#o.Prefix,1,s)table.move(o.InitValue,1,o.
Length,#s+1,s)table.move(o.Suffix,1,#o.Suffix,#s+1,s)else y=k(o(s,(z+15)/16))
assert(#y==16,'Counter must be 16 bytes long')table.move(y,1,16,1,s)end table.
move(n,z,z+15,1,r)table.move(f(s,i(m,p,s,t,v),r),1,16,z,q)end return q end}end
function a.r()local aa,ab,ac,ad,ae,b=a.load'o',a.load'p',a.load'q',buffer.
tostring,bit32.lshift(1,10),{}function b.encrypt(c,d,e)return ac.encrypt_CBC(d,c
,e)end function b.decrypt(c,d,e)return ac.decrypt_CBC(d,c,e)end function b.
base64encode(c)return aa.Encode(c)end function b.base64decode(c)return aa.
Decode(c)end function b.lz4compress(c)return ab.compress(c)end function b.
lz4decompress(c)return ab.decompress(c)end function b.random(c)if c>ae or c<0
then error('Expected number within range (0, 1024), got: '..tostring(c),0)else
local d={}for e=33,57 do table.insert(d,string.char(e))end for e=65,90 do table.
insert(d,string.char(e))end for e=97,122 do table.insert(d,string.char(e))end
local e={}for f=1,c do local g=math.random(1,#d)table.insert(e,d[g])end return
table.concat(e)end end return b end function a.s()return function()local aa=a.
load'r'if not getfenv(0).crypt or not getfenv(0).crypt.encrypt then return{
status=400,message='Global not found'}end local ab,ac,ad,ae='1234567890abcdef',
'GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY','1234567890abcdef','CBC'local b,c=pcall(
function()return crypt.encrypt(ab,ac,ad,ae)end)if not b then return{status=0,
message='Encrypt failed: '..tostring(c)}end local d,e=
'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh',aa.base64encode(c)if e~=d then return{status=
500,message="Encrypted data doesn't match reference data"}end local f,g=a.load
'b'{}if not f then return{status=501,message=`Alias not found: {g}`}end return{
status=200,message='Passed'}end end function a.t()return function()local aa=a.
load'r'if not getfenv(0).crypt or not getfenv(0).crypt.decrypt then return{
status=400,message='Global not found'}end local ab,ac,ad,ae=aa.base64decode
'G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh','GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY',
'1234567890abcdef','CBC'local b,c=pcall(function()return crypt.decrypt(ab,ac,ad,
ae)end)if not b then return{status=0,message='Decrypt failed: '..tostring(c)}
elseif not c then return{status=500,message='Decrypt returned nothing'}elseif c
~='1234567890abcdef'then return{status=500,message=
"Decrypted data doesn't match reference data"}end local d,e=a.load'b'{}if not d
then return{status=501,message=`Alias not found: {e}`}end return{status=200,
message='Passed'}end end function a.u()return function()local aa=a.load'r'if not
getfenv(0).crypt or not getfenv(0).crypt.generatekey then return{status=400,
message='Global not found'}end local ab=aa.base64decode(crypt.generatekey())if
type(ab)~='string'then return{status=500,message=
"Generated key doesn't form a string"}elseif#ab~=32 then return{status=500,
message="Key dosen't match the expected length"}end local ac,ad=a.load'b'{}if
not ac then return{status=501,message=`Alias not found: {ad}`}end return{status=
200,message='Passed'}end end function a.v()return function()local aa=a.load'r'if
not getfenv(0).crypt or not getfenv(0).crypt.generatebytes then return{status=
400,message='Global not found'}end local ab=math.random(1,512)local ac=crypt.
generatebytes(ab)local ad=aa.base64decode(ac)if type(ad)~='string'then return{
status=500,message='Generated bytes do not form a string'}elseif#ad~=ab then
return{status=500,message='Bytes length mismatch: '..tostring(#ad)..' != '..
tostring(ab)}end local ae,b=a.load'b'{'base64_decode','crypt.base64.decode',
'base64.decode','crypt.base64_decode'}if not ae then return{status=501,message=`Alias not found: {
b}`}end return{status=200,message='Passed'}end end function a.w()return function
()local aa=a.load'r'if not getfenv(0).crypt or not getfenv(0).crypt.base64encode
then return{status=400,message='Global not found'}end local ab='MYRIAD'local ac=
crypt.base64encode(ab)if not ac or typeof(ac)~='string'then return{status=500,
message='Did not return the expected type'}elseif ac~=aa.base64encode(ab)then
return{status=500,message="Encoded data doesn't match reference data"}end local
ad,ae=a.load'b'{'base64_encode','crypt.base64.encode','base64.encode',
'crypt.base64_encode'}if not ad then return{status=501,message=`Alias not found: {
ae}`}end return{status=200,message='Passed'}end end function a.x()return
function()local aa=a.load'r'if not getfenv(0).crypt or not getfenv(0).crypt.
base64decode then return{status=400,message='Global not found'}end local ab=
'MYRIAD'local ac=aa.base64encode(ab)local ad=crypt.base64decode(ac)if not ac or
typeof(ac)~='string'then return{status=500,message='Reference crypt failed'}
elseif not ad or typeof(ad)~='string'then return{status=500,message=
'Did not return the expected type'}elseif ad~=ab then return{status=500,message=
"Decoded data doesn't match reference data"}end local ae,b=a.load'b'{
'base64_decode','crypt.base64.decode','base64.decode','crypt.base64_decode'}if
not ae then return{status=501,message=`Alias not found: {b}`}end return{status=
200,message='Passed'}end end function a.y()return function()if not getfenv(0).
crypt or not getfenv(0).crypt.hash then return{status=400,message=
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
in pairs(ab)do local ae,b=pcall(crypt.hash,aa,ac)if not ae then return{status=0,
message=`Hashing failed with {ac}: {b}`}elseif not b then return{status=500,
message=`Hashing failed, expected a hash. Algorithm: {ac}`}elseif b~=ad then
return{status=500,message=`Hash mismatch. Algorithm: {ac}`}end end local ac,ad=a
.load'b'{}if not ac then return{status=501,message=`Alias not found: {ad}`}end
return{status=200,message='Passed'}end end function a.z()return function()if not
getfenv(0).crypt or not getfenv(0).crypt.random then return{status=400,message=
'Global not found'}end local aa,ab=pcall(function()return crypt.random(513)end)
local ac,ad=pcall(function()return crypt.random(-1)end)local ae,b=pcall(function
()return crypt.random(64)end)if not ae then return{status=0,message='Failed: '..
tostring(b)}elseif ac then return{status=500,message=
'Arg[1] passed -1, should have failed.'}elseif aa then return{status=500,message
='Arg[1] passed 513, should have failed.'}elseif#b~=64 then return{status=500,
message='Len mismatch. Expected 64, got: '..tostring(#b)}end local c,d=a.load'b'
{}if not c then return{status=501,message=`Alias not found: {d}`}end return{
status=200,message='Passed'}end end function a.A()return function()a.load'r'if
not getfenv(0).crypt or not getfenv(0).crypt.hmac then return{status=400,message
='Global not found'}end local aa,ab,ac,ad='MYRIAD','secret_key','sha256',
'FaDPiTSLlbxRP5rKvomt0dzwl7zhszc46/QFPsZRGWY='local ae=crypt.hmac(ab,aa,ac)if
not ae then return{status=500,message='Did not return the expected type'}elseif
ae~=ad then return{status=500,message="Data doesn't match reference data"}end
local b,c=a.load'b'{}if not b then return{status=501,message=`Alias not found: {
c}`}end return{status=200,message='Passed'}end end function a.B()return function
()if not getfenv(0).debug or not getfenv(0).debug.getconstant then return{status
=400,message='Global not found'}end local aa=function()local aa,ab=2,'A'print(aa
)tostring(ab)Date.now()end local ab,ac=pcall(debug.getconstant,aa,8)if debug.
getconstant(aa,1)~='A'then return{status=500,message=
'Constant 1 missing or unexpected value'}elseif debug.getconstant(aa,2)~='print'
then return{status=500,message='Constant 2 missing or unexpected value'}elseif
debug.getconstant(aa,3)~=nil then return{status=500,message=
'Constant 3 should be nil'}elseif debug.getconstant(aa,4)~='tostring'then return
{status=500,message='Constant 4 missing or unexpected value'}elseif debug.
getconstant(aa,5)~=nil then return{status=500,message='Constant 5 should be nil'
}elseif debug.getconstant(aa,6)~='Date'then return{status=500,message=
'Constant 6 missing or unexpected value'}elseif debug.getconstant(aa,7)~='now'
then return{status=500,message='Constant 7 missing or unexpected value'}elseif
not ab then return{status=500,message=
'Should pass nil instead of errroing for invalid indexes'}elseif ac then return{
status=500,message="Constant 8 shouldn't exist"}elseif pcall(debug.getconstant,
print,1)then return{status=500,message='Should error with C closures'}end local
ad,ae=a.load'b'{'getconstant'}if not ad then return{status=501,message=`Alias not found: {
ae}`}end return{status=200,message=`Passed`}end end function a.C()return
function()if not getfenv(0).debug or not getfenv(0).debug.getconstants then
return{status=400,message='Global not found'}end local aa=function()local aa,ab=
2,'A'print(aa)tostring(ab)Date.now()end if debug.getconstants(aa)[1]~='A'then
return{status=500,message='Constant 1 missing or unexpected value'}elseif debug.
getconstants(aa)[2]~='print'then return{status=500,message=
'Constant 2 missing or unexpected value'}elseif debug.getconstants(aa)[3]~=nil
then return{status=500,message='Constant 3 should be nil'}elseif debug.
getconstants(aa)[4]~='tostring'then return{status=500,message=
'Constant 4 missing or unexpected value'}elseif debug.getconstants(aa)[5]~=nil
then return{status=500,message='Constant 5 should be nil'}elseif debug.
getconstants(aa)[6]~='Date'then return{status=500,message=
'Constant 6 missing or unexpected value'}elseif debug.getconstants(aa)[7]~='now'
then return{status=500,message='Constant 7 missing or unexpected value'}elseif
pcall(debug.getconstants,print)then return{status=500,message=
'Should error with C closures'}end local ab,ac=a.load'b'{'getconstants'}if not
ab then return{status=501,message=`Alias not found: {ac}`}end return{status=200,
message=`Passed`}end end function a.D()return function()if not getfenv(0).debug
or not getfenv(0).debug.getproto then return{status=400,message=
'Global not found'}end local aa=function()return function()return'MYRI'end end
local ab=debug.getproto(aa,1,true)[1]if aa()~=ab then return{status=500,message=
"Actual prototype dosen't match assumed prototype"}elseif ab()~='MYRI'then
return{status=500,message='Unexpected value of assumed prototype'}end local ac,
ad=a.load'b'{'getproto'}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.E()return
function()if not getfenv(0).debug or not getfenv(0).debug.getprotos then return{
status=400,message='Global not found'}end local aa,ab=function()return function(
)return'MYRI1'end,function()return'MYRI2'end end,0 for ac,ad in ipairs(debug.
getprotos(aa))do ab+=ad()==(ac==1 and'MYRI1'or'MYRI2')and 1 or 0 end if ab~=2
then return{status=500,message=
[[Didn't recieve correct prototypes, or prototypes didn't return expected values.]]
}end local ac,ad=a.load'b'{'getprotos'}if not ac then return{status=501,message=
`Alias not found: {ad}`}end return{status=200,message=`Passed`}end end function
a.F()return function()if not getfenv(0).debug or not getfenv(0).debug.getupvalue
then return{status=400,message='Global not found'}end local aa,ab=a.load'b'{
'getupvalue'}if not aa then return{status=501,message=`Alias not found: {ab}`}
end return{status=200,message=`Passed`}end end function a.G()return function()if
not getfenv(0).debug or not getfenv(0).debug.getupvalues then return{status=400,
message='Global not found'}end local aa,ab=a.load'b'{'getupvalues'}if not aa
then return{status=501,message=`Alias not found: {ab}`}end return{status=200,
message=`Passed`}end end function a.H()return function()if not getfenv(0).debug
or not getfenv(0).debug.getstack then return{status=400,message=
'Global not found'}end local aa,ab=a.load'b'{'getstack'}if not aa then return{
status=501,message=`Alias not found: {ab}`}end return{status=200,message=`Passed`
}end end function a.I()return function()if not getfenv(0).debug or not getfenv(0
).debug.setconstant then return{status=400,message='Global not found'}end local
aa,ab=a.load'b'{'setconstant'}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.J()return
function()if not getfenv(0).debug or not getfenv(0).debug.setupvalue then return
{status=400,message='Global not found'}end local aa,ab=a.load'b'{'setupvalue'}if
not aa then return{status=501,message=`Alias not found: {ab}`}end return{status=
200,message=`Passed`}end end function a.K()return function()if not getfenv(0).
Drawing or not getfenv(0).Drawing.new then return{status=400,message=
'Global Drawing API not found'}end local aa=function(aa,ab,ac)for ad,ae in
ipairs(ac)do local b,c=pcall(function()return ab[ae]end)if not b or c==nil then
return{status=500,message=`{aa} is missing property: {ae} (Did you give it a default value?)`
}end ab:Destroy()end end do local ab=Drawing.new'Line'if not ab then return{
status=500,message='Line drawing object not found'}end local ac=aa('Line',ab,{
'Visible','ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy',
'Thickness','From','To'})if ac then return ac end end do local ab=Drawing.new
'Text'if not ab then return{status=500,message='Text drawing object not found'}
end local ac=aa('Text',ab,{'Visible','ZIndex','Transparency','Color',
'__OBJECT_EXISTS','Destroy','Text','TextBounds','Center','Size','Font','Outline'
,'OutlineColor','Position'})if ac then return ac end end do local ab=Drawing.new
'Image'if not ab then return{status=500,message='Image drawing object not found'
}end local ac=aa('Image',ab,{'Visible','ZIndex','Transparency','Color',
'__OBJECT_EXISTS','Destroy','Data','Size','Position'})if ac then return ac end
end do local ab=Drawing.new'Circle'if not ab then return{status=500,message=
'Circle drawing object not found'}end local ac=aa('Circle',ab,{'Visible',
'ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy','NumSides','Radius',
'Position','Thickness','Filled'})if ac then return ac end end do local ab=
Drawing.new'Square'if not ab then return{status=500,message=
'Square drawing object not found'}end local ac=aa('Square',ab,{'Visible',
'ZIndex','Transparency','Color','__OBJECT_EXISTS','Destroy','Size','Position',
'Thickness','Filled'})if ac then return ac end end do local ab=Drawing.new'Quad'
if not ab then return{status=500,message='Quad drawing object not found'}end
local ac=aa('Quad',ab,{'Destroy','Visible','ZIndex','Transparency','Color',
'__OBJECT_EXISTS','PointA','PointB','PointC','PointD','Thickness','Filled'})if
ac then return ac end end do local ab=Drawing.new'Triangle'if not ab then return
{status=500,message='Triangle drawing object not found'}end local ac=aa(
'Triangle',ab,{'Destroy','Visible','ZIndex','Transparency','Color',
'__OBJECT_EXISTS','PointA','PointB','PointC','Thickness','Filled'})if ac then
return ac end end local ab,ac,ad,ae,b,c=math.random(1,255),math.random(1,255),
math.random(1,255),gethui and gethui()or game:GetService'CoreGui',game:
GetService'CoreGui',Drawing.new'Line'c.Color=Color3.fromRGB(ab,ac,ad)c.
Transparency=1-ab/255 if ae then for d,e in pairs(ae:GetDescendants())do if e:
IsA'Frame'and e.BackgroundColor3==c.Color and e.BackgroundTransparency==c.
Transparency then return{status=500,message=
'Drawing library almost certainly depends on ScreenGui'}end end end if b then
for d,e in pairs(b:GetDescendants())do if e:IsA'Frame'and e.BackgroundColor3==c.
Color and e.BackgroundTransparency==c.Transparency then return{status=500,
message='Drawing library almost certainly depends on ScreenGui'}end end end
local d,e=a.load'b'{}if not d then return{status=501,message=`Alias not found: {
e}`}end return{status=200,message='Passed'}end end function a.L()return function
()if not getfenv(0).Drawing or not getfenv(0).Drawing.Fonts then return{status=
400,message='Global not found'}end if not Drawing.Fonts.UI then return{status=
500,message='UI font not found'}elseif not Drawing.Fonts.System then return{
status=500,message='System font not found'}elseif not Drawing.Fonts.Plex then
return{status=500,message='Plex font not found'}elseif not Drawing.Fonts.
Monospace then return{status=500,message='Monospace font not found'}elseif
Drawing.Fonts.UI~=0 then return{status=500,message="UI font isn't ID 0"}elseif
Drawing.Fonts.System~=1 then return{status=500,message="System font isn't ID 1"}
elseif Drawing.Fonts.Plex~=2 then return{status=500,message=
"Plex font isn't ID 2"}elseif Drawing.Fonts.Monospace~=3 then return{status=500,
message="Monospace font isn't ID 3"}end local aa,ab=a.load'b'{}if not aa then
return{status=501,message=`Alias not found: {ab}`}end return{status=200,message=
`Passed`}end end function a.M()return function()if not getfenv(0).
getrenderproperty then return{status=400,message='Global not found'}elseif not
getfenv(0).Drawing or not getfenv(0).Drawing.new then return{status=401,message=
'Drawing library needed to test this'}end local aa=Drawing.new'Line'aa.Thickness
=2 aa.Visible=false local ab,ac=getrenderproperty(aa,'Thickness'),
getrenderproperty(aa,'Visible')if ab~=2 or ac~=false then return{status=500,
message='Property not found or mismatch'}end local ad,ae=a.load'b'{}if not ad
then return{status=501,message=`Alias not found: {ae}`}end return{status=200,
message=`Passed`}end end function a.N()return function()if not getfenv(0).
setrenderproperty then return{status=400,message='Global not found'}elseif not
getfenv(0).Drawing or not getfenv(0).Drawing.new then return{status=401,message=
'Drawing library needed to test this'}end local aa=Drawing.new'Line'
setrenderproperty(aa,'Thickness',2)setrenderproperty(aa,'Visible',false)if aa.
Thickness~=2 or aa.Visible~=false then return{status=500,message=
'Incorrect property value'}end local ab,ac=a.load'b'{}if not ab then return{
status=501,message=`Alias not found: {ac}`}end return{status=200,message=`Passed`
}end end function a.O()return function()if not getfenv(0).cleardrawcache then
return{status=400,message='Global not found'}elseif not getfenv(0).Drawing or
not getfenv(0).Drawing.new then return{status=401,message=
'Drawing library needed to test this'}end local aa=Drawing.new'Line'aa.Visible=
false aa.Thickness=2 task.defer(cleardrawcache)task.wait(0.1)if aa.
__OBJECT_EXISTS then return{status=500,message='Drawing exists after draw clear'
}end local ab,ac=a.load'b'{}if not ab then return{status=501,message=`Alias not found: {
ac}`}end return{status=200,message=`Passed`}end end function a.P()return
function()if not getfenv(0).isrenderobj then return{status=400,message=
'Global not found'}elseif not getfenv(0).Drawing or not getfenv(0).Drawing.new
then return{status=401,message='Drawing library needed to test this'}end local
aa=Drawing.new'Line'aa.Visible=false if not isrenderobj(aa)then return{status=
500,message="Didn't return true for a render object"}elseif isrenderobj{}or
isrenderobj(game:GetService'Workspace')then return{status=500,message=
'Returned true for a non-render object'}end local ab,ac=a.load'b'{}if not ab
then return{status=501,message=`Alias not found: {ac}`}end return{status=200,
message=`Passed`}end end function a.Q()return function()if not getfenv(0).
getgenv then return{status=400,message='Global not found'}end getfenv().MYRI=
'Hello, World!'getgenv().MYRI1='Hello, World!'getgenv().MYRI2=123456789 if
getgenv().MYRI=='Hello, World!'then return{status=500,message=
'getfenv affected getgenv'}end if getgenv().MYRI1~='Hello, World!'then return{
status=500,message='MYRI1 not found or unexpected value'}elseif getgenv().MYRI2
~=123456789 then return{status=500,message='MYRI2 not found or unexpected value'
}end local aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.R()return
function()if not getfenv(0).getrenv then return{status=400,message=
'Global not found'}end getrenv().MYRIR1='Hello, World!'getrenv().MYRIR2=
123456789 if getrenv().MYRIR1~='Hello, World!'then return{status=500,message=
'MYRIR1 not found or unexpected value'}elseif getrenv().MYRIR2~=123456789 then
return{status=500,message='MYRIR2 not found or unexpected value'}elseif getrenv(
).game~=game then return{status=500,message='game not found or unexpected value'
}elseif getrenv().print~=print then return{status=500,message=
'print not found or unexpected value'}elseif getrenv()._G==_G then return{status
=500,message="_G in roblox environment shouldn't match the executor's"}end local
aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {ab}`
}end return{status=200,message=`Passed`}end end function a.S()return function()
if not getfenv(0).getgc then return{status=400,message='Global not found'}end
local aa,ab={},function()end task.wait(0.1)local ac,ad for ae,b in pairs(getgc(
true))do if b==ab then ac=true elseif b==aa then ad=true end end if not ac then
return{status=500,message='Original function not found'}elseif not ad then
return{status=500,message='Original table not found'}end local ae,b=a.load'b'{}
if not ae then return{status=501,message=`Alias not found: {b}`}end return{
status=200,message=`Passed`}end end function a.T()return function()if not
getfenv(0).filtergc then return{status=400,message='Global not found'}end local
aa='MYRIAD'local ab,ac=function()return'MYRIAD',aa end,setmetatable({MYRIAD=
'MYRI'},{__index=function()end})do local ad=ac.MYRIAD ab()end task.wait(0.1)
local ad,ae=filtergc('function',{Constants={'MYRIAD'},Upvalues={'MYRIAD'},
IgnoreExecutor=false},true),filtergc('table',{KeyValuePairs={MYRIAD='MYRI'},
Metatable=getmetatable(ac)},true)if ad~=ab then return{status=500,message=
'filtergc failed to retrieve the original function'}elseif ae~=ac then return{
status=500,message='filtergc failed to retrieve the original table'}end local b,
c=a.load'b'{}if not b then return{status=501,message=`Alias not found: {c}`}end
return{status=200,message='Passed'}end end function a.U()return function()if not
getfenv(0).writefile then return{status=400,message='Global not found'}elseif
not getfenv(0).delfile then return{status=401,message=
"Dependency 'delfile' not found"}end local aa,ab=pcall(writefile,'test1.txt',
'Content')local ac,ad=pcall(writefile,'./test2.txt','Content')local ae,b=pcall(
writefile,'C:/test3.txt','Content'),pcall(writefile,'../test4.txt','Content')if
not aa then return{status=0,message='Failed to write @ test1.txt: '..ab}elseif
not ac then return{status=0,message='Failed to write @ ./test2.txt: '..ad}elseif
ae then return{status=0,message=
"Didn't fail to write in illegal location: @ C:/test3.txt"}elseif b then return{
status=0,message="Didn't fail to write in illegal location: @ ../test4.txt"}end
delfile'test1.txt'delfile'./test2.txt'local c,d=a.load'b'{}if not c then return{
status=501,message=`Alias not found: {d}`}end return{status=200,message=`Passed`
}end end function a.V()return function()if not getfenv(0).readfile then return{
status=400,message='Global not found'}elseif not getfenv(0).delfile then return{
status=401,message="Dependency 'delfile' not found"}elseif not getfenv(0).
writefile then return{status=401,message="Dependency 'writefile' not found"}end
local aa,ab=pcall(writefile,'test1.txt','Content')if not aa then return{status=0
,message='Failed to write @ test1.txt: '..ab}elseif readfile'test1.txt'~=
'Content'then return{status=0,message="File didn't return the expected content"}
end delfile'test1.txt'local ac,ad=a.load'b'{}if not ac then return{status=501,
message=`Alias not found: {ad}`}end return{status=200,message=`Passed`}end end
function a.W()return function()if not getfenv(0).makefolder then return{status=
400,message='Global not found'}elseif not getfenv(0).delfolder then return{
status=401,message="Dependency 'delfolder' not found"}end local aa,ab=pcall(
makefolder,'test1')local ac,ad=pcall(makefolder,'./test2')local ae,b=pcall(
makefolder,'C:/test3'),pcall(makefolder,'../test4')if not aa then return{status=
0,message='Failed to make @ test1: '..ab}elseif not ac then return{status=0,
message='Failed to make @ ./test2: '..ad}elseif ae then return{status=0,message=
"Didn't fail to make in illegal location: @ C:/test3"}elseif b then return{
status=0,message="Didn't fail to make in illegal location: @ ../test4"}end
delfolder'test1.txt'delfolder'./test2.txt'local c,d=a.load'b'{}if not c then
return{status=501,message=`Alias not found: {d}`}end return{status=200,message=`Passed`
}end end function a.X()return function()if not getfenv(0).setclipboard then
return{status=400,message='Global not found'}end local aa,ab=a.load'b'{
'toclipboard'}if not aa then return{status=501,message=`Alias not found: {ab}`}
end return{status=200,message=`Passed`}end end function a.Y()return function()if
not getfenv(0).setrbxclipboard then return{status=400,message='Global not found'
}end local aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.Z()return
function()if not getfenv(0).gethui then return{status=400,message=
'Global not found'}end local aa=gethui()if not(aa:IsA'ScreenGui'or aa:IsA
'BasePlayerGui'or aa:IsA'Folder')then return{status=500,message=
'Container is not a ScreenGui, BasePlayerGui, or Folder'}end if aa==game:
GetService'CoreGui'then return{status=500,message=
'Container cannot be an uncloned reference to CoreGui'}end local ab,ac=a.load'b'
{'get_hidden_gui'}if not ab then return{status=501,message=`Alias not found: {ac
}`}end return{status=200,message=`Passed`}end end function a._()return function(
)if not getfenv(0).cloneref then return{status=400,message='Global not found'}
end local aa,ab=Instance.new'Part',game:GetService'CoreGui'if cloneref(aa)==aa
then return{status=500,message=`Cloned part cannot be equal to original reference`
}elseif cloneref(ab)==ab then return{status=500,message=`Cloned service cannot be equal to original reference`
}end local ac,ad=a.load'b'{'clonereference'}if not ac then return{status=501,
message=`Alias not found: {ad}`}end return{status=200,message=`Passed`}end end
function a.aa()return function()if not getfenv(0).compareinstances then return{
status=400,message='Global not found'}elseif not getfenv(0).cloneref then return
{status=401,message="'cloneref' needed to test this reliably"}end local aa,ab=
Instance.new'Part',game:GetService'CoreGui'if cloneref(aa)==aa then return{
status=500,message=`(CR) Cloned part cannot be equal to original reference`}
elseif cloneref(ab)==ab then return{status=500,message=`(CR) Cloned service cannot be equal to original reference`
}elseif not compareinstances(game,game)then return{status=500,message=`Two equal instances (game, game) assumed unequal`
}elseif compareinstances(game,workspace)then return{status=500,message=`Two unequal instances (game, workspace) assumed equal`
}elseif not compareinstances(aa,cloneref(aa))then return{status=500,message=`Two equal instances (originalPart, clonedPart) assumed equal`
}elseif not compareinstances(ab,cloneref(ab))then return{status=500,message=`Two equal instances (originalService, clonedService) assumed equal`
}end local ac,ad=a.load'b'{}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message=`Passed`}end end function a.ab()return
function()if not getfenv(0).fireclickdetector then return{status=400,message=
'Global not found'}end local aa=Instance.new'ClickDetector'local ab=function(ab)
aa[ab]:Connect(function(ac)if ac~=game:GetService'Players'.LocalPlayer then
return{status=500,message="Player passed wasn't the LocalPlayer"}end end)local
ac,ad=fireclickdetector(aa,0,ab)if not ac then return{status=0,message=`Failed w/ error: {
ad}`}end end ab'MouseClick'ab'RightMouseClick'ab'MouseHoverEnter'ab
'MouseHoverLeave'local ac,ad=a.load'b'{}if not ac then return{status=501,message
=`Alias not found: {ad}`}end return{status=200,message=`Passed`}end end function
a.ac()return function()if not getfenv(0).fireproximityprompt then return{status=
400,message='Global not found'}end local aa,ab=game:GetService
'ProximityPromptService',Instance.new'ProximityPrompt'ab.HoldDuration=2 aa.
PromptButtonHoldBegan:Connect(function(ac)return{status=500,message=
'Proximity prompt was manually fired'}end)aa.PromptButtonHoldEnded:Connect(
function(ac)return{status=500,message='Proximity prompt was manually fired'}end)
ab:GetPropertyChangedSignal'HoldDuration':Connect(function()return{status=500,
message='Modified HoldDuration'}end)ab.Triggered:Connect(function(ac)if ac~=
LocalPlayer then return{status=500,message=
"Player passed wasn't the LocalPlayer"}end end)local ac,ad=pcall(
fireproximityprompt,ab)if not ac then return{status=0,message=`Failed w/ error: {
ad}`}end local ae,b=a.load'b'{}if not ae then return{status=501,message=`Alias not found: {
b}`}end return{status=200,message=`Passed`}end end function a.ad()return
function()if not getfenv(0).saveinstance then return{status=400,message=
'Global not found'}elseif not getfenv(0).listfiles then return{status=501,
message="Dependant global 'listfiles' not found"}elseif not getfenv(0).delfile
then return{status=501,message="Dependant global 'delfile' not found"}end local
aa,ab=game:GetService'HttpService':GenerateGUID(false):gsub('-',''),Instance.new
'Part'ab.Name=aa saveinstance(ab)task.wait(0.5)local ac=false for ad,ae in
pairs(listfiles'')do if ae:find(aa)then ac=true delfile(ae)end end if not ac
then return{status=500,message=
[[Couldn't find saved part. Do you include the instance's name?]]}end local ad,
ae=a.load'b'{}if not ad then return{status=501,message=`Alias not found: {ae}`}
end return{status=200,message=`Passed`}end end function a.ae()return function()
if not getfenv(0).getrawmetatable then return{status=400,message=
'Global not found'}end local aa=getrawmetatable(game)if typeof(aa)~='table'then
return{status=500,message="Didn't return a table"}elseif aa.__index(game,
'Workspace')~=game:GetService'Workspace'then return{status=500,message=
"Didn't give correct index for Workspace"}elseif aa.__index(game,
'ReplicatedStorage')~=game:GetService'ReplicatedStorage'then return{status=500,
message="Didn't give correct index for ReplicatedStorage"}elseif aa.__index(game
,'Stats')~=game:GetService'Stats'then return{status=500,message=
"Didn't give correct index for Stats"}end local ab,ac=a.load'b'{}if not ab then
return{status=501,message=`Alias not found: {ac}`}end return{status=200,message=
`Passed`}end end function a.af()return function()if not getfenv(0).
setrawmetatable then return{status=400,message='Global not found'}end local aa=
setmetatable({},{__index=function()return false end,__metatable='Locked'})local
ab=setrawmetatable(aa,{__index=function()return true end})if not aa then return{
status=500,message='Original object not given'}elseif aa.MYRI~=true then return{
status=500,message='Return function gave true, MYRI not found'}elseif not ab
then return{status=500,message='Returned object not given'}elseif ab==aa then
return{status=500,message='Returned object is the same as original (???)'}end
local ac,ad=a.load'b'{}if not ac then return{status=501,message=`Alias not found: {
ad}`}end return{status=200,message='Passed'}end end function a.ag()return
function()if not getfenv(0).setreadonly then return{status=400,message=
'Global not found'}end local aa=table.freeze{MYRIAD='MYRI'}local ab,ac=pcall(
function()aa.MYRIAD='MYRIAD'end)local ad,ae=pcall(function()setreadonly(aa,false
)aa.MYRIAD='MYRIAD'end)local b,c=pcall(function()setreadonly(aa,true)aa.MYRIAD=
'MYRIAD'end)if ab then return{status=500,message='Frozen table writable (???): '
..c}elseif not ad then return{status=500,message=
'Table unwritable after readonly was disabled: '..c}elseif b then return{status=
500,message='Table writable after readonly was enabled: '..c}end local d,e=a.
load'b'{}if not d then return{status=501,message=`Alias not found: {e}`}end
return{status=200,message=`Passed`}end end function a.ah()return function()if
not getfenv(0).isreadonly then return{status=400,message='Global not found'}
elseif not getfenv(0).setreadonly then return{status=401,message=
"Dependency 'setreadonly' not found"}end local aa={}if isreadonly(aa)then return
{status=500,message='Writable table is assumed read-only'}end setreadonly(aa,
true)if not isreadonly(aa)then return{status=500,message=
'Table assumed writable after being set as read-only'}end local ab,ad=a.load'b'{
}if not ab then return{status=501,message=`Alias not found: {ad}`}end return{
status=200,message=`Passed`}end end function a.ai()return function()if not
getfenv(0).identifyexecutor then return{status=400,message='Global not found'}
end local aa,ab=identifyexecutor()if not aa or not ab then return{status=500,
message=`Did not return expected data (executor, version)`}elseif type(aa)~=
'string'or type(ab)~='string'then return{status=500,message=`Expected [string, string] got [{
aa}, {ab}]`}end local ad,b=a.load'b'{'getexecutorname'}if not ad then return{
status=501,message=`Alias not found: {b}`}end return{status=200,message=`Passed ({
aa}, {ab})`}end end function a.aj()return function()if not getfenv(0).setfpscap
then return{status=400,message='Global not found'}end local aa=game:GetService
'RunService'.RenderStepped local ab=function()aa:Wait()local ab=0 for ad=1,10 do
ab+=1/aa:Wait()end return math.round(ab/10)end setfpscap(60)local ad=ab()
setfpscap(0)local b,c,d=ab(),a.load'b'{}if not c then return{status=501,message=
`Alias not found: {d}`}end return{status=200,message=`Passed ({ad..
'fps @60 \u{2022} '..b..'fps @0'})`}end end function a.ak()return function()if
not getfenv(0).getfpscap then return{status=400,message='Global not found'}end
if typeof(getfpscap())~='number'then return{status=500,message=`Did not return a number`
}end local aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.al()return
function()if not getfenv(0).request then return{status=400,message=
'Global not found'}end local aa=request{Url='https://httpbin.org/user-agent',
Method='GET'}if typeof(aa)~='table'then return{status=500,message=
"Reponse wasn't a table"}elseif aa.StatusCode~=200 then return{status=500,
message="Didn't give status 200 (is httpbin.org down?)"}end local ab=game:
GetService'HttpService':JSONDecode(aa.Body)if type(ab)~='table'and type(ab[
'user-agent'])~='string'then return{status=500,message=
"Didn't give a table w/ user-agent string"}end local ad,b=a.load'b'{
'http.request','http_request'}if not ad then return{status=501,message=`Alias not found: {
b}`}end return{status=200,message=`Passed ({ab['user-agent']})`}end end function
a.am()return function()local aa=a.load'r'if not getfenv(0).lz4compress then
return{status=400,message='Global not found'}end local ab,ad='MYRIAD',aa.
base64decode'YE1ZUklBRA=='local b=lz4compress(ab)if typeof(b)~='string'then
return{status=500,message='Did not return the expected type'}elseif b~=ad then
return{status=500,message="Compressed data doesn't match reference data"}end
local c,d=a.load'b'{'crypt.lz4compress'}if not c then return{status=501,message=
`Alias not found: {d}`}end return{status=200,message='Passed'}end end function a
.an()return function()local aa=a.load'r'if not getfenv(0).lz4decompress then
return{status=400,message='Global not found'}end local ab,ad='MYRIAD',aa.
base64decode'YE1ZUklBRA=='local b=lz4decompress(ad,#ab)if typeof(b)~='string'
then return{status=500,message='Did not return the expected type'}elseif b~=ab
then return{status=500,message="Compressed data doesn't match reference data"}
end local c,d=a.load'b'{'crypt.lz4decompress'}if not c then return{status=501,
message=`Alias not found: {d}`}end return{status=200,message='Passed'}end end
function a.ao()return function()if not getfenv(0).getfpscap then return{status=
400,message='Global not found'}end local aa,ab=a.load'b'{'queueonteleport'}if
not aa then return{status=501,message=`Alias not found: {ab}`}end return{status=
200,message=`Passed`}end end function a.ap()return function()if not getfenv(0).
messagebox then return{status=400,message='Global not found'}end local aa,ab=a.
load'b'{}if not aa then return{status=501,message=`Alias not found: {ab}`}end
return{status=200,message=`Passed`}end end function a.aq()return function()if
not getfenv(0).rconsoleprint then return{status=400,message='Global not found'}
end local aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.ar()return
function()if not getfenv(0).rconsoleinfo then return{status=400,message=
'Global not found'}end local aa,ab=a.load'b'{}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.as()return function()if not getfenv(0).rconsolewarn then return{
status=400,message='Global not found'}end local aa,ab=a.load'b'{}if not aa then
return{status=501,message=`Alias not found: {ab}`}end return{status=200,message=
`Passed`}end end function a.at()return function()if not getfenv(0).rconsoleerr
then return{status=400,message='Global not found'}end local aa,ab=a.load'b'{}if
not aa then return{status=501,message=`Alias not found: {ab}`}end return{status=
200,message=`Passed`}end end function a.au()return function()if not getfenv(0).
rconsoleinput then return{status=400,message='Global not found'}end local aa,ab=
a.load'b'{}if not aa then return{status=501,message=`Alias not found: {ab}`}end
return{status=200,message=`Passed`}end end function a.av()return function()if
not getfenv(0).rconsoleclear then return{status=400,message='Global not found'}
end local aa,ab=a.load'b'{}if not aa then return{status=501,message=`Alias not found: {
ab}`}end return{status=200,message=`Passed`}end end function a.aw()return
function()if not getfenv(0).rconsolename then return{status=400,message=
'Global not found'}end local aa,ab=a.load'b'{}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.ax()return function()if not getfenv(0).rconsolehide then return{
status=400,message='Global not found'}end local aa,ab=a.load'b'{}if not aa then
return{status=501,message=`Alias not found: {ab}`}end return{status=200,message=
`Passed`}end end function a.ay()return function()if not getfenv(0).rconsoleshow
then return{status=400,message='Global not found'}end local aa,ab=a.load'b'{}if
not aa then return{status=501,message=`Alias not found: {ab}`}end return{status=
200,message=`Passed`}end end function a.az()return function()if not getfenv(0).
setthreadidentity then return{status=400,message='Global not found'}end local aa
,ab=a.load'b'{'setidentity','setthreadcontext'}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.aA()return function()if not getfenv(0).getthreadidentity then return{
status=400,message='Global not found'}end if typeof(getthreadidentity())~=
'number'then return{status=500,message='Did not return a number'}end local aa,ab
=a.load'b'{'getidentity','getthreadcontext'}if not aa then return{status=501,
message=`Alias not found: {ab}`}end return{status=200,message=`Passed`}end end
function a.aB()return function()if not getfenv(0).setscriptable then return{
status=400,message='Global not found'}end local aa=Instance.new'Part'
setscriptable(aa,'BottomParamA',true)if not aa.BottomParamA then return{status=
500,message='BottomParamA not accessible after being set as scriptable'}end
setscriptable(aa,'BottomParamA',false)if pcall(function()local ab=aa.
BottomParamA end)then return{status=500,message=
'BottomParamA accessible after being set as unscriptable'}end local ab,ad=a.load
'b'{}if not ab then return{status=501,message=`Alias not found: {ad}`}end return
{status=200,message=`Passed`}end end function a.aC()return function()if not
getfenv(0).getscripts then return{status=400,message='Global not found'}end
local aa,ab,ad,b=Instance.new'LocalScript',Instance.new'ModuleScript',Instance.
new'Script',Instance.new'Script'b.RunContext=Enum.RunContext.Client local c=
getscripts()if not table.find(c,aa)then return{status=500,message=
'LocalScript not found in returned table'}elseif not table.find(c,ab)then return
{status=500,message='ModuleScript not found in returned table'}elseif not table.
find(c,b)then return{status=500,message=
[[ServerScript w/ client runcontext not found in returned table]]}elseif table.
find(c,ad)then return{status=500,message='ServerScript found in returned table'}
end local d,e=a.load'b'{}if not d then return{status=501,message=`Alias not found: {
e}`}end return{status=200,message=`Passed`}end end function a.aD()return
function()if not getfenv(0).getrunningscripts then return{status=400,message=
'Global not found'}end local aa,ab,ad,b,c,d,e,f=game.Players.LocalPlayer.
Character:FindFirstChild'Animate',game.Players.LocalPlayer.Character:
FindFirstChild'whysoud',game.Players.LocalPlayer.Character:FindFirstChild
'whysodtc',game.Players.LocalPlayer.Character:FindFirstChild'maybeisdtc',
Instance.new'LocalScript',Instance.new'ModuleScript',Instance.new'Script',
Instance.new'Script'f.RunContext=Enum.RunContext.Client local g=
getrunningscripts()if table.find(g,c)then return{status=500,message=
'LocalScript found in returned table'}elseif table.find(g,d)then return{status=
500,message='ModuleScript found in returned table'}elseif table.find(g,f)then
return{status=500,message=
'ServerScript w/ client runcontext found in returned table'}elseif table.find(g,
e)then return{status=500,message='ServerScript found in returned table'}elseif
table.find(g,ad)then return{status=500,message=
'Disabled script found in returned table'}elseif table.find(g,b)then return{
status=500,message='Non-running script found in returned table'}elseif not table
.find(g,aa)or not table.find(g,ab)then return{status=500,message=
"Didn't find a running script in the returned table"}end local h,i=a.load'b'{}if
not h then return{status=501,message=`Alias not found: {i}`}end return{status=
200,message=`Passed`}end end function a.aE()return function()if not getfenv(0).
getcallingscript then return{status=400,message='Global not found'}elseif not
getfenv(0).checkcaller then return{status=401,message=
"Dependency 'checkcaller' not found"}elseif not getfenv(0).hookmetamethod then
return{status=401,message="Dependency 'hookmetamethod' not found"}end local aa
aa=hookmetamethod(game,'__index',function(ab,ad)if not checkcaller()then
getcallingscript()hookmetamethod(game,'__index',aa)end return aa(ab,ad)end)if
getcallingscript()then return{status=500,message=
'Executor call assumed to be a game call'}end local ab,ad=a.load'b'{}if not ab
then return{status=501,message=`Alias not found: {ad}`}end return{status=200,
message=`Passed`}end end function a.aF()return function()local aa,ab=pcall(
function()return game:GetService'StarterPlayer'.StarterPlayerScripts.
PlayerModule end)if not getfenv(0).getloadedmodules then return{status=400,
message='Global not found'}elseif not aa then return{status=401,message=
"Testing dependency 'PlayerModule' not found."}end local ad,b,c=require(ab),
Instance.new'ModuleScript',getloadedmodules()if not table.find(c,ab)then return{
status=500,message='Loaded module not found in returned table'}elseif table.
find(c,b)then return{status=500,message=
'Unloaded module found in returned table'}end local d,e=a.load'b'{}if not d then
return{status=501,message=`Alias not found: {e}`}end return{status=200,message=`Passed`
}end end function a.aG()return function()local aa,ab=pcall(function()return game
.Players.LocalPlayer.Character.Animate end)if not getfenv(0).getloadedmodules
then return{status=400,message='Global not found'}elseif not aa then return{
status=401,message="Testing dependency 'Animate' not found."}end local ad=
getsenv(ab)if not ad.onSwimming or not typeof(ad.onSwimming)=='function'then
return{status=500,message=
[[Global in test script wasn't found, or didn't return the right type]]}end
local b,c=a.load'b'{}if not b then return{status=501,message=`Alias not found: {
c}`}end return{status=200,message=`Passed`}end end function a.aH()return
function()local aa,ab=pcall(function()return game.Players.LocalPlayer.Character.
Animate end)if not getfenv(0).getscripthash then return{status=400,message=
'Global not found'}elseif not aa then return{status=401,message=
"Testing dependency 'Animate' not found."}end local ad,b,c=Instance.new
'LocalScript',pcall(function()return getscripthash(ab)end)local d,e=pcall(
function()return getscripthash(ad)end)if not b then return{status=500,message=
"Failed to get bytecode of 'Animate': "..c}elseif not d then return{status=500,
message=
[[Failed to get script w/ no bytecode. Errored instead of returning nil.]]}
elseif typeof(c)~='string'then return{status=500,message=
'Did not return a hash string'}elseif hashNoBytecode~=nil then return{status=500
,message='A script with no bytecode returned non-nil data'}end local f,g=ab:
Clone(),ab.Source ab.Source='return 1'local h=getscripthash(ab)if c==h then
return{status=500,message='Gave the same hash for a modified script'}end ab.
Source=g local i,j=a.load'b'{}if not i then return{status=501,message=`Alias not found: {
j}`}end return{status=200,message=`Passed`}end end function a.aI()return
function()if not getfenv(0).loadstring then return{status=400,message=
'Global not found'}end local aa=loadstring('MYRIAD','MYRIAD')loadstring
'\r\n\t\tglobalVar = {"Hello", "World"}\r\n\t'()if not globalVar or not(
globalVar[1]=='Hello'and globalVar[2]=='World')then return{status=500,message=
'Global variable insert from loadstring not found'}elseif aa~=nil then return{
status=500,message="Didn't error on incomplete expression"}end local ab,ad=a.
load'b'{}if not ab then return{status=501,message=`Alias not found: {ad}`}end
return{status=200,message=`Passed`}end end function a.aJ()return function()a.
load'r'if not getfenv(0).getrunningscripts then return{status=400,message=
'Global not found'}end local aa=game.Players.LocalPlayer.Character:
FindFirstChild'whysoud'local ab,ad=getscriptbytecode(aa),{'sigma','task','wait',
[[GOT A DROP ON THIS FLEXING FELLA<MYRIAD_UD_MAX_UD_NEVER_SPEAK_TO_ME_AGAIN_KING_VON_IS_A_SAINT]]
,'tostring'}for b,c in pairs(ad)do if not ab:find(c)then return{status=500,
message="Didn't find an expected segment in the bytecode"}end end local b,c=a.
load'b'{'dumpstring'}if not b then return{status=501,message=`Alias not found: {
c}`}end return{status=200,message=`Passed`}end end function a.aK()return
function()a.load'r'if not getfenv(0).getscriptclosure then return{status=400,
message='Global not found'}end local aa=game.Players.LocalPlayer.Character:
FindFirstChild'maybeisdtc'local ab=getscriptclosure(aa)if typeof(ab)~='function'
then return{status=500,message='Expected a closure'}elseif ab()~=
'GOT A DROP ON THIS FLEXING FELLA'then return{status=500,message=
'Closure did not return the expected value'}end local ad,b=a.load'b'{
'getscriptfunction'}if not ad then return{status=501,message=`Alias not found: {
b}`}end return{status=200,message=`Passed`}end end function a.aL()return
function()local aa,ab=pcall(function()return game.ReplicatedFirst.decompmeplssss
end)if not getfenv(0).decompile then return{status=400,message=
'Global not found'}elseif not aa then return{status=401,message=
[[Testing dependency 'ReplicatedFirst.decompmeplssss' not found.]]}end local ad,
b=function(ad,b)local c={}for d,e in ipairs(b)do if not ad:find(e,1,true)then
table.insert(c,e)end end if#c>0 then return false,c end return true end,
decompile(ab)if typeof(b)~='string'then return{status=500,message=
"Decompiled script isn't a string"}elseif#b<=0 then return{status=500,message=
"Decompiled script didn't return anything"}end local c,d=ad(b,{'truthy','falsey'
,'123','456','TableWeirdness','func','inline-fn','loopFn','nil-check',
'true-check','fallback','setmetatable','__index','secret','found','MethodStyle'}
)if not c then return{status=500,message=
'Decompiled script missing expected strings: '..table.concat(d,', ')}end local e
,f=a.load'b'{}if not e then return{status=501,message=`Alias not found: {f}`}end
return{status=200,message='Passed'}end end function a.aM()return function()if
not getfenv(0).WebSocket or not getfenv(0).WebSocket.connect then return{status=
400,message='Global not found'}end local aa=WebSocket.connect
'ws://echo.websocket.events'if not(type(aa)=='table'or type(aa)=='userdata')then
return{status=500,message="Didn't give a table | userdata"}end for ab,ad in
pairs{OnClose='RBXScriptSignal',OnMessage='RBXScriptSignal',Send='function',
Close='function',send='function',close='function'}do local b,c=pcall(function()
return aa[ab]end)if not b or c==nil then return{status=500,message=`WebSocketObject is missing: {
ab}`}end if typeof(c)~=ad then return{status=500,message=`WebSocketObject.{ab} is not a {
ad} (got {typeof(c)})`}end end if result then return result end local ab,ad=a.
load'b'{'WebSocket.Connect','WebSocket.new','WebSocket.New'}if not ab then
return{status=501,message=`Alias not found: {ad}`}end return{status=200,message=
`Passed`}end end function a.aN()return function(aa,ab)local ad,b,c,d,e,f,g,h={},
{},{checkpointDelay=0,statusFilter=false,stripRichtext=false,formatDiff=false,
includeMetadata=false},{bullet='\u{2022}'},{[0]='\u{2753}',[200]='\u{2705}',[400
]='\u{1f50e}',[401]='\u{1f4e6}',[500]='\u{1f6e0}\u{fe0f}',[501]=
'\u{1f3f7}\u{fe0f}'},{cache={['cache.invalidate']=a.load'c',['cache.iscached']=a
.load'd',['cache.replace']=a.load'e'},Closures={islclosure=a.load'f',iscclosure=
a.load'g',isexecutorclosure=a.load'h',newcclosure=a.load'i',clonefunction=a.load
'j',hookfunction=a.load'k',restorefunction=a.load'l',getfunctionhash=a.load'm',
checkcaller=a.load'n'},crypt={['crypt.encrypt']=a.load's',['crypt.decrypt']=a.
load't',['crypt.generatekey']=a.load'u',['crypt.generatebytes']=a.load'v',[
'crypt.base64encode']=a.load'w',['crypt.base64decode']=a.load'x',['crypt.hash']=
a.load'y',['crypt.random']=a.load'z',['crypt.hmac']=a.load'A'},debug={[
'debug.getconstant']=a.load'B',['debug.getconstants']=a.load'C',[
'debug.getproto']=a.load'D',['debug.getprotos']=a.load'E',['debug.getupvalue']=a
.load'F',['debug.getupvalues']=a.load'G',['debug.getstack']=a.load'H',[
'debug.setconstant']=a.load'I',['debug.setupvalue']=a.load'J'},Drawing={[
'Drawing.new']=a.load'K',['Drawing.Fonts']=a.load'L',getrenderproperty=a.load'M'
,setrenderproperty=a.load'N',cleardrawcache=a.load'O',isrenderobj=a.load'P'},
Environment={getgenv=a.load'Q',getrenv=a.load'R',getgc=a.load'S',filtergc=a.load
'T'},Filesystem={writefile=a.load'U',readfile=a.load'V',makefolder=a.load'W'},
Input={setclipboard=a.load'X',setrbxclipboard=a.load'Y'},Instances={gethui=a.
load'Z',cloneref=a.load'_',compareinstances=a.load'aa',fireclickdetector=a.load
'ab',fireproximityprompt=a.load'ac',saveinstance=a.load'ad'},Metatable={
getrawmetatable=a.load'ae',setrawmetatable=a.load'af',setreadonly=a.load'ag',
isreadonly=a.load'ah'},Miscellaneous={identifyexecutor=a.load'ai',setfpscap=a.
load'aj',getfpscap=a.load'ak',request=a.load'al',lz4compress=a.load'am',
lz4decompress=a.load'an',queue_on_teleport=a.load'ao'},External={messagebox=a.
load'ap',rconsoleprint=a.load'aq',rconsoleinfo=a.load'ar',rconsolewarn=a.load
'as',rconsoleerr=a.load'at',rconsoleinput=a.load'au',rconsoleclear=a.load'av',
rconsolename=a.load'aw',rconsolehide=a.load'ax',rconsoleshow=a.load'ay'},
Reflection={setthreadidentity=a.load'az',getthreadidentity=a.load'aA',
setscriptable=a.load'aB'},Scripts={getscripts=a.load'aC',getrunningscripts=a.
load'aD',getcallingscript=a.load'aE',getloadedmodules=a.load'aF',getsenv=a.load
'aG',getscripthash=a.load'aH',loadstring=a.load'aI',getscriptbytecode=a.load'aJ'
,getscriptclosure=a.load'aK',decompile=a.load'aL'},Signals={},WebSocket={connect
=a.load'aM'}}local i,j=function(...)local i=table.concat({...},' ')h:AppendText(
i)end,function(...)local i=table.concat({...},' ')h:AppendText(`<font color="#FFA500">{
i}</font>`)end local function k()if g then task.cancel(g)end g=task.spawn(
function()local l,m,n=0,0,0 for o,p in f do ad[o]=nil b[o]={}for q in p do n+=1
ad[o]=q end end local o={}for p,q in f do for r,s in q do table.insert(o,{
groupName=p,name=r,test=s})end end for p,q in ipairs(o)do local r,s,t,v=q.
groupName,q.name,q.test,o[p+1]local w,y=pcall(t)local z,A if not w then z=0 A=y
m+=1 h:SetValue(`<font color="#FFA500">{s} failed</font>`)elseif y.status==200
then z=y.status A=y.message l+=1 h:SetValue(`<font color="#84FF00">{s} passed</font>`
)else z=y.status A=y.message m+=1 h:SetValue(`<font color="#FFA500">{s} failed</font>`
)end if v then i(`Next test: {v.name}`)end table.insert(b[r],{name=s,status=z,
message=A,isLast=ad[r]==s})if c.checkpointDelay~=0 then task.wait(c.
checkpointDelay)end end h:Clear()for p,q in b do local r,s=false,false for t,v
in q do if not c.statusFilter or e[v.status]==c.statusFilter then if not s then
i(p..':')s=true end local w=(v.status==200)and i or j w(`{d.bullet} {e[v.status]
} {v.name}: {v.message}`)r=true end end if r then i''end end if c.stripRichtext
then h:SetValue(h:GetValue():gsub('<br%s*/>','\n'):gsub('<[^<>]->',''))end if c.
formatDiff then h:SetValue(h:GetValue():gsub('<br%s*/>','\n'):gsub('<[^<>]->',''
))local p,q=h:GetValue(),{}for r,s in ipairs(string.split(p,'\n'))do local t=s:
gsub('^\u{2022}%s*',''):gsub('^%s*(.-)%s*$','%1')if t~=''then if t:find
'\u{2705}'then q[r]='+ '..t elseif t:find'\u{1f50e}'or t:find'\u{2753}'or t:find
'\u{1f6e0}\u{fe0f}'or t:find'\u{1f4e6}'or t:find'\u{1f3f7}\u{fe0f}'then q[r]=
'- '..t else q[r]=t end else q[r]=''end end h:SetValue(table.concat(q,'\n'))end
i(`Summary:`)i(`{d.bullet} Executor: {identifyexecutor and identifyexecutor()or
'Unknown'}`)i(`{d.bullet} Tested: {n}`)i(`{d.bullet} Passed: {l}`)i(`{d.bullet} Failed: {
m}`)i(`{d.bullet} Pass Rate: {math.round(l/n*100)}%`)local p,q=identifyexecutor(
)if c.includeMetadata then local r,s=h:GetValue(),string.format(
[[@metadata {
  "generated": "%s",
  "executor": "%s",
  "version": "%s",
} 

]]
,DateTime.now():ToIsoDate(),p,q)h:SetValue(s..r)end game.ReplicatedStorage.res:
FireServer(b,p,q)end)end ab:Button{Text='Run test',Callback=function()coroutine.
wrap(k)()end}do local l=ab:TreeNode{Title='Test options'}l:Combo{Label=
'Status filter',Selected='All',Items={'All','\u{2705} Pass','\u{2753} Ambiguous'
,'\u{1f50e} Missing','\u{1f4e6} Dependency','\u{1f6e0}\u{fe0f} Functionality',
'\u{1f3f7}\u{fe0f} Alias'},Callback=function(m,n)local o={All=false,[
'\u{2705} Pass']=e[200],['\u{2753} Ambiguous']=e[0],['\u{1f50e} Missing']=e[400]
,['\u{1f4e6} Dependency']=e[401],['\u{1f6e0}\u{fe0f} Functionality']=e[500],[
'\u{1f3f7}\u{fe0f} Alias']=e[501]}c.statusFilter=o[n]end}l:SliderFloat{Label=
'Checkpoint delay',Default=0,Minimum=0,Maximum=1,Format='Delay = %.2f',Callback=
function(m,n)c.checkpointDelay=n end}l:Checkbox{Value=false,Label=
'Include Metadata',Callback=function(m,n)c.includeMetadata=n end}l:Checkbox{
Value=false,Label='Strip Rich-text',Callback=function(m,n)c.stripRichtext=n end}
l:Checkbox{Value=false,Label='Format in diff',Callback=function(m,n)c.formatDiff
=n end}end do local l=ab:TreeNode{Title='Info'}l:Label{Text=
[[Alias testing comes after the functionality test. So if you see the alias missing that means you still passed the functionality test.]]
,TextWrapped=true}end h=ab:Console{ReadOnly=true,RichText=true,LineHeight=1.3,
Fill=true}:Clear()return b end end function a.aO()return function(aa,ab)local ad
,b=0,0 local c=function(...)local c=table.concat({...},' ')output:AppendText(c)
end output=ab:Console{ReadOnly=true,RichText=true,LineHeight=1.3,Fill=true}:
Clear()c'Not implemented.'return{passed=ad,failed=b}end end end local aa,ab,ad,b
=a.load'a',game:GetService'Players',game:GetService'ReplicatedStorage',game:
GetService'TeleportService'local c,d,e=ab.LocalPlayer,80776325854596,{Standards=
a.load'aN',Vulnerability=a.load'aO'}if game.PlaceId~=d then aa:PopupModal{Title=
'Teleporting to test game...'}b:Teleport(d,c)else ad:FindFirstChild'connected':
FireServer()local f=aa:TabsWindow{Title='Myriad General Validity Test',Size=
UDim2.fromOffset(400,500),Theme='ImGui'}local g=f:PopupModal{Title=
'Would you like to join our discord?'}g:Label{Text=
[[Get commit logs when we push changes, interact with communitys, and get support for problems]]
,TextWrapped=true}g:Separator()local h=g:Row{Expanded=true}h:Button{Text='Yes',
Callback=function()if setclipboard or toclipboard then(setclipboard or
toclipboard)'https://discord.gg/nn4NxHU3Pu'else print
'Failed to copy link: https://discord.gg/nn4NxHU3Pu'end g:ClosePopup()end}h:
Button{Text='No',Callback=function()g:ClosePopup()end}do local i=f:CreateTab{
Name='Home'}i:Label{RichText=true,Text=
'<b>Myriad General Validity Test (2025)</b>'}i:Label{RichText=true,Text=`Executor: <b>{
(identifyexecutor and identifyexecutor()or'Unknown')}</b>`}i:Label{RichText=true
,Text='\nContributors:'}i:BulletText{RichText=true,Rows={'biggaboy212'}}end for
i,j in e do local k=f:CreateTab{Name=i}coroutine.wrap(function()e[i](i,k)end)()
end end