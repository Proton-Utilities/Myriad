--!nolint
--!nocheck

--[[
    @repository https://github.com/Proton-Utilities/Myriad

    @author Proton-Utilities
    @name Myriad

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2025-07-21T11:11:47.430001700+00:00",
    cfg = "Debug",
    vers = "v0.0.0"
}

type ThemeData__DARKLUA_TYPE_a={
[string]:any
}

type FlagFunc__DARKLUA_TYPE_b={
Data:{
Class:{},
WindowClass:table__DARKLUA_TYPE_c?
},
Object:GuiObject
}

type table__DARKLUA_TYPE_c={
[any]:any
}

type ObjectTable__DARKLUA_TYPE_d={
[GuiObject]:any
}

type TagsList__DARKLUA_TYPE_e={
[GuiObject]:string
}

type AnimationTween__DARKLUA_TYPE_f={
Object:Instance,
NoAnimation:boolean?,
Tweeninfo:TweenInfo?,
EndProperties:{},
Completed:(()->any?)?
}

type Animate__DARKLUA_TYPE_g={
NoAnimation:boolean?,
Objects:ObjectTable__DARKLUA_TYPE_d,
Tweeninfo:TweenInfo?,
Completed:()->any
}

type HeaderCollapseToggle__DARKLUA_TYPE_h={
Rotations:{
Open:number?,
Closed:number?
},
Toggle:GuiObject,
NoAnimation:boolean?,
Collapsed:boolean,
Tweeninfo:TweenInfo?
}

type HeaderCollapse__DARKLUA_TYPE_i={
Collapsed:boolean,
ClosedSize:UDim2,
OpenSize:UDim2,
Toggle:Instance,
Resize:Instance?,
Hide:Instance?,
NoAnimation:boolean?,
NoAutomaticSize:boolean?,
IconOnly:boolean?,
Completed:(()->any)?,
IconRotations:{
Open:number?,
Closed:number?
}
}

type SignalClass__DARKLUA_TYPE_j={
Connections:{
[number]:(...any)->nil
},
Fire:(SignalClass__DARKLUA_TYPE_j,...any)->nil,
GetConnections:(SignalClass__DARKLUA_TYPE_j)->table__DARKLUA_TYPE_c,
Connect:(SignalClass__DARKLUA_TYPE_j,(...any)->nil)->table__DARKLUA_TYPE_c,
DisconnectConnections:(SignalClass__DARKLUA_TYPE_j)->nil
}

type ConnectDrag__DARKLUA_TYPE_k={
DragStart:()->nil,
DragEnd:()->nil,
DragMovement:()->nil
}

type MakeDraggableFlags__DARKLUA_TYPE_l={
Move:Instance,
Grab:Instance,
Enabled:boolean?,
OnUpdate:((Vector2)->...any)?,
DragBegin:((InputObject)->...any)?,
StateChanged:((MakeDraggableFlags__DARKLUA_TYPE_l)->any)?
}

type MakeResizableFlags__DARKLUA_TYPE_m={
MinimumSize:Vector2,
MaximumSize:Vector2?,

Resize:Instance,
OnUpdate:(UDim2)->...any
}

type DetectHover__DARKLUA_TYPE_n={
OnInput:((boolean,InputObject?)->...any?)?,
Anykey:boolean?,
MouseMove:boolean?,
MouseOnly:boolean?,
MouseEnter:boolean?,
Hovering:boolean?
}

type UpdateColors__DARKLUA_TYPE_o={
Object:GuiObject,
Tag:(string|table__DARKLUA_TYPE_c),
NoAnimation:boolean?,
Theme:string?,
TagsList:TagsList__DARKLUA_TYPE_e?,
Tweeninfo:TweenInfo?
}

type MultiUpdateColorsConfig__DARKLUA_TYPE_p={
Objects:ObjectsTable,
TagsList:TagsList__DARKLUA_TYPE_e?,
Theme:string?,
Animate:boolean?,
Tweeninfo:TweenInfo?
}

type ApplyFlags__DARKLUA_TYPE_q={
Object:Instance,
Class:table__DARKLUA_TYPE_c,
WindowClass:table__DARKLUA_TYPE_c?
}

type MakeCanvas__DARKLUA_TYPE_r={
Element:Instance,
WindowClass:WindowClass?,
Class:{}?
}

type OnElementCreateData__DARKLUA_TYPE_s={
Flags:table__DARKLUA_TYPE_c,
Object:GuiObject,
Canvas:table__DARKLUA_TYPE_c
}

type Image__DARKLUA_TYPE_t={
Image:(string|number),
Callback:((...any)->unknown)?
}

type VideoPlayer__DARKLUA_TYPE_u={
Video:(string|number),
Callback:((...any)->unknown)?
}

type Button__DARKLUA_TYPE_v={
Text:string?,
DoubleClick:boolean?,
Callback:((...any)->unknown)?
}

type Selectable__DARKLUA_TYPE_w={
Text:string?,
Selected:boolean?,
Disabled:boolean?,
Callback:((...any)->unknown)?
}

type ImageButton__DARKLUA_TYPE_x={
Image:(string|number),
Callback:((...any)->unknown)?
}

type KeyId__DARKLUA_TYPE_y=(Enum.UserInputType|Enum.KeyCode)

type Keybind__DARKLUA_TYPE_z={
Value:Enum.KeyCode?,
DeleteKey:Enum.KeyCode?,
Enabled:boolean?,
IgnoreGameProcessed:boolean?,
Callback:((KeyId__DARKLUA_TYPE_y)->any)?,
OnKeybindSet:((KeyId__DARKLUA_TYPE_y)->any)?,
OnBlacklistedKeybindSet:((KeyId__DARKLUA_TYPE_y)->any)?,
KeyBlacklist:{
[number]:KeyId__DARKLUA_TYPE_y
},

SetValue:((Keybind__DARKLUA_TYPE_z,New:Enum.KeyCode)->any)?,
WaitForNewKey:((Keybind__DARKLUA_TYPE_z)->any)?
}

type Label__DARKLUA_TYPE_A={
Text:string,
Bold:boolean?,
Italic:boolean?,
Font:string?
}

type Tab__DARKLUA_TYPE_B={
Name:string,
Focused:boolean?,
TabButton:boolean?,
Closeable:boolean?,
OnClosure:(Tab__DARKLUA_TYPE_B)->nil,
Icon:(string|number)?
}

type TabBar__DARKLUA_TYPE_C={
AutoSelectNewTabs:boolean,
OnActiveTabChange:((TabBar__DARKLUA_TYPE_C,Tab:Tab__DARKLUA_TYPE_B,Previous:Tab__DARKLUA_TYPE_B)->nil)?,
OnTabCreate:((TabBar__DARKLUA_TYPE_C,Tab:Tab__DARKLUA_TYPE_B)->nil)?,
OnTabRemove:((TabBar__DARKLUA_TYPE_C,Tab:Tab__DARKLUA_TYPE_B)->nil)?
}

type TabSelector__DARKLUA_TYPE_D={
NoTabsBar:boolean?,
NoAnimation:boolean?
}&TabBar__DARKLUA_TYPE_C

type RadioButton__DARKLUA_TYPE_E={
Icon:string?,
IconRotation:number?,
Callback:((...any)->unknown)?
}

type Checkbox__DARKLUA_TYPE_F={
Label:string?,
IsRadio:boolean?,
Value:boolean,
NoAnimation:boolean?,
Callback:((...any)->unknown)?,
SetValue:(self:Checkbox__DARKLUA_TYPE_F,Value:boolean,NoAnimation:boolean)->...any,
Toggle:(self:Checkbox__DARKLUA_TYPE_F)->...any,
TickedImageSize:UDim2,
UntickedImageSize:UDim2
}

type PlotHistogram__DARKLUA_TYPE_G={
Label:string?,
Points:{
[number]:number
},
Minimum:number?,
Maximum:number?,
GetBaseValues:(PlotHistogram__DARKLUA_TYPE_G)->(number,number),
UpdateGraph:(PlotHistogram__DARKLUA_TYPE_G)->PlotHistogram__DARKLUA_TYPE_G,
PlotGraph:(PlotHistogram__DARKLUA_TYPE_G,Points:{
[number]:number
})->PlotHistogram__DARKLUA_TYPE_G,
Plot:(PlotHistogram__DARKLUA_TYPE_G,Value:number)->{
SetValue:(Plot,Value:number)->nil,
GetPointIndex:(Plot)->number,
Remove:(Plot,Value:number)->nil
}
}

type Viewport__DARKLUA_TYPE_H={
Model:Instance,
WorldModel:WorldModel?,
Viewport:ViewportFrame?,
Camera:Camera?,
Clone:boolean?,

SetCamera:(self:Viewport__DARKLUA_TYPE_H,Camera:Camera)->Viewport__DARKLUA_TYPE_H,
SetModel:(self:Viewport__DARKLUA_TYPE_H,Model:Model,PivotTo:CFrame?)->Model
}

type InputText__DARKLUA_TYPE_I={
Value:string,
Placeholder:string?,
MultiLine:boolean?,
Label:string?,
Disabled:boolean?,

Callback:((string,...any)->unknown)?,
Clear:(InputText__DARKLUA_TYPE_I)->InputText__DARKLUA_TYPE_I,
SetValue:(InputText__DARKLUA_TYPE_I,Value:string)->InputText__DARKLUA_TYPE_I,
SetDisabled:(InputText__DARKLUA_TYPE_I,Disabled:boolean)->InputText__DARKLUA_TYPE_I
}

type InputInt__DARKLUA_TYPE_J={
Value:number,
Maximum:number?,
Minimum:number?,
Placeholder:string?,
MultiLine:boolean?,
NoButtons:boolean?,
Label:string?,
Increment:number?,
Callback:((string,...any)->unknown)?,
SetValue:(InputInt__DARKLUA_TYPE_J,Value:number,NoTextUpdate:boolean?)->InputInt__DARKLUA_TYPE_J,
Decrease:(InputInt__DARKLUA_TYPE_J)->nil,
Increase:(InputInt__DARKLUA_TYPE_J)->nil
}

type Console__DARKLUA_TYPE_K={
Enabled:boolean?,
ReadOnly:boolean?,
Value:string?,
RichText:boolean?,
TextWrapped:boolean?,
LineNumbers:boolean?,
AutoScroll:boolean,
LinesFormat:string,
MaxLines:number,

CountLines:(Console__DARKLUA_TYPE_K)->number,
UpdateLineNumbers:(Console__DARKLUA_TYPE_K)->Console__DARKLUA_TYPE_K,
UpdateScroll:(Console__DARKLUA_TYPE_K)->Console__DARKLUA_TYPE_K,
SetValue:(Console__DARKLUA_TYPE_K,Value:string)->Console__DARKLUA_TYPE_K,
GetValue:(Console__DARKLUA_TYPE_K)->string,
Clear:(Console__DARKLUA_TYPE_K)->Console__DARKLUA_TYPE_K,
AppendText:(Console__DARKLUA_TYPE_K,...string)->Console__DARKLUA_TYPE_K,
CheckLineCount:(Console__DARKLUA_TYPE_K)->Console__DARKLUA_TYPE_K
}

type Table__DARKLUA_TYPE_L={
Align:string?,
Border:boolean?,
RowBackground:boolean?,
RowBgTransparency:number?,
MaxColumns:number?,

Row:(Table__DARKLUA_TYPE_L)->{
Column:(Row__DARKLUA_TYPE_U)->Elements
},
ClearRows:(Table__DARKLUA_TYPE_L)->unknown
}

type List__DARKLUA_TYPE_M={
Spacing:number?
}

type CollapsingHeader__DARKLUA_TYPE_N={
Title:string,
CollapseIcon:string?,
Icon:string?,
NoAnimation:boolean?,
Collapsed:boolean?,
Offset:number?,
NoArrow:boolean?,
OpenOnDoubleClick:boolean?,
OpenOnArrow:boolean?,
Activated:(CollapsingHeader__DARKLUA_TYPE_N)->nil,

Remove:(CollapsingHeader__DARKLUA_TYPE_N)->nil,
SetArrowVisible:(CollapsingHeader__DARKLUA_TYPE_N,Visible:boolean)->nil,
SetTitle:(CollapsingHeader__DARKLUA_TYPE_N,Title:string)->nil,
SetIcon:(CollapsingHeader__DARKLUA_TYPE_N,Icon:string)->nil,
SetVisible:(CollapsingHeader__DARKLUA_TYPE_N,Visible:boolean)->nil,
SetCollapsed:(CollapsingHeader__DARKLUA_TYPE_N,Open:boolean)->CollapsingHeader__DARKLUA_TYPE_N
}

type Separator__DARKLUA_TYPE_O={
Text:string?
}

type Canvas__DARKLUA_TYPE_P={
Scroll:boolean?,
Class:table__DARKLUA_TYPE_c?
}

type Region__DARKLUA_TYPE_Q={
Scroll:boolean?
}

type Indent__DARKLUA_TYPE_R={
Offset:number?
}

type BulletText__DARKLUA_TYPE_S={
Padding:number,
Icon:(string|number)?,
Rows:{
[number]:string?
}
}

type Bullet__DARKLUA_TYPE_T={
Padding:number?
}

type Row__DARKLUA_TYPE_U={
Spacing:number?,
Expanded:boolean?,
HorizontalFlex:Enum.UIFlexAlignmen?,
VerticalFlex:Enum.UIFlexAlignmen?,
Expand:(Row__DARKLUA_TYPE_U)->Row__DARKLUA_TYPE_U
}

type SliderIntFlags__DARKLUA_TYPE_V={
Value:number?,
Format:string?,
Label:string?,
Progress:boolean?,
NoGrab:boolean?,
Minimum:number,
Maximum:number,
NoAnimation:boolean?,
Callback:(number)->any?,
ReadOnly:boolean?,
SetValue:(SliderInt,Value:number,IsSlider:boolean?)->SliderInt?,
SetDisabled:(SliderInt,Disabled:boolean)->SliderInt,
MakeProgress:(SliderInt)->nil?
}

type SliderEnumFlags__DARKLUA_TYPE_W={
Items:{
[number]:any
},
Label:string,
Value:number
}&SliderIntFlags__DARKLUA_TYPE_V

type DragIntFlags__DARKLUA_TYPE_X={
Format:string?,
Label:string?,
Callback:(DragIntFlags__DARKLUA_TYPE_X,number)->any,
Minimum:number?,
Maximum:number?,
Value:number?,
ReadOnly:boolean?,

SetValue:(DragIntFlags__DARKLUA_TYPE_X,number)->DragIntFlags__DARKLUA_TYPE_X
}

type InputColor3Flags__DARKLUA_TYPE_Y={
Label:string?,
Value:Color3?,
Callback:(InputColor3Flags__DARKLUA_TYPE_Y,Value:Color3)->any,

ValueChanged:(InputColor3Flags__DARKLUA_TYPE_Y)->nil,
SetValue:(InputColor3Flags__DARKLUA_TYPE_Y,Value:Color3)->InputColor3Flags__DARKLUA_TYPE_Y
}

type InputCFrameFlags__DARKLUA_TYPE_Z={
Label:string?,
Value:CFrame?,
Callback:(InputCFrameFlags__DARKLUA_TYPE_Z,Value:CFrame)->any,

ValueChanged:(InputCFrameFlags__DARKLUA_TYPE_Z)->nil,
SetValue:(InputCFrameFlags__DARKLUA_TYPE_Z,Value:CFrame)->InputCFrameFlags__DARKLUA_TYPE_Z
}

type ProgressBar__DARKLUA_TYPE__={
SetPercentage:(ProgressBar__DARKLUA_TYPE__,Value:number)->nil
}

type Combo__DARKLUA_TYPE_0={
Label:string?,
Placeholder:string?,
Callback:((Combo__DARKLUA_TYPE_0,Value:any)->any)?,
Items:{[(number?)]:any}?,
GetItems:(()->table__DARKLUA_TYPE_c)?
}

type TitleBarCanvas__DARKLUA_TYPE_1={
Right:table__DARKLUA_TYPE_c,
Left:table__DARKLUA_TYPE_c
}

type WindowFlags__DARKLUA_TYPE_2={
AutoSize:string?,
CloseCallback:(Window)->boolean?,
Collapsed:boolean?,
IsDragging:boolean?,
MinSize:Vector2?,
Theme:any?,
Title:string?,
NoTabs:boolean?,
NoMove:boolean?,
NoResize:boolean?,
NoTitleBar:boolean?,
NoClose:boolean?,
NoCollapse:boolean?,
NoScrollBar:boolean?,
NoSelectEffect:boolean?,
NoFocusOnAppearing:boolean?,
NoDefaultTitleBarButtons:boolean?,
NoWindowRegistor:boolean?,
OpenOnDoubleClick:boolean?,
SetTheme:(Window,ThemeName:string)->Window,
SetTitle:(Window,Title:string)->Window,
UpdateConfig:(Window,Config:table__DARKLUA_TYPE_c)->Window,
SetCollapsed:(Window,Collapsed:boolean,NoAnimation:boolean?)->Window,
SetCollapsible:(Window,Collapsible:boolean)->Window,
SetFocused:(Window,Focused:boolean)->Window,
Center:(Window)->Window,
SetVisible:(Window,Visible:boolean)->Window,
TagElements:(Window,Objects:{
[GuiObject]:string
})->nil,
Close:(Window)->nil
}

type TabsWindowFlags__DARKLUA_TYPE_3={
AutoSelectNewTabs:boolean?
}&WindowFlags__DARKLUA_TYPE_2

type PopupCanvas__DARKLUA_TYPE_4={
Scroll:boolean?,
AutoClose:boolean?,
RelativeTo:GuiObject,
MaxSizeY:number?,
MinSizeX:number?,
MaxSizeX:number?,

UpdateScale:(PopupCanvas__DARKLUA_TYPE_4)->nil,
UpdatePosition:(PopupCanvas__DARKLUA_TYPE_4)->nil,
ClosePopup:(PopupCanvas__DARKLUA_TYPE_4)->nil,
SetPopupVisible:(PopupCanvas__DARKLUA_TYPE_4,Visible:boolean)->nil
}

type Streamer__DARKLUA_TYPE_5={
Offset:number,
Source:string,
Length:number,
IsFinished:boolean,
LastUnreadBytes:number,

read:(Streamer__DARKLUA_TYPE_5,len:number?,shiftOffset:boolean?)->string,
seek:(Streamer__DARKLUA_TYPE_5,len:number)->(),
append:(Streamer__DARKLUA_TYPE_5,newData:string)->(),
toEnd:(Streamer__DARKLUA_TYPE_5)->()
}

type BlockData__DARKLUA_TYPE_6={
[number]:{
Literal:string,
LiteralLength:number,
MatchOffset:number?,
MatchLength:number?
}
}

type bytes__DARKLUA_TYPE_7={number}local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()

















local b={

Version="1.4.3",
Author="Depso",
License="MIT",
Repository="https://github.com/depthso/Dear-ReGui/",


Debug=false,
PrefabsId=71968920594655,
DefaultTitle="ReGui",
ContainerName="ReGui",
DoubleClickThreshold=0.3,
TooltipOffset=15,
IniToSave={
"Value"
},


Container=nil,
Prefabs=nil,
FocusedWindow=nil,


ThemeConfigs={},
Elements={},
Signaling={},
Animation={
DefaultTweenInfo=TweenInfo.new(0.08),
},


_FlagCache={},
_ErrorCache={},
Windows={},
ActiveTooltips={},
IniSettings={},
AnimationConnections={}
}

b.Icons={
Dot="rbxasset://textures/whiteCircle.png",
Arrow="rbxasset://textures/DeveloperFramework/button_arrow_right.png",
Close="rbxasset://textures/AnimationEditor/icon_close.png",
Checkmark="rbxasset://textures/AnimationEditor/icon_checkmark.png",
Cat="rbxassetid://16211812161",
Script="rbxassetid://11570895459",
Settings="rbxassetid://9743465390",
Info="rbxassetid://18754976792",
Move="rbxassetid://6710235139",
Roblox="rbxassetid://7414445494",
Warning="rbxassetid://11745872910",
Audio="rbxassetid://302250236",
Shop="rbxassetid://6473525198",
CharacterDance="rbxassetid://11932783331",
Pants="rbxassetid://10098755331",
Home="rbxassetid://4034483344",
Robux="rbxassetid://5986143282",
Badge="rbxassetid://16170504068",
SpawnLocation="rbxassetid://6400507398",
Sword="rbxassetid://7485051715",
Clover="rbxassetid://11999300014",
Star="rbxassetid://3057073083",
Code="rbxassetid://11348555035",
Paw="rbxassetid://13001190533",
Shield="rbxassetid://7461510428",
Shield2="rbxassetid://7169354142",
File="rbxassetid://7276823330",
Book="rbxassetid://16061686835",
Location="rbxassetid://13549782519",
Puzzle="rbxassetid://8898417863",
Discord="rbxassetid://84828491431270",
Premium="rbxassetid://6487178625",
Friend="rbxassetid://10885655986",
User="rbxassetid://18854794412",
Duplicate="rbxassetid://11833749507",
ChatBox="rbxassetid://15839118471",
ChatBox2="rbxassetid://15839116089",
Devices="rbxassetid://4458812712",
Weight="rbxassetid://9855685269",
Image="rbxassetid://123311808092347",
Profile="rbxassetid://13585614795",
Admin="rbxassetid://11656483170",
PaintBrush="rbxassetid://12111879608",
Speed="rbxassetid://12641434961",
NoConnection="rbxassetid://9795340967",
Connection="rbxassetid://119759670842477",
Globe="rbxassetid://18870359747",
Box="rbxassetid://140217940575618",
Crown="rbxassetid://18826490498",
Control="rbxassetid://18979524646",
Send="rbxassetid://18940312887",
FastForward="rbxassetid://112963221295680",
Pause="rbxassetid://109949100737970",
Reload="rbxassetid://11570018242",
Joystick="rbxassetid://18749336354",
Controller="rbxassetid://11894535915",
Lock="rbxassetid://17783082088",
Calculator="rbxassetid://85861816563977",
Sun="rbxassetid://13492317832",
Moon="rbxassetid://8498174594",
Prohibited="rbxassetid://5248916036",
Flag="rbxassetid://251346532",
Website="rbxassetid://98455290625865",
Telegram="rbxassetid://115860270107061",
MusicNote="rbxassetid://18187351229",
Music="rbxassetid://253830398",
Headphones="rbxassetid://1311321471",
Phone="rbxassetid://8411963035",
Smartphone="rbxassetid://14040313879",
Desktop="rbxassetid://3120635703",
Desktop2="rbxassetid://4728059490",
Laptop="rbxassetid://4728059725",
Server="rbxassetid://9692125126",
Wedge="rbxassetid://9086583059",
Drill="rbxassetid://11959189471",
Character="rbxassetid://13285102351",
}

b.DynamicImages={
[b.Icons.Arrow]="ImageFollowsText",
[b.Icons.Close]="ImageFollowsText",
[b.Icons.Dot]="ImageFollowsText",
}

b.Accent={

Light=Color3.fromRGB(50,150,250),
Dark=Color3.fromRGB(30,66,115),
ExtraDark=Color3.fromRGB(28,39,53),
White=Color3.fromRGB(240,240,240),
Gray=Color3.fromRGB(172,171,175),
Black=Color3.fromRGB(15,19,24),
Yellow=Color3.fromRGB(230,180,0),
Orange=Color3.fromRGB(230,150,0),
Green=Color3.fromRGB(130,188,91),
Red=Color3.fromRGB(255,69,69),


ImGui={
Light=Color3.fromRGB(66,150,250),
Dark=Color3.fromRGB(41,74,122),
Black=Color3.fromRGB(15,15,15),
Gray=Color3.fromRGB(36,36,36)
}
}





local c=b.ThemeConfigs
c.DarkTheme={
Values={
AnimationTweenInfo=TweenInfo.new(0.08),
TextFont=Font.fromEnum(Enum.Font.RobotoMono),
TextSize=14,
Text=b.Accent.White,
TextDisabled=b.Accent.Gray,
ErrorText=b.Accent.Red,

FrameBg=b.Accent.Dark,
FrameBgTransparency=0.4,
FrameBgActive=b.Accent.Light,
FrameBgTransparencyActive=0.4,
FrameRounding=UDim.new(0,0),


SliderGrab=b.Accent.Light,
ButtonsBg=b.Accent.Light,
CollapsingHeaderBg=b.Accent.Light,
CollapsingHeaderText=b.Accent.White,
CheckMark=b.Accent.Light,
ResizeGrab=b.Accent.Light,
HeaderBg=b.Accent.Gray,
HeaderBgTransparency=0.7,
HistogramBar=b.Accent.Yellow,
ProgressBar=b.Accent.Yellow,
RegionBg=b.Accent.Dark,
RegionBgTransparency=0.1,
Separator=b.Accent.Gray,
SeparatorTransparency=0.5,
ConsoleLineNumbers=b.Accent.White,
LabelPaddingTop=UDim.new(0,0),
LabelPaddingBottom=UDim.new(0,0),
MenuBar=b.Accent.ExtraDark,
MenuBarTransparency=0.1,
PopupCanvas=b.Accent.Black,


TabTextPaddingTop=UDim.new(0,3),
TabTextPaddingBottom=UDim.new(0,8),
TabText=b.Accent.Gray,
TabBg=b.Accent.Dark,
TabTextActive=b.Accent.White,
TabBgActive=b.Accent.Light,
TabsBarBg=Color3.fromRGB(36,36,36),
TabsBarBgTransparency=1,
TabPagePadding=UDim.new(0,8),


ModalWindowDimBg=Color3.fromRGB(230,230,230),
ModalWindowDimTweenInfo=TweenInfo.new(0.2),

WindowBg=b.Accent.Black,
WindowBgTransparency=0.05,

Border=b.Accent.Gray,
BorderTransparency=0.8,
BorderTransparencyActive=0.5,

Title=b.Accent.White,
TitleAlign=Enum.TextXAlignment.Left,
TitleBarBg=b.Accent.Black,
TitleBarTransparency=0,
TitleActive=b.Accent.White,
TitleBarBgActive=b.Accent.Dark,
TitleBarTransparencyActive=0.05,
TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6,
}
}
c.LightTheme={
BaseTheme=c.DarkTheme,
Values={
Text=b.Accent.Black,
TextFont=Font.fromEnum(Enum.Font.Ubuntu),
TextSize=14,

FrameBg=b.Accent.Gray,
FrameBgTransparency=0.4,
FrameBgActive=b.Accent.Light,
FrameBgTransparencyActive=0.6,

SliderGrab=b.Accent.Light,
ButtonsBg=b.Accent.Light,
CollapsingHeaderText=b.Accent.Black,
Separator=b.Accent.Black,
ConsoleLineNumbers=b.Accent.Yellow,
MenuBar=Color3.fromRGB(219,219,219),
PopupCanvas=b.Accent.White,

TabText=b.Accent.Black,
TabTextActive=b.Accent.Black,

WindowBg=b.Accent.White,
Border=b.Accent.Gray,
ResizeGrab=b.Accent.Gray,

Title=b.Accent.Black,
TitleAlign=Enum.TextXAlignment.Center,
TitleBarBg=b.Accent.Gray,
TitleActive=b.Accent.Black,
TitleBarBgActive=Color3.fromRGB(186,186,186),
TitleBarBgCollapsed=b.Accent.Gray
}
}
c.ImGui={
BaseTheme=c.DarkTheme,
Values={
AnimationTweenInfo=TweenInfo.new(0),
Text=Color3.fromRGB(255,255,255),

FrameBg=b.Accent.ImGui.Dark,
FrameBgTransparency=0.4,
FrameBgActive=b.Accent.ImGui.Light,
FrameBgTransparencyActive=0.5,
FrameRounding=UDim.new(0,0),

ButtonsBg=b.Accent.ImGui.Light,
CollapsingHeaderBg=b.Accent.ImGui.Light,
CollapsingHeaderText=b.Accent.White,
CheckMark=b.Accent.ImGui.Light,
ResizeGrab=b.Accent.ImGui.Light,
MenuBar=b.Accent.ImGui.Gray,
MenuBarTransparency=0,
PopupCanvas=b.Accent.ImGui.Black,

TabText=b.Accent.Gray,
TabBg=b.Accent.ImGui.Dark,
TabTextActive=b.Accent.White,
TabBgActive=b.Accent.ImGui.Light,

WindowBg=b.Accent.ImGui.Black,
WindowBgTransparency=0.05,
Border=b.Accent.Gray,
BorderTransparency=0.7,
BorderTransparencyActive=0.4,

Title=b.Accent.White,
TitleBarBg=b.Accent.ImGui.Black,
TitleBarTransparency=0,
TitleBarBgActive=b.Accent.ImGui.Dark,
TitleBarTransparencyActive=0,
}
}

b.ElementColors={MenuBar=
{
BackgroundColor3="MenuBar",
BackgroundTransparency="MenuBarTransparency",
},FrameRounding=
{
CornerRadius="FrameRounding"
},PopupCanvas=
{
BackgroundColor3="PopupCanvas"
},ModalWindowDim=
{
BackgroundColor3="ModalWindowDimBg"
},Selectable=
"Button",MenuButton=
"Button",Separator=
{
BackgroundColor3="Separator",
BackgroundTransparency="SeparatorTransparency",
},Region=
{
BackgroundColor3="RegionBg",
BackgroundTransparency="RegionBgTransparency",
},Label=
{
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},ImageFollowsText=
{
ImageColor3="Text",
},ConsoleLineNumbers=
{
TextColor3="ConsoleLineNumbers",
FontFace="TextFont",
TextSize="TextSize",
},ConsoleText=
"Label",LabelDisabled=
{
TextColor3="TextDisabled",
FontFace="TextFont",
TextSize="TextSize",
},Plot=
{
BackgroundColor3="HistogramBar",
},Header=
{
BackgroundColor3="HeaderBg",
BackgroundTransparency="HeaderBgTransparency",
},WindowTitle=
{
TextXAlignment="TitleAlign",
FontFace="TextFont",
TextSize="TextSize",
},TitleBar=
{
BackgroundColor3="TitleBarBgActive"
},Window=
{
BackgroundColor3="WindowBg",
BackgroundTransparency="WindowBgTransparency"
},TitleBarBgCollapsed=
{
BackgroundColor3="TitleBarBgCollapsed",
BackgroundTransparency="TitleBarTransparencyCollapsed"
},TitleBarBgActive=
{
BackgroundColor3="TitleBarBgActive",
BackgroundTransparency="TitleBarTransparencyActive"
},TitleBarBg=
{
BackgroundColor3="TitleBarBg",
BackgroundTransparency="TitleBarTransparency"
},TabsBar=
{
BackgroundColor3="TabsBarBg",
BackgroundTransparency="TabsBarBgTransparency",
},Border=
{
Color="Border",
Transparency="BorderTransparency"
},ResizeGrab=
{
TextColor3="ResizeGrab"
},BorderActive=
{
Transparency="BorderTransparencyActive"
},Frame=
{
BackgroundColor3="FrameBg",
BackgroundTransparency="FrameBgTransparency",
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},FrameActive=
{
BackgroundColor3="FrameBgActive",
BackgroundTransparency="FrameBgTransparencyActive"
},SliderGrab=
{
BackgroundColor3="SliderGrab"
},Button=
{
BackgroundColor3="ButtonsBg",
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},CollapsingHeader=
{
FontFace="TextFont",
TextSize="TextSize",
TextColor3="CollapsingHeaderText",
BackgroundColor3="CollapsingHeaderBg",
},Checkbox=
{
BackgroundColor3="FrameBg",
},CheckMark=
{
ImageColor3="CheckMark",
BackgroundColor3="CheckMark",
},RadioButton=
{
BackgroundColor3="ButtonsBg",
}
}

b.Styles={
RadioButton={
Animation="RadioButtons",
CornerRadius=UDim.new(1,0),
},
Button={
Animation="Buttons"
},
CollapsingHeader={
Animation="Buttons"
},
TreeNode={
Animation="TransparentButtons"
},
TransparentButton={
Animation="TransparentButtons"
}
}

b.Animations={Invisible=
{
Connections={
MouseEnter={
Visible=true,
},
MouseLeave={
Visible=false,
}
},
Init="MouseLeave"
},Buttons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=0.7,
}
},
Init="MouseLeave"
},TextButtons=
{
Connections={
MouseEnter={
TextTransparency=0.3,
},
MouseLeave={
TextTransparency=0.7,
}
},
Init="MouseLeave"
},TransparentButtons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=1,
}
},
Init="MouseLeave"
},RadioButtons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.5,
},
MouseLeave={
BackgroundTransparency=1,
}
},
Init="MouseLeave"
},Inputs=
{
Connections={
MouseEnter={
BackgroundTransparency=0,
},
MouseLeave={
BackgroundTransparency=0.5,
},
},
Init="MouseLeave"
},Plots=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=0,
},
},
Init="MouseLeave"
},Border=
{
Connections={
Selected={
Transparency=0,
Thickness=1
},
Deselected={
Transparency=0.7,
Thickness=1
}
},
Init="Selected"
},
}









b.ElementFlags={
{
Properties={"Center"},
Callback=function<FlagFunc>(d,e,f)
local g=e.Position
b:SetProperties(e,{
Position=UDim2.new(
f:find"X"and 0.5 or g.X.Scale,
g.X.Offset,
f:find"Y"and 0.5 or g.Y.Scale,
g.Y.Offset
),
AnchorPoint=Vector2.new(
f:find"X"and 0.5 or 0,
f:find"Y"and 0.5 or 0
)
})
end,
},
{
Properties={"ElementStyle"},
Callback=function<StyleFunc>(d,e,f)
b:ApplyStyle(e,f)
end,
},
{
Properties={"ColorTag"},
Callback=function<StyleFunc>(d,e,f)
local g=d.Class
local h=d.WindowClass
local i=g.NoAutoTheme


if not h then return end
if i then return end

b:UpdateColors{
Object=e,
Tag=f,
NoAnimation=true,
Theme=h.Theme,
}
end,
},
{
Properties={"Animation"},
Callback=function<StyleFunc>(d,e,f)

local g=d.Class.NoAnimation
if g then return end

b:SetAnimation(e,f)
end,
},
{
Properties={"Image"},
Callback=function<StyleFunc>(d,e,f)
local g=d.WindowClass
e.Image=b:CheckAssetUrl(f)
b:DynamicImageTag(e,f,g)
end,
},
{
Properties={"Icon","IconSize","IconRotation","IconPadding"},
Callback=function<StyleFunc>(d,e,f)

local g=e:FindFirstChild("Icon",true)
if not g then
return b:Warn("No icon for",e)
end


local h=d.Class
b:CheckConfig(h,{
Icon="",
IconSize=UDim2.fromScale(1,1),
IconRotation=0,
IconPadding=UDim2.new(0,2)
})


local i=g.Parent:FindFirstChild"UIPadding"
b:SetPadding(i,h.IconPadding)


local j=h.Icon
j=b:CheckAssetUrl(j)


local k=d.WindowClass
b:DynamicImageTag(g,j,k)
b:SetProperties(g,{
Visible=g~="",
Image=b:CheckAssetUrl(j),
Size=h.IconSize,
Rotation=h.IconRotation
})
end,
},
{
Properties={"BorderThickness","Border","BorderColor"},
Callback=function<StyleFunc>(d,e,f)
local g=d.Class local h=
d.WindowClass
local i=g.Border==true

b:CheckConfig(g,{
BorderTransparency=d:GetThemeKey"BorderTransparencyActive",
BorderColor=d:GetThemeKey"Border",
BorderThickness=1,
BorderStrokeMode=Enum.ApplyStrokeMode.Border,
})


local j=b:GetChildOfClass(e,"UIStroke")
b:SetProperties(j,{
Transparency=g.BorderTransparency,
Thickness=g.BorderThickness,
Color=g.BorderColor,
ApplyStrokeMode=g.BorderStrokeMode,
Enabled=i
})
end,
},
{
Properties={"Ratio"},
Callback=function<StyleFunc>(d,e,f)
local g=d.Class

b:CheckConfig(g,{
Ratio=1.3333333333333333,
RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize
})


local h=g.Ratio
local i=g.RatioAxis
local j=g.RatioAspectType

local k=b:GetChildOfClass(e,"UIAspectRatioConstraint")
b:SetProperties(k,{
DominantAxis=i,
AspectType=j,
AspectRatio=h
})
end,
},
{
Properties={"FlexMode"},
Callback=function<StyleFunc>(d,e,f)
local g=b:GetChildOfClass(e,"UIFlexItem")
g.FlexMode=f
end,
},
{

Properties={"CornerRadius"},
Callback=function<StyleFunc>(d,e,f)
local g=b:GetChildOfClass(e,"UICorner")
g.CornerRadius=f
end,
},
{
Properties={"Fill"},
Callback=function<StyleFunc>(d,e,f)
if f~=true then return end

local g=d.Class

b:CheckConfig(g,{
Size=UDim2.fromScale(1,1),
UIFlexMode=Enum.UIFlexMode.Fill,
AutomaticSize=Enum.AutomaticSize.None
})


local h=b:GetChildOfClass(e,"UIFlexItem")
h.FlexMode=g.UIFlexMode

e.Size=g.Size
e.AutomaticSize=g.AutomaticSize
end,
},
{
Properties={"Label"},
Callback=function<StyleFunc>(d,e,f)
local g=e:FindFirstChild"Label"
if not g then return end

local h=d.Class
function h.SetLabel(i,j)
g.Text=j
return i
end

g.Text=tostring(f)
end,
},
{
Properties={"NoGradient"},
WindowProperties={"NoGradients"},
Callback=function<StyleFunc>(d,e,f)
local g=e:FindFirstChildOfClass"UIGradient"
if not g then return end

g.Enabled=f
end,
},
{
Properties={
"UiPadding",
"PaddingBottom",
"PaddingTop",
"PaddingRight",
"PaddingTop"
},
Callback=function<StyleFunc>(d,e,f)
f=f or 0


if typeof(f)=="number"then
f=UDim.new(0,f)
end

local g=d.Class

local h=g.UiPadding
if h then
b:CheckConfig(g,{
PaddingBottom=f,
PaddingLeft=f,
PaddingRight=f,
PaddingTop=f,
})
end

local i=b:GetChildOfClass(e,"UIPadding")
b:SetProperties(i,{
PaddingBottom=g.PaddingBottom,
PaddingLeft=g.PaddingLeft,
PaddingRight=g.PaddingRight,
PaddingTop=g.PaddingTop,
})
end,
},
{
Properties={"Callback"},
Callback=function<StyleFunc>(d,e)
local f=d.Class

function f.SetCallback(g,h)
g.Callback=h
return g
end
function f.FireCallback(g,h)
g.Callback(e)
return g
end
end,
},
{
Properties={"Value"},
Callback=function<StyleFunc>(d,e)
local f=d.Class
b:CheckConfig(f,{
GetValue=function(g)
return f.Value
end,
})
end,
}
}












local d=function()end
local e=get_hidden_gui or gethui
local f=cloneref or function(f):Instance
return f
end


local g=setmetatable({},{
__index=function(g,h:string)
local i=game:GetService(h)
return f(i)
end,
})



local h=game:GetService"HttpService"
local i:Players=g.Players
local j=g.CoreGui
local k=g.UserInputService
local l=g.TweenService
local m=g.RunService


local n=i.LocalPlayer
b.PlayerGui=n.PlayerGui
b.Mouse=n:GetMouse()


local o=b.Animation








function o.Tween(p,q:AnimationTween__DARKLUA_TYPE_f):Tween?
local r=p.DefaultTweenInfo


local s=q.Object
local t=q.NoAnimation
local u=q.Tweeninfo or r
local v=q.EndProperties
local w=q.StartProperties
local x=q.Completed


if w then
b:SetProperties(s,w)
end


if t then
b:SetProperties(s,v)


if x then
x()
end
return
end


local y
for z,A in next,v do
local B={
[z]=A
}


local C,D=pcall(function()
return l:Create(s,u,B)
end)


if not C then
b:SetProperties(s,B)
continue
end


if not y then
y=D
end

D:Play()
end


if x then
if y then
y.Completed:Connect(x)
else
x()
end
end

return y
end







function o.Animate(p,q:Animate__DARKLUA_TYPE_g):Tween
local r=q.NoAnimation
local s=q.Objects
local t=q.Tweeninfo
local u=q.Completed

local v


for w,x in next,s do
local y=p:Tween{
NoAnimation=r,
Object=w,
Tweeninfo=t,
EndProperties=x
}

if not v then
v=y
end
end


if u then
v.Completed:Connect(u)
end

return v
end











function o.HeaderCollapseToggle(p,q:HeaderCollapseToggle__DARKLUA_TYPE_h)

b:CheckConfig(q,{
Rotations={
Open=90,
Closed=0
}
})


local r=q.Toggle
local s=q.NoAnimation
local t=q.Rotations
local u=q.Collapsed
local v=q.Tweeninfo

local w=u and t.Closed or t.Open


p:Tween{
Tweeninfo=v,
NoAnimation=s,
Object=r,
EndProperties={
Rotation=w,
}
}
end

















function o.HeaderCollapse(p,q:HeaderCollapse__DARKLUA_TYPE_i):Tween

local r=q.Tweeninfo
local s=q.Collapsed
local t=q.ClosedSize
local u:UDim2=q.OpenSize
local v=q.Toggle
local w=q.Resize
local x=q.Hide
local y=q.NoAnimation
local z=q.NoAutomaticSize
local A=q.IconRotations
local B=q.Completed


if not z then
w.AutomaticSize=Enum.AutomaticSize.None
end
if not s then
x.Visible=true
end


p:HeaderCollapseToggle{
Tweeninfo=r,
Collapsed=s,
NoAnimation=y,
Toggle=v,
Rotations=A
}

local C=p:Tween{
Tweeninfo=r,
NoAnimation=y,
Object=w,
StartProperties={
Size=s and u or t
},
EndProperties={
Size=s and t or u
},
Completed=function()
x.Visible=not s


if B then
B()
end


if s then return end
if z then return end


w.Size=UDim2.fromScale(1,0)
w.AutomaticSize=Enum.AutomaticSize.Y
end,
}

return C
end












local p=b.Signaling

local q:SignalClass__DARKLUA_TYPE_j={}
q.__index=q

function q.Fire(r,...)
local s=r:GetConnections()
if#s<=0 then return end

for t,u in next,s do
u(...)
end
end
function q.GetConnections(r):table__DARKLUA_TYPE_c
local s=r.Connections
return s
end
function q.Connect(r,s:(...any)->nil)
local t=r:GetConnections()
table.insert(t,s)
end
function q.DisconnectConnections(r)
local s=r:GetConnections()
table.clear(s)
end

function p.NewSignal(r):SignalClass__DARKLUA_TYPE_j
return NewClass(q,{
Connections={}
})
end

function GetAndRemove(r:string,s:table__DARKLUA_TYPE_c)
local t=s[r]
if t then
s[r]=nil
end
return t
end

function MoveTableItem(r:table__DARKLUA_TYPE_c,s,t:number)
local u=table.find(r,s)
if not u then return end

local v=table.remove(r,u)
table.insert(r,t,v)
end

function Merge(r,s)
for t,u in next,s do
r[t]=u
end
end

function Copy(r:table__DARKLUA_TYPE_c,s:table__DARKLUA_TYPE_c?)
local t=table.clone(r)


if s then
Merge(t,s)
end

return t
end





































function NewClass(r,s)
s=s or{}
r.__index=r
return setmetatable(s,r)
end

function b.Warn(r,...:string?)
warn("[ReGui]::",...)
end

function b.Error(r,...:string?)
local s=b:Concat({...}," ")
local t=`\n[ReGui]:: {s}`
coroutine.wrap(error)(t)
end

function b.IsDoubleClick(r,s:number):boolean
local t=r.DoubleClickThreshold
return s<t
end

function b.Init(r,s)
s=s or{}


if r.Initialised then return end


Merge(r,s)
Merge(r,{
Initialised=true,
HasGamepad=r:IsConsoleDevice(),
HasTouchScreen=r:IsMobileDevice(),
})


r:CheckConfig(r,{
ContainerParent=function()
return r:ResolveUIParent()
end,
Prefabs=function()
return r:LoadPrefabs()
end,
},true)


r:CheckConfig(r,{
Container=function()
return r:InsertPrefab("Container",{
Parent=r.ContainerParent,
Name=r.ContainerName
})
end,
},true)


local t=r.Container
local u=r.TooltipOffset
local v=r.ActiveTooltips
local w=t.Overlays
local x=0


b:SetProperties(t.Windows,{
OnTopOfCoreBlur=true
})
b:SetProperties(w,{
OnTopOfCoreBlur=true
})


r.TooltipsContainer=b.Elements:Overlay{
Parent=w
}


k.InputBegan:Connect(function(y:InputObject)
if not r:IsMouseEvent(y,true)then return end

local z=tick()
local A=z-x
local B=r:IsDoubleClick(A)


x=B and 0 or z


r:UpdateWindowFocuses()
end)

local function InputUpdate()
local y=r.TooltipsContainer
local z=#v>0
y.Visible=z

if not z then return end


local A,B=b:GetMouseLocation()
local C=w.AbsolutePosition

y.Position=UDim2.fromOffset(
A-C.X+u,
B-C.Y+u
)
end


m:BindToRenderStep("ReGui_InputUpdate",Enum.RenderPriority.Input.Value,InputUpdate)
end

function b.GetVersion(r):string
return r.Version
end

function b.IsMobileDevice(r):boolean
return k.TouchEnabled
end

function b.IsConsoleDevice(r):boolean
return k.GamepadEnabled
end

function b.GetScreenSize(r):Vector2
return workspace.CurrentCamera.ViewportSize
end

function b.LoadPrefabs(r):Folder?
local s=r.PlayerGui
local t="ReGui-Prefabs"


local u=script:WaitForChild(t,2)
if u then return u end


local v=s:WaitForChild(t,2)
if v then return v end

return nil
end

function b.ResolveUIParent(r):GuiObject?
local s=r.PlayerGui
local t=r.Debug

local u={
[1]=function()
local u=e()
if u.Parent==j then return end

return u
end,
[2]=function()
return j
end,
[3]=function()
return s
end
}

local v=r:CreateInstance"ScreenGui"


for w,x in next,u do

local y,z=pcall(x)
if not y or not z then continue end


local A=pcall(function()
v.Parent=z
end)
if not A then continue end

if t then
r:Warn(`Step: {w} was chosen as the parent!: {z}`)
end

return z
end


r:Warn"The ReGui container does not have a parent defined"

return nil
end

function b.CheckConfig(r,s:table__DARKLUA_TYPE_c,t:table__DARKLUA_TYPE_c,u:boolean?,v:table__DARKLUA_TYPE_c?)
if not s then return end

for w:string?,x in next,t do
if s[w]~=nil then continue end


if v then
if table.find(v,w)then continue end
end


if u then
x=x()
end


s[w]=x
end

return s
end

function b.CheckAssetUrl(r,s:(string|number)):string

if tonumber(s)then
return`rbxassetid://{s}`
end
return s
end

function b.CreateInstance(r,s,t,u):Instance
local v=Instance.new(s,t)


if u then
local w=u.UsePropertiesList

if not w then
r:SetProperties(v,u)
else
r:ApplyFlags{
Object=v,
Class=u
}
end
end

return v
end

function b.ConnectMouseEvent(r,s:GuiObject,t)
local u=t.Callback
local v=t.DoubleClick
local w=t.OnlyMouseHovering

local x=0
local y

if w then
y=r:DetectHover(w)
end

s.Activated:Connect(function(...)
local z=tick()
local A=z-x


if y and not y.Hovering then return end


if v then
if not b:IsDoubleClick(A)then
x=z
return
end
x=0
end

u(...)
end)
end

function b.GetAnimation(r,s:boolean?)
return s and r.Animation or TweenInfo.new(0)
end

function b.DynamicImageTag(r,s:Instance,t:string,u:table__DARKLUA_TYPE_c)
local v=r.DynamicImages
local w=v[t]

if not w then return end
if not u then return end

u:TagElements{
[s]=w
}
end

function b.GetDictSize(r,s:table__DARKLUA_TYPE_c):number
local t=0
for u,v in s do
t+=1
end
return t
end

function b.RemoveAnimations(r,s:GuiObject)
local t=r:GetAnimationData(s)
local u=t.Connections


for v,w in next,u do
w:Disconnect()
end
end

function b.GetAnimationData(r,s:GuiObject):table__DARKLUA_TYPE_c
local t=r.AnimationConnections
local u=t[s]


if u then return u end

local v={
Connections={}
}

t[s]=v
return v
end

function b.AddAnimationSignal(r,s:GuiObject,t:RBXScriptSignal)
local u=r:GetAnimationData(s)
local v=u.Connections

table.insert(v,t)
end

function b.SetAnimationsEnabled(r,s:boolean)
r.NoAnimations=not s
end

function b.SetAnimation(r,s:GuiObject,t:(string|table__DARKLUA_TYPE_c),u:GuiObject?)
u=u or s

local v=r.Animations


local w=t
if typeof(t)~="table"then
w=v[t]
end

assert(w,`No animation data for Class {t}!`)


r:RemoveAnimations(u)


local x=w.Init
local y=w.Connections
local z=w.Tweeninfo
local A=w.NoAnimation


local B=r:GetAnimationData(s)
local C=B.State


local D
local E=true
local F
local G={}


local H={}
function H.Reset(I,J:boolean?)
if not D then return end
D(J)
end
function H.FireSignal(I,J:string,K:boolean?)
G[J](K)
end
function H.Refresh(I,J:boolean?)
if not F then return end
G[F](J)
end
function H.SetEnabled(I,J:boolean)
E=J
end

for I:string,J in next,y do
local function OnSignal(K:boolean?)
K=K==true
F=I


local L=r.NoAnimations
if L then return end


if not E then return end

B.State=I

o:Tween{
NoAnimation=K or A,
Object=s,
Tweeninfo=z,
EndProperties=J
}
end


local K=u[I]
local L=K:Connect(OnSignal)


r:AddAnimationSignal(u,L)

G[I]=OnSignal


if I==x then
D=OnSignal
end
end

if C then

H:FireSignal(C)
else

H:Reset(true)
end

return H
end

function b.GetChildOfClass(r,s:GuiObject,t:string):GuiObject
local u=s:FindFirstChildOfClass(t)


if not u then
u=r:CreateInstance(t,s)
end

return u
end

function b.SetPadding(r,s:UIPadding,t:UDim)
if not s then return end

r:SetProperties(s,{
PaddingBottom=t,
PaddingLeft=t,
PaddingRight=t,
PaddingTop=t
})
end






function b.ConnectDrag(r,s:GuiObject,t)
r:CheckConfig(t,{
DragStart=d,
DragEnd=d,
DragMovement=d,
OnDragStateChange=d,
})


local u=t.DragStart
local v=t.DragEnd
local w=t.DragMovement
local x=t.OnDragStateChange


local y={
StartAndEnd={
Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch
},
Movement={
Enum.UserInputType.MouseMovement,
Enum.UserInputType.Touch
}
}

local z=false

local function InputTypeAllowed(A,B:string)
local C=A.UserInputType
return table.find(y[B],C)
end
local function KeyToVector(A):Vector2
local B=A.Position
return Vector2.new(B.X,B.Y)
end
local function SetIsDragging(A:boolean)

r._DraggingDisabled=A

z=A
x(A)
end
local function MakeSignal(A)
local B=A.IsDragging
local C=A.InputType
local D=A.Callback

return function(E)
if A.DraggingRequired~=z then return end
if A.CheckDraggingDisabled and r._DraggingDisabled then return end
if not InputTypeAllowed(E,C)then return end


if A.UpdateState then
SetIsDragging(B)
end

local F=KeyToVector(E)
D(F)
end
end


s.InputBegan:Connect(MakeSignal{
CheckDraggingDisabled=true,
DraggingRequired=false,
UpdateState=true,
IsDragging=true,
InputType="StartAndEnd",
Callback=u,
})
k.InputEnded:Connect(MakeSignal{
DraggingRequired=true,
UpdateState=true,
IsDragging=false,
InputType="StartAndEnd",
Callback=v,
})
k.InputChanged:Connect(MakeSignal{
DraggingRequired=true,
InputType="Movement",
Callback=w,
})
end









function b.MakeDraggable(r,s:MakeDraggableFlags__DARKLUA_TYPE_l)

local t=s.Move
local u=s.Grab
local v=s.OnDragStateChange

local w
local x


local y={}
function y.SetEnabled(z,A:boolean)
local B=s.StateChanged
z.Enabled=A



if B then
B(z)
end
end
function y.CanDrag(z,A):boolean
return z.Enabled
end


local function DragStart(z)
if not y:CanDrag()then return end
local A=s.DragBegin

x=z
A(x)
end

local function DragMovement(z)
if not y:CanDrag()then return end

local A=z-x
local B=s.OnUpdate

B(A)
end


local function PositionBegan(z)
w=t.Position
end
local function UpdatePosition(z:number)
local A=UDim2.new(
w.X.Scale,
w.X.Offset+z.X,
w.Y.Scale,
w.Y.Offset+z.Y
)
s:SetPosition(A)
end
local function SetPosition(z,A:UDim2)

o:Tween{
Object=t,
EndProperties={
Position=A
}
}
end


r:CheckConfig(s,{
Enabled=true,
OnUpdate=UpdatePosition,
SetPosition=SetPosition,
DragBegin=PositionBegan
})


r:ConnectDrag(u,{
DragStart=DragStart,
DragMovement=DragMovement,
OnDragStateChange=v
})


local z=s.Enabled
y:SetEnabled(z)

return y
end








function b.MakeResizable(r,s:MakeResizableFlags__DARKLUA_TYPE_m)
b:CheckConfig(s,{
MinimumSize=Vector2.new(160,90),
MaximumSize=Vector2.new(math.huge,math.huge)
})


local t=s.MaximumSize
local u=s.MinimumSize
local v=s.Resize
local w=s.OnUpdate

local x


local y=b:InsertPrefab("ResizeGrab",{
Parent=v
})

local function StateChanged(z)
y.Visible=z.Enabled
end


local function UpdateSize(z)
local A=x+z


local B=UDim2.fromOffset(
math.clamp(A.X,u.X,t.X),
math.clamp(A.Y,u.Y,t.Y)
)


if w then
w(B)
return
end


o:Tween{
Object=v,
EndProperties={
Size=B
}
}
end
local function ResizeBegin(z)
x=v.AbsoluteSize
end


local z=r:MakeDraggable{
Grab=y,
OnUpdate=UpdateSize,
DragBegin=ResizeBegin,
StateChanged=StateChanged
}

z.Grab=y

return z
end

function b.IsMouseEvent(r,s:InputObject,t:boolean)
local u=s.UserInputType.Name


if t and u:find"Movement"then return end

return u:find"Touch"or u:find"Mouse"
end









function b.DetectHover(r,s:GuiObject,t:DetectHover__DARKLUA_TYPE_n)
t=t or{}


local u=t.OnInput
local v=t.OnHoverChange
local w=t.Anykey
local x=t.MouseMove
local y=t.MouseEnter
local z=t.MouseOnly

t.Hovering=false

local function Update(A,B:boolean?,C:boolean?)

if A and z then
if not b:IsMouseEvent(A,true)then return end
end


if B~=nil then
local D=t.Hovering
t.Hovering=B


if B~=D and v then
v(B)
end
end


if not y and C then return end


if u then
local D=t.Hovering
return u(D,A)
end
end


local A={
s.MouseEnter:Connect(function()
Update(nil,true,true)
end),
s.MouseLeave:Connect(function()
Update(nil,false,true)
end)
}


if w or z then
table.insert(A,k.InputBegan:Connect(function(B)
Update(B)
end))
end


if x then
local B=s.MouseMoved:Connect(function()
Update()
end)
table.insert(A,B)
end

function t.Disconnect(B)
for C,D in next,A do
D:Disconnect()
end
end

return t
end

function b.StackWindows(r)
local s=r.Windows
local t=20

for u,v in next,s do
local w=v.WindowFrame

local x=UDim2.fromOffset(t*u,t*u)

v:Center()
w.Position+=x
end
end

function b.GetElementFlags(r,s:GuiObject):table__DARKLUA_TYPE_c?
local t=r._FlagCache
return t[s]
end









function b.UpdateColors(r,s:UpdateColors__DARKLUA_TYPE_o)

local t=s.Object
local u=s.Tag
local v=s.NoAnimation
local w=s.TagsList
local x=s.Theme
local y=s.Tweeninfo


local z=r.ElementColors local A=
r.ThemeConfigs
local B=r.Debug
local C=r:GetElementFlags(t)

local D=z[u]


if typeof(D)=="string"then
D=z[D]
end

if typeof(u)=="table"then
D=u
elseif w then
w[t]=u
end


if not D then return end


local E={}
for F:string,G:string in next,D do
local H=r:GetThemeKey(x,G)


if C and C[F]then
continue
end


if not H then
if B then
r:Warn(`Color: '{G}' does not exist!`)
end
continue
end

E[F]=H
end


o:Tween{
Tweeninfo=y,
Object=t,
NoAnimation=v,
EndProperties=E
}
end








function b.MultiUpdateColors(r,s:MultiUpdateColorsConfig__DARKLUA_TYPE_p)
local t=s.Objects

for u:GuiObject,v:string?in next,t do
r:UpdateColors{
TagsList=s.TagsList,
Theme=s.Theme,
NoAnimation=not s.Animate,
Tweeninfo=s.Tweeninfo,

Object=u,
Tag=v,
}
end
end

function b.ApplyStyle(r,s:GuiObject,t:string)
local u=r.Styles

local v=u[t]
if not v then return end


r:ApplyFlags{
Object=s,
Class=v
}
end

function b.MergeMetatables(r,s,t:GuiObject)
local u=r.Debug
local v={}

v.__index=function(w,x:string)

local y=s[x]
if y~=nil then return y end


local z,A=pcall(function()
local z=t[x]
return r:PatchSelf(t,z)
end)

return z and A or nil
end

v.__newindex=function(w,x:string,z)
local A=s[x]~=nil or typeof(z)=="function"

if A then
s[x]=z
return
end

xpcall(function()
t[x]=z
end,function(B)
if u then
r:Warn(`Newindex Error: {t}.{x} = {z}\n{B}`)
end

s[x]=z
end)
end

return setmetatable({},v)
end

function b.Concat(r,s,t:" ")
local u=""
for v,w in next,s do
u..=tostring(w)..(v~=#s and t or"")
end
return u
end

function b.GetValueFromAliases(r,s,t)
for u,v:string in s do
local w=t[v]
if w~=nil then
return w
end
end

return nil
end

function b.RecursiveCall(r,s:GuiObject,t:(GuiObject)->...any)
for u,v in next,s:GetDescendants()do
t(v)
end
end






function b.ApplyFlags(r,s:ApplyFlags__DARKLUA_TYPE_q)
local t=r.ElementFlags


local u=s.Object
local v=s.Class
local w=s.WindowClass

function s.GetThemeKey(x,z:string)
if w then
return w:GetThemeKey(z)
else
return b:GetThemeKey(nil,z)
end
end


r:SetProperties(u,v)


for x,z in next,t do
local A=z.Properties
local B=z.Callback
local C=z.Recursive
local D=z.WindowProperties


local E=r:GetValueFromAliases(A,v)


if w and D and E==nil then
E=r:GetValueFromAliases(D,w)
end

if E==nil then continue end


B(s,u,E)


if C then
r:RecursiveCall(u,function(F)
B(s,F,E)
end)
end
end
end

function b.SetProperties(r,s:Instance,t:table__DARKLUA_TYPE_c)
for u:string,v in next,t do
pcall(function()
s[u]=v
end)
end
end

function b.InsertPrefab(r,s:string,t):GuiObject
local u=r.Prefabs
local v=u.Prefabs

local w=v:WaitForChild(s)
local x=w:Clone()


if t then
local z=t.UsePropertiesList

if not z then
r:SetProperties(x,t)
else
r:ApplyFlags{
Object=x,
Class=t
}
end
end

return x
end

function b.GetContentSize(r,s:GuiObject,t:boolean?):Vector2
local u=s:FindFirstChildOfClass"UIListLayout"
local v=s:FindFirstChildOfClass"UIPadding"
local w=s:FindFirstChildOfClass"UIStroke"

local x:Vector2


if u and not t then
x=u.AbsoluteContentSize
else
x=s.AbsoluteSize
end


if v then
local z=v.PaddingTop.Offset
local A=v.PaddingBottom.Offset
local B=v.PaddingLeft.Offset
local C=v.PaddingRight.Offset

x+=Vector2.new(B+C,z+A)
end

if w then
local z=w.Thickness
x+=Vector2.new(z/2,z/2)
end

return x
end

function b.PatchSelf(r,s,t)

if typeof(t)~="function"then
return t
end

return function(u,...)
return t(s,...)
end
end






function b.MakeCanvas(r,s:MakeCanvas__DARKLUA_TYPE_r)

local t=r.Elements
local u=r.Debug
local v=r.Signaling


local w=s.Element
local x=s.WindowClass
local z=s.Class
local A=s.OnChildChange

local B=v:NewSignal()


if A then
B:Connect(A)
end


if not x and u then
r:Warn(`No WindowClass for {w}`)
r:Warn(s)
end


local C=NewClass(t,{
Class=z,
RawObject=w,
WindowClass=x or false,
OnChildChange=B,
Elements={}
})


local D={
__index=function(D,E:string)

local F=C[E]
if F~=nil then
return r:PatchSelf(C,F)
end


local G=z[E]
if G~=nil then
return r:PatchSelf(z,G)
end


local H=w[E]
return r:PatchSelf(w,H)
end,
__newindex=function(D,E:string,F)
local G=z[E]~=nil


if G then
z[E]=F
else
w[E]=F
end
end,
}

return setmetatable({},D)
end


function b.GetIniData(r,s):table__DARKLUA_TYPE_c
local t=r.IniToSave
local u={}

for v,w in next,t do
u[w]=s[w]
end

return u
end

function b.DumpIni(r,s:boolean?):table__DARKLUA_TYPE_c
local t=r.IniSettings
local u={}

for v,w in next,t do
u[v]=r:GetIniData(w)
end


if s then
return h:JSONEncode(u)
end

return u
end

function b.LoadIniIntoElement(r,s,t:table__DARKLUA_TYPE_c)
local u={Value=
function(u)
s:SetValue(u)
end,
}

for v,w in next,t do

local x=u[v]
if x then
x(w)
continue
end

s[v]=w
end
end

function b.LoadIni(r,s:(table__DARKLUA_TYPE_c|string),t:boolean?)
local u=r.IniSettings
assert(s,"No Ini configuration was passed")


if t then
s=h:JSONDecode(s)
end

for v,w in next,s do
local x=u[v]
r:LoadIniIntoElement(x,w)
end
end

function b.AddIniFlag(r,s:string,t:table__DARKLUA_TYPE_c)
local u=r.IniSettings
u[s]=t
end






function b.OnElementCreate(r,s:OnElementCreateData__DARKLUA_TYPE_s)
local t=r._FlagCache

local u=s.Flags
local v=s.Object
local w=s.Canvas
local x=s.Class

local z=w.WindowClass

local A=u.NoAutoTag
local B=u.NoAutoFlags
local C=u.ColorTag
local D=u.NoStyle
local E=u.IniFlag


t[v]=u


if E then
r:AddIniFlag(E,x)
end


if D then return end


if not A and z then
z:TagElements{
[v]=C
}
end


if z then
z:LoadStylesIntoElement(s)
end

if not B then

r:ApplyFlags{
Object=v,
Class=u,
WindowClass=z
}
end
end

function b.WrapGeneration(r,s,t:table__DARKLUA_TYPE_c)
local u=r._ErrorCache

local v=t.Base
local w=t.IgnoreDefaults

return function(x,z,...)
z=z or{}


r:CheckConfig(z,v)


local A=z.CloneTable


if A then
z=table.clone(z)
end

local B=x.RawObject
local C=x.Elements
local D=x.OnChildChange


r:CheckConfig(z,{
Parent=B,
Name=z.ColorTag
},nil,w)


if x==r then
x=r.Elements
end



local E,F,G=pcall(s,x,z,...)


if E==false then
if B then
if u[B]then return end
u[B]=F
end


if x.Error then
x:Error{
Parent=B,
Text=F
}
end

r:Error("Class:",F)
r:Error(debug.traceback())
end


if G==nil then
G=F
end


if D then
D:Fire(F)
end


if G then
if C then
table.insert(C,G)
end

r:OnElementCreate{
Object=G,
Flags=z,
Class=F,
Canvas=x
}
end

return F,G
end
end

function b.DefineElement(r,s:string,t)
local u=r.Elements
local v=r.ThemeConfigs
local w=r.ElementColors

local x=v.DarkTheme


local z=t.Base
local A=t.Create
local B=t.Export
local C=t.ThemeTags
local D=t.ColorData


r:CheckConfig(z,{
ColorTag=s,
ElementStyle=s
})


if C then
Merge(x,C)
end


if D then
Merge(w,D)
end


local E=r:WrapGeneration(A,t)


if B then
r[s]=E
end


u[s]=E

return E
end

function b.DefineGlobalFlag(r,s)
local t=r.ElementFlags
table.insert(t,s)
end

function b.DefineTheme(r,s:string,t:ThemeData__DARKLUA_TYPE_a)
local u=r.ThemeConfigs


r:CheckConfig(t,{
BaseTheme=u.DarkTheme
})

local v=GetAndRemove("BaseTheme",t)
local w={
BaseTheme=v,
Values=t
}


u[s]=w

return w
end

function b.GetMouseLocation(r):(number,number)
local s=r.Mouse
return s.X,s.Y
end

function b.SetWindowFocusesEnabled(r,s:boolean)
r.WindowFocusesEnabled=s
end

function b.UpdateWindowFocuses(r)
local s=r.Windows
local t=r.WindowFocusesEnabled

if not t then return end


for u,v in s do
local w=v.HoverConnection
if not w then continue end


local x=w.Hovering
if x then
r:SetFocusedWindow(v)
return
end
end

r:SetFocusedWindow(nil)
end

function b.WindowCanFocus(r,s:table__DARKLUA_TYPE_c):boolean
if s.NoSelect then return false end
if s.Collapsed then return false end
if s._SelectDisabled then return false end

return true
end

function b.GetFocusedWindow(r):table__DARKLUA_TYPE_c?
return r.FocusedWindow
end

function b.BringWindowToFront(r,s:table__DARKLUA_TYPE_c)
local t=r.Windows


local u=s.NoBringToFrontOnFocus
if u then return end


MoveTableItem(t,s,1)
end

function b.SetFocusedWindow(r,s:table__DARKLUA_TYPE_c?)
local t=r:GetFocusedWindow()
local u=r.Windows


if t==s then return end
r.FocusedWindow=s


if s then
local v=r:WindowCanFocus(s)
if not v then return end


r:BringWindowToFront(s)
end


local v=#u
for w,x in u do
local z=r:WindowCanFocus(x)
local A=x.WindowFrame


if not z then continue end

v-=1


if v then
A.ZIndex=v
end


local B=x==s
x:SetFocused(B,v)
end
end

function b.SetItemTooltip(r,s:GuiObject,t:(Elements)->...any)local u=
r.Elements
local v=r.TooltipsContainer
local w=r.ActiveTooltips


local x,z=v:Canvas{
Visible=false,
UiPadding=UDim.new()
}


task.spawn(t,x)


b:DetectHover(s,{
MouseMove=true,
MouseEnter=true,
OnHoverChange=function(A:boolean)

if A then
table.insert(w,x)
return
end


local B=table.find(w,x)
table.remove(w,B)
end,
OnInput=function(A:boolean,B)
z.Visible=A
end,
})
end

function b.CheckFlags(r,s,t)
for u:string,v in next,s do
local w=t[u]
if not w then continue end

v(w)
end
end

function b.GetThemeKey(r,s:(string|table__DARKLUA_TYPE_c),t:string)
local u=r.ThemeConfigs


if typeof(s)=="string"then
s=u[s]
end

local v=u.DarkTheme
s=s or v

local w=s.BaseTheme
local x=s.Values


local z=x[t]
if z then return z end


if w then
return r:GetThemeKey(w,t)
end
end

function b.SelectionGroup(r,s)
local t
local u=false

local function ForEach(w,x)
for z,A in next,s do
if typeof(A)=="Instance"then continue end
if A==x then continue end

w(A)
end
end

local function Callback(w)
if u then return end
u=true

local x=t
t=w:GetValue()

if not x then
x=t
end

ForEach(function(z)
z:SetValue(x)
end,w)

u=false
end

ForEach(function(w)
w.Callback=Callback
end)
end


local r=b.Elements
r.__index=r

function r.GetObject(s)
return s.RawObject
end

function r.ApplyFlags(s,t,u)
local w=s.WindowClass

b:ApplyFlags{
WindowClass=w,
Object=t,
Class=u
}
end

function r.Remove(s)
local t=s.OnChildChange
local u=s:GetObject()
local w=s.Class


local x=w.Remove
if x then
return x(w)
end


if t then
t:Fire(w or s)
end

if w then
table.clear(w)
end

u:Destroy()
table.clear(s)
end

function r.GetChildElements(s):table__DARKLUA_TYPE_c
local t=s.Elements
return t
end

function r.ClearChildElements(s)
local t=s:GetChildElements()
for u,w in next,t do
w:Destroy()
end
end

function r.TagElements(s,t:ObjectTable__DARKLUA_TYPE_d)
local u=s.WindowClass
local w=b.Debug


if not u then
if w then
b:Warn("No WindowClass for TagElements:",t)
end
return
end

u:TagElements(t)
end

function r.GetThemeKey(s,t:string)
local u=s.WindowClass

if u then
return u:GetThemeKey(t)
end

return b:GetThemeKey(nil,t)
end

function r.SetColorTags(s,t:ObjectTables,u:boolean?)
local w=s.WindowClass
if not w then return end

local x=w.TagsList
local z=w.Theme

b:MultiUpdateColors{
Animate=u,
Theme=z,
TagsList=x,
Objects=t,
}
end

function r.SetElementFocused(s,t:GuiObject,u)
local w=s.WindowClass
local x=b.HasTouchScreen

local z=u.Focused
local A=u.Animation


b:SetAnimationsEnabled(not z)


if not z and A then
A:Refresh()
end


if not w then return end
if not x then return end
local B=w.ContentCanvas


B.Interactable=not z
end

b:DefineElement("Dropdown",{
Base={
ColorTag="PopupCanvas",
Disabled=false,
AutoClose=true,
OnSelected=d
},
Create=function(s,t)
t.Parent=b.Container.Overlays


local u=t.Selected
local w=t.Items
local x=t.OnSelected


local z,A=s:PopupCanvas(t)
local B=b:MergeMetatables(t,z)

local C={}

local function SetValue(D)
x(D)
end

function t.ClearEntries(D)
for E,F in C do
F:Remove()
end
end

function t.SetItems(D,E:table__DARKLUA_TYPE_c,F)
local G=E[1]


D:ClearEntries()


for H,I in E do
local J=G and I or H
local K=H==F or I==F


local L=z:Selectable{
Text=tostring(J),
Selected=K,
ZIndex=6,
Callback=function()
return SetValue(J)
end,
}

table.insert(C,L)
end
end


if w then
t:SetItems(w,u)
end

return B,A
end,
})

b:DefineElement("OverlayScroll",{
Base={
ElementClass="OverlayScroll",
Spacing=UDim.new(0,4),
},
Create=function(s,t)
local u=s.WindowClass

local w=t.ElementClass
local x=t.Spacing


local z=b:InsertPrefab(w,t)
local A=z:FindFirstChild"ContentFrame"or z
local B=z:FindFirstChild("UIListLayout",true)

B.Padding=x

local C=b:MergeMetatables(s,t)


local D=b:MakeCanvas{
Element=A,
WindowClass=u,
Class=C
}

function t.GetCanvasSize(E)
return A.AbsoluteCanvasSize
end

return D,z
end,
})

b:DefineElement("Overlay",{
Base={
ElementClass="Overlay"
},
Create=r.OverlayScroll,
})





b:DefineElement("Image",{
Base={
Image="",
Callback=d
},
Create=function(s,t:Image__DARKLUA_TYPE_t):ImageButton__DARKLUA_TYPE_x

local u=b:InsertPrefab("Image",t)
u.Activated:Connect(function(...)
local w=t.Callback
return w(u,...)
end)

return u
end,
})





b:DefineElement("VideoPlayer",{
Base={
Video="",
Callback=d
},
Create=function(s,t:VideoPlayer__DARKLUA_TYPE_u):VideoFrame

local u=t.Video
t.Video=b:CheckAssetUrl(u)


local w=b:InsertPrefab("VideoPlayer",t)
return w
end,
})






b:DefineElement("Button",{
Base={
Text="Button",
DoubleClick=false,
Callback=d
},
Create=function(s,t:Button__DARKLUA_TYPE_v):TextButton

local u=b:InsertPrefab("Button",t)

local w=t.DoubleClick


b:ConnectMouseEvent(u,{
DoubleClick=w,
Callback=function(...)
local x=t.Callback
return x(u,...)
end,
})

return u
end,
})







b:DefineElement("Selectable",{
Base={
Text="Selectable",
Callback=d,
Selected=false,
Disabled=false,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,
TextXAlignment=Enum.TextXAlignment.Left,
AnimationTags={
Selected="Buttons",
Unselected="TransparentButtons"
},
},
Create=function(s,t:Selectable__DARKLUA_TYPE_w):(table__DARKLUA_TYPE_c,TextButton)
local u=s.Class.AfterClick

local w=t.Selected
local x=t.Disabled


local z=b:InsertPrefab("Button",t)
local A=b:MergeMetatables(t,z)

z.Activated:Connect(function(...)

local B=t.Callback
B(z,...)


if u then
u(z,...)
end
end)

function t.SetSelected(B,C:boolean?)
local D=B.AnimationTags
local E=C and D.Selected or D.Unselected

B.Selected=C
b:SetAnimation(z,E)
end

function t.SetDisabled(B,C:boolean?)
B.Disabled=C
z.Interactable=not C
end


t:SetSelected(w)
t:SetDisabled(x)

return A,z
end,
})





b:DefineElement("ImageButton",{
Base={
ElementStyle="Button",
Callback=d
},
Create=r.Image,
})

b:DefineElement("SmallButton",{
Base={
Text="Button",
PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),
PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),
ColorTag="Button",
ElementStyle="Button",
Callback=d,
},
Create=r.Button
})

















b:DefineElement("Keybind",{
Base={
Label="Keybind",
ColorTag="Frame",
Value=nil,
DeleteKey=Enum.KeyCode.Backspace,
IgnoreGameProcessed=true,
Enabled=true,
Disabled=false,
Callback=d,
OnKeybindSet=d,
OnBlacklistedKeybindSet=d,
KeyBlacklist={},
UiPadding=UDim.new(),
AutomaticSize=Enum.AutomaticSize.None,
Size=UDim2.new(0.3,0,0,19)
},
Create=function(s,t:Keybind__DARKLUA_TYPE_z)
local u=t.Value
local w=t.Label
local x=t.Disabled
local z=t.KeyBlacklist


local A=b:InsertPrefab("Button",t)
local B=b:MergeMetatables(t,A)

local C=s:Label{
Parent=A,
Text=w,
Position=UDim2.new(1,4,0.5),
AnchorPoint=Vector2.new(0,0.5)
}

local function Callback(D,...)
return D(A,...)
end

local function KeyIsBlacklisted(D:KeyId__DARKLUA_TYPE_y)
local E=table.find(z,D)
return E
end

function t.SetDisabled(D,E:boolean)
D.Disabled=E
A.Interactable=not E
s:SetColorTags({
[C]=E and"LabelDisabled"or"Label"
},true)
end

function t.SetValue(D,E:KeyId__DARKLUA_TYPE_y)
local F=D.OnKeybindSet
local G=D.DeleteKey


if E==G then
E=nil
end

D.Value=E
A.Text=E and E.Name or"Not set"


Callback(F,E)
end

function t.WaitForNewKey(D)
D._WaitingForNewKey=true
A.Text="..."
A.Interactable=false
end

local function GetKeyId(D:InputObject)
local E=D.KeyCode
local F=D.UserInputType


if F~=Enum.UserInputType.Keyboard then
return F
end

return E
end

local function CheckNewKey(D:InputObject)
local E=t.OnBlacklistedKeybindSet
local F=t.Value

local G=GetKeyId(D)


if not k.WindowFocused then return end


if KeyIsBlacklisted(G)then

Callback(E,G)
return
end

A.Interactable=true
t._WaitingForNewKey=false


if G.Name=="Unknown"then
return t:SetValue(F)
end


t:SetValue(G)
end

local function InputBegan(D:InputObject,E:boolean)
local F=t.IgnoreGameProcessed
local G=t.DeleteKey
local H=t.Enabled
local I=t.Value
local J=t.Callback

local K=GetKeyId(D)


if t._WaitingForNewKey then
CheckNewKey(D)
return
end


if not H and A.Interactable then return end
if not F and E then return end


if not I then return end
if K==G then return end
if K.Name~=I.Name then return end


Callback(J,K)
end


t:SetValue(u)
t:SetDisabled(x)


t.Connection=k.InputBegan:Connect(InputBegan)
A.Activated:Connect(function()
t:WaitForNewKey()
end)

b:SetAnimation(A,"Inputs")

return B,A
end
})

b:DefineElement("ArrowButton",{
Base={
Direction="Left",
ColorTag="Button",
Icon=b.Icons.Arrow,
Size=UDim2.fromOffset(21,21),
IconSize=UDim2.fromScale(1,1),
IconPadding=UDim.new(0,4),
Rotations={
Left=180,
Right=0,
}
},
Create=function(s,t):ScrollingFrame

local u=t.Direction
local w=t.Rotations

local x=w[u]
t.IconRotation=x


local z=b:InsertPrefab("ArrowButton",t)
z.Activated:Connect(function(...)
local A=t.Callback
return A(z,...)
end)

return z
end,
})







b:DefineElement("Label",{
Base={
Font="Inconsolata"
},
ColorData={LabelPadding=
{
PaddingTop="LabelPaddingTop",
PaddingBottom="LabelPaddingBottom"
},
},
Create=function(s,t:Label__DARKLUA_TYPE_A):TextLabel

local u=t.Bold
local w=t.Italic
local x=t.Font
local z=t.FontFace


local A=Enum.FontWeight.Medium
local B=Enum.FontWeight.Bold


local C=Enum.FontStyle.Normal
local D=Enum.FontStyle.Italic

local E=u and B or A
local F=w and D or C
local G=u or w

if not z and G then
t.FontFace=Font.fromName(x,E,F)
end

local H=b:InsertPrefab("Label",t)
local I=H:FindFirstChildOfClass"UIPadding"

s:TagElements{
[I]="LabelPadding",
}


return H
end,
})

b:DefineElement("Error",{
Base={
RichText=true,
TextWrapped=true
},
ColorData={Error=
{
TextColor3="ErrorText",
FontFace="TextFont",
},
},
Create=function(s,t:Label__DARKLUA_TYPE_A)
local u=t.Text
t.Text=`<b>⛔ Error:</b> {u}`

return s:Label(t)
end,
})


local s={
Engaged=false
}
s.__index=s

function s.SetEngaged(t,u:boolean)local w=
t.Object
local x=t.WindowClass

t.Engaged=u


if x then
x:SetCanvasInteractable(not u)
end
end

function s.IsHovering(t):boolean
local u=false


t:Foreach(function(w)
u=w.Popup:IsMouseHovering()
return u
end)

return u
end

function s.Foreach(t,u)
local w=t.Menus
for x,z in next,w do

local A=u(z)
if A then break end
end
end

function s.SetFocusedMenu(t,u)
t:Foreach(function(w)

local x=w==u
w:SetActiveState(x)
end)
end

function s.Close(t)
t:SetEngaged(false)
t:SetFocusedMenu(nil)
end

function s.MenuItem(t,u)
local w=t.Canvas
local x=t.Menus


local z=w:MenuButton(u)
local A=w:PopupCanvas{
RelativeTo=z,
MaxSizeX=210,
Visible=false,
AutoClose=false,
AfterClick=function()
t:Close()
end,
}


local B={
Popup=A,
Button=z
}


b:DetectHover(z,{
MouseEnter=true,
OnInput=function()
if not t.Engaged then return end
t:SetFocusedMenu(B)
end,
})

function B.SetActiveState(C,D:boolean)
A:SetPopupVisible(D)
z:SetSelected(D)
end


z.Activated:Connect(function()
t:SetFocusedMenu(B)
t:SetEngaged(true)
end)


table.insert(x,B)

return A,B
end

b:DefineElement("MenuBar",{
Base={},
Create=function(t,u):Elements
local w=t.WindowClass


local x=b:InsertPrefab("MenuBar",u)


local z=b:MakeCanvas{
Element=x,
WindowClass=w,
Class=u
}


local A=NewClass(s,{
WindowClass=w,
Canvas=z,
Object=x,
Menus={}
})
Merge(A,u)


b:DetectHover(x,{
MouseOnly=true,
OnInput=function()
if not A.Engaged then return end
if A:IsHovering()then return end

A:Close()
end,
})

local B=b:MergeMetatables(A,z)
return B,x
end,
})

b:DefineElement("MenuButton",{
Base={
Text="MenuButton",
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
Size=UDim2.fromOffset(0,19),
AutomaticSize=Enum.AutomaticSize.XY
},
Create=r.Selectable
})


local t={
ColorTags={
BGSelected={
[true]="SelectedTab",
[false]="DeselectedTab"
},
LabelSelected={
[true]="SelectedTabLabel",
[false]="DeselectedTabLabel"
},
}
}
function t.SetButtonSelected(u,w:table__DARKLUA_TYPE_c,x:boolean)

if w.IsSelected==x then return end
w.IsSelected=x

local z=u.NoAnimation
local A=u.WindowClass
local B=u.ColorTags


local C=A.Theme
local D=A.TagsList


local E=B.BGSelected
local F=B.LabelSelected

local G=w.TabButton
local H=G.Button
local I=H.Label

b:MultiUpdateColors{
Animate=not z,
Theme=C,
TagsList=D,
Objects={
[H]=E[x],
[I]=F[x],
},
}
end

function t.CompareTabs(u,w,x)
if not w then return false end
return w.MatchBy==x or w==x
end

function t.ForEachTab(u,w:(Tab__DARKLUA_TYPE_B|string),x:(Tab__DARKLUA_TYPE_B,IsMatch:boolean,Index:number)->nil)
local z=typeof(w)=="string"
local A=u.Tabs

for B,C in A do
local D=C.Name
local E=false


if z then
E=D==w
else
E=u:CompareTabs(C,w)
end


x(C,E,B)
end
end

function t.RemoveTab(u,w:(Tab__DARKLUA_TYPE_B|string))
local x=u.OnTabRemove
local z=u.Tabs

u:ForEachTab(w,function(A,B,C)
if not B then return end
local D=A.TabButton
local E=A.OnClosure


table.remove(z,C)
D:Destroy()


x(u,A)
E(A)
end)

return u
end









function t.CreateTab(u,w:Tab__DARKLUA_TYPE_B):Elements
w=w or{}
b:CheckConfig(w,{
Name="Tab",
AutoSize="Y",
Focused=false,
OnClosure=d
})


local x=u.AutoSelectNewTabs
local z=u.WindowClass
local A=u.ParentCanvas
local B=u.Tabs
local C=u.TabsFrame
local D=u.OnTabCreate


local E=w.Focused
local F=w.Name local G=
w.Icon
local H=E or#B<=0 and x


local I=b:InsertPrefab("TabButton",w)
I.Parent=C


local J=I.Button
local K=J:FindFirstChildOfClass"UIPadding"
local L=J.Label
L.Text=tostring(F)

Merge(w,{
TabButton=I
})

local function SetActive()
u:SetActiveTab(w)
end


local M={Closeable=
function()
local M=A:RadioButton{
Parent=J,
Visible=not u.NoClose,
Icon=b.Icons.Close,
IconSize=UDim2.fromOffset(11,11),
LayoutOrder=3,
ZIndex=2,
UsePropertiesList=true,
Callback=function()
u:RemoveTab(w)
end,
}


local N=M.Icon
b:SetAnimation(N,{
Connections={
MouseEnter={
ImageTransparency=0,
},
MouseLeave={
ImageTransparency=1,
}
},
Init="MouseLeave"
},I)
end,
}


J.Activated:Connect(SetActive)


b:CheckFlags(M,w)


table.insert(B,w)


if z then
z:TagElements{
[K]="TabPadding",
}
end


b:SetAnimation(J,"Buttons")
u:SetButtonSelected(w,H)


A:ApplyFlags(I,w)

local N=D(u,w)


if H then
u:SetActiveTab(w)
end

return N or w
end

function t.SetActiveTab(u,w:(table__DARKLUA_TYPE_c|string))local x=

u.Tabs local z=
u.NoAnimation
local A=u.ActiveTab
local B=u.OnActiveTabChange local C=

typeof(w)=="string"
local D


u:ForEachTab(w,function(E,F,G)
if F then
D=E
end
u:SetButtonSelected(E,F)
end)

if not D then return u end
if u:CompareTabs(D,A)then return u end

u.ActiveTab=D


B(u,D,A)

return u
end







b:DefineElement("TabBar",{
Base={
AutoSelectNewTabs=true,
OnActiveTabChange=d,
OnTabCreate=d,
OnTabRemove=d,
},
ColorData={DeselectedTab=
{
BackgroundColor3="TabBg"
},SelectedTab=
{
BackgroundColor3="TabBgActive"
},DeselectedTabLabel=
{
FontFace="TextFont",
TextColor3="TabText",
},SelectedTabLabel=
{
FontFace="TextFont",
TextColor3="TabTextActive",
},TabsBarSeparator=
{
BackgroundColor3="TabBgActive",
},TabPadding=
{
PaddingTop="TabTextPaddingTop",
PaddingBottom="TabTextPaddingBottom"
},TabPagePadding=
{
PaddingBottom="TabPagePadding",
PaddingLeft="TabPagePadding",
PaddingRight="TabPagePadding",
PaddingTop="TabPagePadding",
}
},
Create=function(u,w:TabBar__DARKLUA_TYPE_C)
local A=u.WindowClass


local B=b:InsertPrefab("TabsBar",w)
local C=NewClass(t)

local D=B.Separator
local E=B.TabsFrame


local F=b:MakeCanvas{
Element=E,
WindowClass=A,
Class=C
}


Merge(C,w)
Merge(C,{
ParentCanvas=u,
Object=B,
TabsFrame=E,
WindowClass=A,
Tabs={}
})


u:TagElements{
[B]="TabsBar",
[D]="TabsBarSeparator",
}

local G=b:MergeMetatables(F,B)
return G,B
end,
})





b:DefineElement("TabSelector",{
Base={
NoTabsBar=false,
OnActiveTabChange=d,
OnTabCreate=d,
OnTabRemove=d,
},
Create=function(u,w:TabSelector__DARKLUA_TYPE_D):(TabSelector__DARKLUA_TYPE_D,GuiObject)
local A=u.WindowClass

local B=w.NoTabsBar
local C=w.NoAnimation


local D=b:InsertPrefab("TabSelector",w)

local E=D.Body
local F=E.PageTemplate
F.Visible=false


local function OnTabCreate(G,H,...)
local I=H.AutoSize
local J=H.Name


local K=F:Clone()
local L=b:GetChildOfClass(K,"UIPadding")

b:SetProperties(K,{
Parent=E,
Name=J,
AutomaticSize=Enum.AutomaticSize[I],
Size=UDim2.fromScale(
I=="Y"and 1 or 0,
I=="X"and 1 or 0
)
})


u:TagElements{
[L]="TabPagePadding",
}


local M=b:MakeCanvas{
Element=K,
WindowClass=A,
Class=H
}


w.OnTabCreate(G,H,...)

Merge(H,{
Page=K,
MatchBy=M
})

return M
end
local function OnActiveTabChange(G,H,...)
G:ForEachTab(H,function(I,J,K)
local L=I.Page
L.Visible=J

if not J then return end


local M=u:GetThemeKey"AnimationTweenInfo"
o:Tween{
Object=L,
Tweeninfo=M,
NoAnimation=C,
StartProperties={
Position=UDim2.fromOffset(0,4)
},
EndProperties={
Position=UDim2.fromOffset(0,0)
}
}
end)


w.OnActiveTabChange(G,H,...)
end


local G=u:TabBar{
Parent=D,
Visible=not B,
OnTabCreate=OnTabCreate,
OnActiveTabChange=OnActiveTabChange,
OnTabRemove=function(G,H,...)
H.Page:Remove()
w.OnTabRemove(...)
end,
}

local H=b:MergeMetatables(G,D)
return H,D
end,
})






b:DefineElement("RadioButton",{
Base={
Callback=d,
},
Create=function(u,w:RadioButton__DARKLUA_TYPE_E):GuiButton
local A=b:InsertPrefab("RadioButton",w)
A.Activated:Connect(function(...)
local B=w.Callback
return B(A,...)
end)

return A
end,
})












b:DefineElement("Checkbox",{
Base={
Label="Checkbox",
IsRadio=false,
Value=false,
NoAutoTag=true,
TickedImageSize=UDim2.fromScale(1,1),
UntickedImageSize=UDim2.fromScale(0,0),
Callback=d,
Disabled=false
},
Create=function(u,w:Checkbox__DARKLUA_TYPE_F):Checkbox__DARKLUA_TYPE_F

local A=w.IsRadio
local B=w.Value
local C=w.Label
local D=w.TickedImageSize
local E=w.UntickedImageSize
local F=w.Disabled


local G=b:InsertPrefab("CheckBox",w)
local H=b:MergeMetatables(w,G)

local I=G.Tickbox
local J=I.Tick
J.Image=b.Icons.Checkmark


local K=I:FindFirstChildOfClass"UIPadding"
local L=b:GetChildOfClass(I,"UICorner")


local M=u:Label{
Text=C,
Parent=G,
LayoutOrder=2
}


local N=UDim.new(0,3)
if A then
J.ImageTransparency=1
J.BackgroundTransparency=0
L.CornerRadius=UDim.new(1,0)
else
N=UDim.new(0,2)
end


b:SetProperties(K,{
PaddingBottom=N,
PaddingLeft=N,
PaddingRight=N,
PaddingTop=N,
})


local function Callback(...)
local O=w.Callback
return O(H,...)
end

local function SetStyle(O:boolean,P:boolean)
local Q=u:GetThemeKey"AnimationTweenInfo"


local R=O and D or E
o:Tween{
Object=J,
Tweeninfo=Q,
NoAnimation=P,
EndProperties={
Size=R
}
}
end

function w.SetDisabled(O,P:boolean)
O.Disabled=P
G.Interactable=not P

u:SetColorTags({
[M]=P and"LabelDisabled"or"Label"
},true)
end

function w.SetValue(O,P:boolean,Q:boolean)
O.Value=P


SetStyle(P,Q)


Callback(P)

return O
end

function w.SetTicked(O,...)
b:Warn"Checkbox:SetTicked is deprecated, please use :SetValue"
return O:SetValue(...)
end

function w.Toggle(O)
local P=not O.Value
O.Value=P
O:SetValue(P)

return O
end


local function Clicked()
w:Toggle()
end


G.Activated:Connect(Clicked)
I.Activated:Connect(Clicked)


w:SetValue(B,true)
w:SetDisabled(F)


b:SetAnimation(I,"Buttons",G)
u:TagElements{
[J]="CheckMark",
[I]="Checkbox"
}

return H,G
end,
})

b:DefineElement("Radiobox",{
Base={
IsRadio=true,
CornerRadius=UDim.new(1,0),
},
Create=r.Checkbox,
})



















b:DefineElement("PlotHistogram",{
Base={
ColorTag="Frame",
Label="Histogram"
},
Create=function(u,w:PlotHistogram__DARKLUA_TYPE_G)

local A=w.Label
local B=w.Points


local C=b:InsertPrefab("Histogram",w)
local D=b:MergeMetatables(w,C)

local E=C.Canvas
local F=E.PointTemplate
F.Visible=false

u:Label{
Text=A,
Parent=C,
Position=UDim2.new(1,4)
}


local G
b:SetItemTooltip(C,function(H)
G=H:Label()
end)

Merge(w,{
_Plots={},
_Cache={}
})

function w.GetBaseValues(H):(number,number)
local I=H.Minimum
local J=H.Maximum


if I and J then
return I,J
end

local K=H._Plots

for L,M in K do
local N=M.Value


if not I or N<I then
I=N
end


if not J or N>J then
J=N
end
end

return I,J
end

function w.UpdateGraph(H)
local I=H._Plots

local J,K=H:GetBaseValues()
if not J or not K then return end

local L=K-J


for M,N in I do
local O=N.Point
local P=N.Value

local Q=(P-J)/L
Q=math.clamp(Q,0.05,1)

O.Size=UDim2.fromScale(1,Q)
end

return H
end

function w.Plot(H,I)
local J=H._Plots
local K={}


local L=F:Clone()
local M=L.Bar

b:SetProperties(L,{
Parent=E,
Visible=true
})

local N=b:DetectHover(L,{
MouseEnter=true,
OnInput=function()
K:UpdateTooltip()
end,
})

local O={
Object=L,
Point=M,
Value=I
}

function K.UpdateTooltip(P)
local Q=K:GetPointIndex()
G.Text=`{Q}:	{O.Value}`
end

function K.SetValue(P,Q)
O.Value=Q
w:UpdateGraph()


if N.Hovering then
P:UpdateTooltip()
end
end

function K.GetPointIndex(P):number
return table.find(J,O)
end

function K.Remove(P,Q)
table.remove(J,P:GetPointIndex())
L:Remove()
w:UpdateGraph()
end


table.insert(J,O)


H:UpdateGraph()


b:SetAnimation(M,"Plots",L)
u:TagElements{
[M]="Plot"
}

return K
end

function w.PlotGraph(H,I)
local J=H._Cache


local K=#J-#I
if K>=1 then

for L=1,K do
local M=table.remove(J,L)
if M then
M:Remove()
end
end
end

for L,M in I do

local N=J[L]
if N then
N:SetValue(M)
continue
end


J[L]=H:Plot(M)
end

return H
end


if B then
w:PlotGraph(B)
end

return D,C
end,
})












b:DefineElement("Viewport",{
Base={
IsRadio=true,
},
Create=function(u,w:Viewport__DARKLUA_TYPE_H):Viewport__DARKLUA_TYPE_H

local A=w.Model
local B=w.Camera


local C=b:InsertPrefab("Viewport",w)
local D=b:MergeMetatables(w,C)

local E=C.Viewport
local F=E.WorldModel

if not B then
B=b:CreateInstance("Camera",E)
B.CFrame=CFrame.new(0,0,0)
end

Merge(w,{
Camera=B,
WorldModel=F,
Viewport=E
})

function w.SetCamera(G,H)
G.Camera=H
E.CurrentCamera=H
return G
end

function w.SetModel(G,H:Model,I:CFrame?)
local J=G.Clone

F:ClearAllChildren()


if J then
H=H:Clone()
end

if I then
H:PivotTo(I)
end

H.Parent=F
G.Model=H

return H
end


if A then
w:SetModel(A)
end

w:SetCamera(B)

return D,C
end,
})













b:DefineElement("InputText",{
Base={
Value="",
Placeholder="",
Label="Input text",
Callback=d,
MultiLine=false,
NoAutoTag=true,
Disabled=false
},
Create=function(u,w:InputText__DARKLUA_TYPE_I):InputText__DARKLUA_TYPE_I

local A=w.MultiLine
local B=w.Placeholder
local C=w.Label
local D=w.Disabled
local E=w.Value


local F=b:InsertPrefab("InputBox",w)
local G=F.Frame
local H=G.Input

local I=b:MergeMetatables(w,F)

u:Label{
Parent=F,
Text=C,
AutomaticSize=Enum.AutomaticSize.X,
Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,4),
LayoutOrder=2
}

b:SetProperties(H,{
PlaceholderText=B,
MultiLine=A
})

local function Callback(...)
local J=w.Callback
J(I,...)
end

function w.SetValue(J,K:string?)
H.Text=tostring(K)
J.Value=K
return J
end

function w.SetDisabled(J,K:boolean)
J.Disabled=K
F.Interactable=not K
u:SetColorTags({
[C]=K and"LabelDisabled"or"Label"
},true)
return J
end

function w.Clear(J)
H.Text=""
return J
end

local function TextChanged()
local J=H.Text
w.Value=J
Callback(J)
end


H:GetPropertyChangedSignal"Text":Connect(TextChanged)


w:SetDisabled(D)
w:SetValue(E)

u:TagElements{
[H]="Frame"
}

return I,F
end,
})















b:DefineElement("InputInt",{
Base={
Value=0,
Increment=1,
Placeholder="",
Label="Input Int",
Callback=d,
},
Create=function(u,w:InputInt__DARKLUA_TYPE_J):InputInt__DARKLUA_TYPE_J

local A=w.Value
local B=w.Placeholder
local C=w.Label
local D=w.Disabled
local E=w.NoButtons


local F=b:InsertPrefab("InputBox",w)
local G=b:MergeMetatables(w,F)

local H=F.Frame
local I=H.Input
I.PlaceholderText=B


local J=u:Button{
Text="-",
Parent=H,
LayoutOrder=2,
Ratio=1,
AutomaticSize=Enum.AutomaticSize.None,
FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),
Visible=not E,
Callback=function()
w:Decrease()
end,
}


local K=u:Button{
Text="+",
Parent=H,
LayoutOrder=3,
Ratio=1,
AutomaticSize=Enum.AutomaticSize.None,
FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),
Visible=not E,
Callback=function()
w:Increase()
end,
}

local L=u:Label{
Parent=F,
Text=C,
AutomaticSize=Enum.AutomaticSize.X,
Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,4),
LayoutOrder=4
}

local function Callback(...)
local M=w.Callback
M(G,...)
end

function w.Increase(M)
local N=M.Value
local O=M.Increment
w:SetValue(N+O)
end

function w.Decrease(M)
local N=M.Value
local O=M.Increment
w:SetValue(N-O)
end

function w.SetDisabled(M,N:boolean)
M.Disabled=N
F.Interactable=not N
u:SetColorTags({
[L]=N and"LabelDisabled"or"Label"
},true)
end

function w.SetValue(M,N:number?)
local O=M.Value
local P=M.Minimum
local Q=M.Maximum


N=tonumber(N)


if not N then
N=O
end


if P and Q then
N=math.clamp(N,P,Q)
end


I.Text=N
w.Value=N
Callback(N)

return M
end

local function TextChanged()
local M=I.Text
w:SetValue(M)
end


w:SetValue(A)
w:SetDisabled(D)


I.FocusLost:Connect(TextChanged)


u:TagElements{
[K]="Button",
[J]="Button",
[I]="Frame",
}

return G,F
end,
})

b:DefineElement("InputTextMultiline",{
Base={
Label="",
Size=UDim2.new(1,0,0,39),
Border=false,
ColorTag="Frame"
},
Create=function(u,w)
return u:Console(w)
end,
})





















b:DefineElement("Console",{
Base={
Enabled=true,
Value="",
TextWrapped=false,
Border=true,
MaxLines=300,
LinesFormat="%s",
Callback=d,
},
Create=function(u,w:Console__DARKLUA_TYPE_K):Console__DARKLUA_TYPE_K

local A=w.ReadOnly
local B=w.LineNumbers local C=
w.Fill
local D=w.Value
local E=w.Placeholder


local F=b:InsertPrefab("Console",w)
local G=b:MergeMetatables(w,F)

local H:TextBox=F.Source
local I=F.Lines
I.Visible=B

function w.CountLines(J,K:boolean?):number
local L=H.Text:split"\n"
local M=#L

if M==1 and L[1]==""then
return 0
end

return M
end

function w.UpdateLineNumbers(J)

local K=J.LineNumbers
local L=J.LinesFormat


if not K then return end


local M=J:CountLines()
I.Text=""

for N=1,M do
local O=L:format(N)
local P=N~=M and'\n'or''
I.Text..=`{O}{P}`
end


local N=I.AbsoluteSize.X
H.Size=UDim2.new(1,-N,0,0)

return J
end

function w.CheckLineCount(J)

local K=w.MaxLines
if not K then return end

local L=H.Text
local M=L:split"\n"


if#M>K then
local N=`{M[1]}\\n`
local O=L:sub(#N)
J:SetValue(O)
end

return J
end

function w.UpdateScroll(J)
local K=F.AbsoluteCanvasSize
F.CanvasPosition=Vector2.new(0,K.Y)
return J
end

function w.SetValue(J,K:string?)
if not J.Enabled then return end

H.Text=tostring(K)
J:Update()

return J
end

function w.GetValue(J)
return H.Text
end

function w.Clear(J)
H.Text=""
J:Update()
return J
end

function w.AppendText(J,...)
local K=J:CountLines(true)
local L=b:Concat({...}," ")


if K==0 then
return J:SetValue(L)
end

local M=J:GetValue()
local N=`{M}\n{L}`


J:SetValue(N)

return J
end

function w.Update(J)

local K=J.AutoScroll

J:CheckLineCount()
J:UpdateLineNumbers()


if K then
J:UpdateScroll()
end
end

local function Changed()
local J=w:GetValue()
w:Update()
w.Callback(J)
end


w:SetValue(D)


b:SetProperties(H,w)
b:SetProperties(H,{
TextEditable=not A,
Parent=F,
PlaceholderText=E
})

u:TagElements{
[H]="ConsoleText",
[I]="ConsoleLineNumbers",
}


H:GetPropertyChangedSignal"Text":Connect(Changed)

return G,F
end,
})













b:DefineElement("Table",{
Base={
VerticalAlignment=Enum.VerticalAlignment.Top,
RowBackground=false,
RowBgTransparency=0.87,
Border=false,
Spacing=UDim.new(0,4)
},
Create=function(u,w:Table__DARKLUA_TYPE_L):Table__DARKLUA_TYPE_L
local A=u.WindowClass


local B=w.RowBgTransparency
local C=w.RowBackground
local D=w.Border
local E=w.VerticalAlignment
local F=w.MaxColumns
local G=w.Spacing


local H=b:InsertPrefab("Table",w)
local I=b:MergeMetatables(w,H)

local J=H.RowTemp
local K=0
local L={}
local M=D and C

function w.Row(N,O)
O=O or{}

local P=O.IsHeader

local Q=0
local R={}


local S=J:Clone()
b:SetProperties(S,{
Name="Row",
Visible=true,
Parent=H,
})


local T=S:FindFirstChildOfClass"UIListLayout"
b:SetProperties(T,{
VerticalAlignment=E,
Padding=not M and G or UDim.new(0,1)
})


if P then
u:TagElements{
[S]="Header"
}
else
K+=1
end


if C and not P then
local U=K%2~=1 and B or 1
S.BackgroundTransparency=U
end


local U={}
local V=b:MergeMetatables(U,S)

function U.Column(W,X)
X=X or{}

b:CheckConfig(X,{
HorizontalAlign=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top,
})


local Y=S.ColumnTemp:Clone()


local Z=Y:FindFirstChildOfClass"UIListLayout"
b:SetProperties(Z,X)


local _=Y:FindFirstChildOfClass"UIStroke"
_.Enabled=D


local aa=Y:FindFirstChildOfClass"UIPadding"
if not M then
aa:Destroy()
end


b:SetProperties(Y,{
Parent=S,
Visible=true,
Name="Column"
})


return b:MakeCanvas{
Element=Y,
WindowClass=A,
Class=V
}
end

function U.NextColumn(aa)
Q+=1

local W=Q%F+1
local X=R[W]


if not X then
X=aa:Column()
R[W]=X
end

return X
end

table.insert(L,U)


return V
end


function w.NextRow(aa)
return aa:Row()
end

function w.HeaderRow(aa)
return aa:Row{
IsHeader=true
}
end

function w.ClearRows(aa)
K=0


for N,O:Frame in next,H:GetChildren()do
if not O:IsA"Frame"then continue end
if O==J then continue end

O:Destroy()
end

return w
end

return I,H
end,
})




b:DefineElement("List",{
Base={
Spacing=4,
HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top,
FillDirection=Enum.FillDirection.Horizontal,
},
Create=function(aa,u)
local w=aa.WindowClass


local A=u.Spacing
local B=u.HorizontalFlex
local C=u.VerticalFlex
local D=u.HorizontalAlignment
local E=u.VerticalAlignment
local F=u.FillDirection


local G=b:InsertPrefab("List",u)
local H=b:MergeMetatables(u,G)

local I:UIListLayout=G.UIListLayout
b:SetProperties(I,{
Padding=UDim.new(0,A),
HorizontalFlex=B,
VerticalFlex=C,
HorizontalAlignment=D,
VerticalAlignment=E,
FillDirection=F,
})


local J=b:MakeCanvas{
Element=G,
WindowClass=w,
Class=H
}

return J,G
end,
})




















b:DefineElement("CollapsingHeader",{
Base={
Title="Collapsing Header",
CollapseIcon=b.Icons.Arrow,
Collapsed=true,
Offset=0,
NoAutoTag=true,
NoAutoFlags=true,
IconPadding=UDim.new(0,4),
Activated=d
},
Create=function(aa,u:CollapsingHeader__DARKLUA_TYPE_N):CollapsingHeader__DARKLUA_TYPE_N

local w=u.Title
local A=u.Collapsed
local B=u.ElementStyle
local C=u.Offset
local D=u.TitleBarProperties
local E=u.OpenOnDoubleClick
local F=u.OpenOnArrow
local G=u.CollapseIcon
local H=u.IconPadding
local I=u.Icon
local J=u.NoArrow


local K=b:InsertPrefab("CollapsingHeader",u)

local L=K.TitleBar
local M=L.Collapse
local N=L.Icon
aa:ApplyFlags(N,{
Image=I
})

local O=M.CollapseIcon
local P=M.UIPadding
b:SetPadding(P,H)
aa:ApplyFlags(O,{
Image=G
})

local Q=aa:Label{
ColorTag="CollapsingHeader",
Parent=L,
LayoutOrder=2
}


local R,S=aa:Indent{
Class=u,
Parent=K,
Offset=C,
LayoutOrder=2,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.None,
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,1),
}

local function Activated()
local T=u.Activated
T(R)
end

function u.Remove(T)
K:Destroy()
table.clear(T)
end
function u.SetArrowVisible(T,U:boolean)
O.Visible=U
end
function u.SetTitle(T,U:string)
Q.Text=U
end
function u.SetVisible(T,U:boolean)
K.Visible=U
end
function u.SetIcon(T,U:(string|number)?)
local V=U and U~=""
N.Visible=V

if V then
N.Image=b:CheckAssetUrl(U)
end
end


function u.SetCollapsed(T,U)
T.Collapsed=U

local V=b:GetContentSize(S)
local W=R:GetThemeKey"AnimationTweenInfo"


local X=UDim2.fromScale(1,0)
local Y=X+UDim2.fromOffset(0,V.Y)

o:HeaderCollapse{
Tweeninfo=W,
Collapsed=U,
Toggle=O,
Resize=S,
Hide=S,


ClosedSize=X,
OpenSize=Y,
}

return T
end

local function Toggle()
u:SetCollapsed(not u.Collapsed)
end


if D then
R:ApplyFlags(L,D)
end


if not F then
b:ConnectMouseEvent(L,{
DoubleClick=E,
Callback=Toggle,
})
end
O.Activated:Connect(Toggle)
L.Activated:Connect(Activated)


u:SetCollapsed(A)
u:SetTitle(w)
u:SetArrowVisible(not J)


b:ApplyStyle(L,B)
R:TagElements{
[L]="CollapsingHeader",
}

return R,K
end,
})

b:DefineElement("TreeNode",{
Base={
Offset=21,
IconPadding=UDim.new(0,2),
TitleBarProperties={
Size=UDim2.new(1,0,0,13)
}
},
Create=r.CollapsingHeader,
})




b:DefineElement("Separator",{
Base={
NoAutoTag=true,
NoAutoTheme=true
},
Create=function(aa,u)
local w=u.Text


local A=b:InsertPrefab("SeparatorText",u)

aa:Label{
Text=tostring(w),
Visible=w~=nil,
Parent=A,
LayoutOrder=2,
Size=UDim2.new(),
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
}

aa:TagElements{
[A.Left]="Separator",
[A.Right]="Separator",
}

return A
end,
})





b:DefineElement("Canvas",{
Base={},
Create=function(aa,u:Canvas__DARKLUA_TYPE_P)
local w=aa.WindowClass

local A=u.Scroll
local B=u.Class or u


local C=A and"ScrollingCanvas"or"Canvas"
local D=b:InsertPrefab(C,u)


local E=b:MakeCanvas{
Element=D,
WindowClass=w,
Class=B
}

return E,D
end,
})

b:DefineElement("ScrollingCanvas",{
Base={
Scroll=true
},
Create=r.Canvas
})




b:DefineElement("Region",{
Base={
Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y
},
Create=function(aa,u:Region__DARKLUA_TYPE_Q)
local w=aa.WindowClass

local A=u.Scroll
local B=A and"ScrollingCanvas"or"Canvas"


local C=b:InsertPrefab(B,u)


local D=b:MakeCanvas{
Element=C,
WindowClass=w,
Class=u
}

return D,C
end,
})

b:DefineElement("Group",{
Base={
Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y
},
Create=function(aa,u)
local w=aa.WindowClass


local A=b:InsertPrefab("Group",u)


local B=b:MakeCanvas{
Element=A,
WindowClass=w,
Class=u
}

return B,A
end,
})




b:DefineElement("Indent",{
Base={
Offset=15,
PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),
PaddingRight=UDim.new(),
},
Create=function(aa,u:Indent__DARKLUA_TYPE_R)
local w=u.Offset
u.PaddingLeft=UDim.new(0,w)

return aa:Canvas(u)
end,
})








b:DefineElement("BulletText",{
Base={},
Create=function(aa,u:BulletText__DARKLUA_TYPE_S)
local w=u.Rows


for A,B in next,w do
local C=aa:Bullet(u)
C:Label{
Text=tostring(B),
LayoutOrder=2,
Size=UDim2.fromOffset(0,14),
}
end
end,
})




b:DefineElement("Bullet",{
Base={
Padding=3,
Icon=b.Icons.Dot,
IconSize=UDim2.fromOffset(5,5)
},
Create=function(aa,u:Bullet__DARKLUA_TYPE_T)
local w=aa.WindowClass


local A=u.Padding


local B=b:InsertPrefab("Bullet",u)


local C=b:MakeCanvas{
Element=B,
WindowClass=w,
Class=aa
}


local D=B.UIListLayout
D.Padding=UDim.new(0,A)

return C,B
end,
})








b:DefineElement("Row",{
Base={
Spacing=4,
Expanded=false,
HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,
},
Create=function(aa,u:Row__DARKLUA_TYPE_U)
local w=aa.WindowClass


local A=u.Spacing
local B=u.Expanded
local C=u.HorizontalFlex
local D=u.VerticalFlex


local E=b:InsertPrefab("Row",u)
local F=b:MergeMetatables(u,E)

local G=E:FindFirstChildOfClass"UIListLayout"
G.Padding=UDim.new(0,A)
G.HorizontalFlex=C
G.VerticalFlex=D


local H=b:MakeCanvas{
Element=E,
WindowClass=w,
Class=F
}

function u.Expand(I)
G.HorizontalFlex=Enum.UIFlexAlignment.Fill
return I
end


if B then
u:Expand()
end

return H,E
end,
})


















b:DefineElement("SliderBase",{
Base={
Format="%.f",
Label="",
Type="Slider",
Callback=d,
NoGrab=false,
NoClick=false,
Minimum=0,
Maximum=100,
ColorTag="Frame",
Disabled=false,
},
Create=function(aa,u)

local w=u.Value or u.Minimum
local A=u.Format
local B=u.Label
local C=u.NoAnimation
local D=u.NoGrab
local E=u.NoClick
local F=u.Type
local G=u.Disabled


local H=b:InsertPrefab"Slider"
local I=H.Track
local J=I.Grab
local K=I.ValueText


I:FindFirstChildOfClass"UIPadding"

local L=b:MergeMetatables(u,H)
local M=J.AbsoluteSize


local N=b:SetAnimation(H,"Inputs")

local O=aa:Label{
Parent=H,
Text=B,
Position=UDim2.new(1,4),
Size=UDim2.fromScale(0,1)
}

Merge(u,{
Grab=J,
Name=B,
})


if F=="Slider"then
I.Position=UDim2.fromOffset(M.X/2,0)
I.Size=UDim2.new(1,-M.X,1,0)
end

local P={Slider=
function(P)
return{
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(P,0.5)
}
end,Progress=
function(P)
return{
Size=UDim2.fromScale(P,1)
}
end,Snap=
function(P,Q,R,S)
local T=(math.round(Q)-R)/S
return{
Size=UDim2.fromScale(1/S,1),
Position=UDim2.fromScale(T,0.5)
}
end,
}

local function Callback(...)
local Q=u.Callback
return Q(L,...)
end

function u.SetDisabled(Q,R:boolean)
Q.Disabled=R
H.Interactable=not R
aa:SetColorTags({
[O]=R and"LabelDisabled"or"Label"
},true)
return Q
end

function u.SetValueText(Q,R:string)
K.Text=tostring(R)
end

function u.SetValue(Q,R,S:boolean)
local T=aa:GetThemeKey"AnimationTweenInfo"

local U=u.Minimum
local V=u.Maximum

local W=R
local X=V-U


if not S then
W=(R-U)/X
else

R=U+(X*W)
end


W=math.clamp(W,0,1)


local Y=P[F](W,R,U,V)


o:Tween{
Object=J,
Tweeninfo=T,
NoAnimation=C,
EndProperties=Y
}


Q.Value=R
Q:SetValueText(A:format(R,V))


Callback(R)

return Q
end

local function SetFocused(Q:boolean)

aa:SetColorTags({
[H]=Q and"FrameActive"or"Frame"
},true)
aa:SetElementFocused(H,{
Focused=Q,
Animation=N
})
end


local function CanDrag()
if u.Disabled then return end
if u.ReadOnly then return end

return true
end
local function DragMovement(Q)
if not CanDrag()then return end


local R=I.AbsolutePosition.X
local S=I.AbsoluteSize.X


local T=Q.X
local U=T-R


local V=math.clamp(U/S,0,1)

u:SetValue(V,true)
end
local function DragBegan(...)
if not CanDrag()then return end

SetFocused(true)

if not E then
DragMovement(...)
end
end
local function DragEnded()
SetFocused(false)
end


J.Visible=not D
u:SetValue(w)
u:SetDisabled(G)

aa:TagElements{
[K]="Label",
[J]="SliderGrab"
}


b:ConnectDrag(I,{
DragStart=DragBegan,
DragMovement=DragMovement,
DragEnd=DragEnded,
})

return L,H
end,
})








b:DefineElement("SliderEnum",{
Base={
Items={},
Label="Slider Enum",
Type="Snap",
Minimum=1,
Maximum=10,
Value=1,
Callback=d,
ColorTag="Frame"
},
Create=function(aa,u:SliderEnumFlags__DARKLUA_TYPE_W)

local w=u.Callback
local A=u.Value

local function Calculate(B,C:number)
C=math.round(C)


local D=B.Items
B.Maximum=#D


return D[C]
end


u.Callback=function(B,C,D:boolean)
local E=Calculate(B,C)
B:SetValueText(E)

u.Value=E

return w(B,E)
end

Calculate(u,A)


return aa:SliderBase(u)
end,
})

b:DefineElement("SliderInt",{
Base={
Label="Slider Int",
ColorTag="Frame",
},
Create=r.SliderBase,
})

b:DefineElement("SliderFloat",{
Base={
Label="Slider Float",
Format="%.3f",
ColorTag="Frame",
},
Create=r.SliderBase,
})












b:DefineElement("DragInt",{
Base={
Format="%.f",
Label="Drag Int",
Callback=d,
Minimum=0,
Maximum=100,
ColorTag="Frame",
Disabled=false
},
Create=function(aa,u:DragIntFlags__DARKLUA_TYPE_X)

local w=u.Value or u.Minimum
local A=u.Format
local B=u.Label
local C=u.Disabled


local D=b:InsertPrefab"Slider"
local E=b:MergeMetatables(u,D)

local F=D.Track
local G=F.ValueText
local H=F.Grab
H.Visible=false

b:GetChildOfClass(F,"UIDragDetector")

local I=aa:Label{
Parent=D,
Text=B,
Position=UDim2.new(1,7),
Size=UDim2.fromScale(0,1)
}

local J
local K=0
local L=0


local M=b:SetAnimation(D,"Inputs")

local function Callback(...)
local N=u.Callback
return N(E,...)
end

function u.SetValue(N,O:number,P:boolean)
local Q=N.Minimum
local R=N.Maximum

local S=R-Q


if not P then
K=((O-Q)/S)*100
else

O=Q+(S*(K/100))
end

O=math.clamp(O,Q,R)


N.Value=O
G.Text=A:format(O,R)


Callback(O)

return N
end
function u.SetDisabled(N,O:boolean)
N.Disabled=O

aa:SetColorTags({
[I]=O and"LabelDisabled"or"Label"
},true)
end

local function SetFocused(N:boolean)

aa:SetColorTags({
[D]=N and"FrameActive"or"Frame"
},true)

aa:SetElementFocused(D,{
Focused=N,
Animation=M
})
end


local function CanDrag():boolean
if u.Disabled then return end
if u.ReadOnly then return end

return true
end
local function DragStart(N)
if not CanDrag()then return end
SetFocused(true)

J=N
L=K
end
local function DragMovement(N)
if not CanDrag()then return end

local O=N.X-J.X
local P=L+(O/2)

K=math.clamp(P,0,100)
u:SetValue(K,true)
end
local function DragEnded()
SetFocused(false)
end


u:SetValue(w)
u:SetDisabled(C)


b:ConnectDrag(F,{
DragStart=DragStart,
DragEnd=DragEnded,
DragMovement=DragMovement,
})

aa:TagElements{
[G]="Label"
}

return E,D
end,
})

b:DefineElement("DragFloat",{
Base={
Format="%.3f",
Label="Drag Float",
ColorTag="Frame"
},
Create=r.DragInt,
})

b:DefineElement("MultiElement",{
Base={
Callback=d,
Label="",
Disabled=false,
BaseInputConfig={},
InputConfigs={},
Value={},
Minimum={},
Maximum={},
MultiCallback=d,
},
Create=function(aa,u)

local w=u.Label
local A=u.BaseInputConfig
local B=u.InputConfigs
local C=u.InputType
local D=u.Disabled
local E=u.Value
local F=u.Minimum
local G=u.Maximum

assert(C,"No input type provided for MultiElement")




local H,I=aa:Row{
Spacing=4
}

local J=H:Row{
Size=UDim2.fromScale(0.65,0),
Expanded=true,
}

local K=H:Label{
Size=UDim2.fromScale(0.35,0),
LayoutOrder=2,
Text=w
}

local L=b:MergeMetatables(u,H)
local M={}
local N=false

local function GetValue()
local O={}
for P,Q in M do
O[P]=Q:GetValue()
end

u.Value=O
return O
end

local function Callback(...)
local O=u.MultiCallback
O(L,...)
end

local function InputChanged()

if#M~=#B then return end
if not N then return end

local O=GetValue()
Callback(O)
end

function u.SetDisabled(O,P:boolean)
O.Disabled=P


aa:SetColorTags({
[K]=P and"LabelDisabled"or"Label"
},true)


for Q,R in M do
R:SetDisabled(P)
end
end

function u.SetValue(O,P)
N=false


for Q,R in P do
local S=M[Q]
assert(S,`No input object for index: {Q}`)

S:SetValue(R)
end

N=true
Callback(P)
end


A=Copy(A,{
Size=UDim2.new(1,0,0,19),
Label="",
Callback=InputChanged,
})


for O,P in B do
local Q=Copy(A,P)
b:CheckConfig(Q,{
Minimum=F[O],
Maximum=G[O],
})


local R=J[C](J,Q)
table.insert(M,R)
end


Merge(u,{
Row=J,
Inputs=M
})

N=true


u:SetDisabled(D)
u:SetValue(E)

return L,I
end,
})

local function GenerateMultiInput(aa:string,u:string,w:number,A)
b:DefineElement(aa,{
Base={
Label=aa,
Callback=d,
InputType=u,
InputConfigs=table.create(w,{}),
BaseInputConfig={},
},
Create=function(B,C)
local D=C.BaseInputConfig


if A then
Merge(D,A)
end

b:CheckConfig(D,{
ReadOnly=C.ReadOnly,
Format=C.Format,
})

C.MultiCallback=function(...)
local E=C.Callback
E(...)
end

return B:MultiElement(C)
end,
})
end









local function GenerateColor3Input(aa:string,u:string,w:number,A)
A=A or{}
b:DefineElement(aa,{
Base={
Label=aa,
Callback=d,
Value=b.Accent.Light,
Disabled=false,
Minimum={0,0,0},
Maximum={255,255,255,100},
BaseInputConfig={},
InputConfigs={
[1]={Format="R: %.f"},
[2]={Format="G: %.f"},
[3]={Format="B: %.f"},
}
},
Create=function(B,C:InputColor3Flags__DARKLUA_TYPE_Y)local D=

C.BaseInputConfig
local E=C.InputConfigs
local F=C.Value local G=
C.Disabled


if A.Color4 then
E[4]={Format="A: %.f"}
end


local H=Copy(C,{
Value={1,1,1},
Callback=function(H,...)
if C.ValueChanged then
C:ValueChanged(...)
end
end,
})

local I,J=B[u](B,H)
local K=b:MergeMetatables(C,I)
local L=I.Row


local M=L:Button{
BackgroundTransparency=0,
Size=UDim2.fromOffset(19,19),
UiPadding=0,
Text="",
Ratio=1,
ColorTag="",
ElementStyle=""
}

local function Callback(...)
local N=C.Callback
return N(K,...)
end

local function SetPreview(N:Color3)
M.BackgroundColor3=N
Callback(N)
end

function C.ValueChanged(N,O)
local P,Q,R=O[1],O[2],O[3]
local S=Color3.fromRGB(P,Q,R)

N.Value=S
SetPreview(S)
end

function C.SetValue(N,O:Color3)
N.Value=O
SetPreview(O)


I:SetValue{
math.round(O.R*255),
math.round(O.G*255),
math.round(O.B*255)
}
end


C:SetValue(F)

return K,J
end,
})
end









local function GenerateCFrameInput(aa:string,u:string,w:number,A)
b:DefineElement(aa,{
Base={
Label=aa,
Callback=d,
Disabled=false,
Value=CFrame.new(10,10,10),
Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(100,100,100),
BaseInputConfig={},
InputConfigs={
[1]={Format="X: %.f"},
[2]={Format="Y: %.f"},
[3]={Format="Z: %.f"}
}
},
Create=function(B,C:InputCFrameFlags__DARKLUA_TYPE_Z)local E=

C.BaseInputConfig
local F=C.Value local G=
C.Disabled
local H=C.Maximum
local I=C.Minimum

local J=Copy(C,{
Maximum={H.X,H.Y,H.Z},
Minimum={I.X,I.Y,I.Z},
Value={F.X,F.Y,F.Z},
Callback=function(J,...)
if C.ValueChanged then
C:ValueChanged(...)
end
end,
})


local K,L=B[u](B,J)
local M=b:MergeMetatables(C,K)local N=
K.Row

local function Callback(...)
local O=C.Callback
return O(M,...)
end

function C.ValueChanged(O,P)
local Q,R,S=P[1],P[2],P[3]
local T=CFrame.new(Q,R,S)
O.Value=T
Callback(T)
end

function C.SetValue(O,P:CFrame)
O.Value=P


K:SetValue{
math.round(P.X),
math.round(P.Y),
math.round(P.Z)
}
end


C:SetValue(F)

return M,L
end,
})
end

GenerateMultiInput("InputInt2","InputInt",2,{NoButtons=true})
GenerateMultiInput("InputInt3","InputInt",3,{NoButtons=true})
GenerateMultiInput("InputInt4","InputInt",4,{NoButtons=true})
GenerateMultiInput("SliderInt2","SliderInt",2)
GenerateMultiInput("SliderInt3","SliderInt",3)
GenerateMultiInput("SliderInt4","SliderInt",4)
GenerateMultiInput("SliderFloat2","SliderFloat",2)
GenerateMultiInput("SliderFloat3","SliderFloat",3)
GenerateMultiInput("SliderFloat4","SliderFloat",4)
GenerateMultiInput("DragInt2","DragInt",2)
GenerateMultiInput("DragInt3","DragInt",3)
GenerateMultiInput("DragInt4","DragInt",4)
GenerateMultiInput("DragFloat2","DragFloat",2)
GenerateMultiInput("DragFloat3","DragFloat",3)
GenerateMultiInput("DragFloat4","DragFloat",4)

GenerateColor3Input("InputColor3","InputInt3")
GenerateColor3Input("SliderColor3","SliderInt3")
GenerateColor3Input("DragColor3","DragInt3")

GenerateCFrameInput("InputCFrame","InputInt3")
GenerateCFrameInput("SliderCFrame","SliderInt3")
GenerateCFrameInput("DragCFrame","DragInt3")

b:DefineElement("SliderProgress",{
Base={
Label="Slider Progress",
Type="Progress",
ColorTag="Frame",
},
Create=r.SliderBase,
})




b:DefineElement("ProgressBar",{
Base={
Label="Progress Bar",
Type="Progress",
ReadOnly=true,
MinValue=0,
MaxValue=100,
Format="% i%%",
Interactable=false,
ColorTag="Frame"
},
Create=function(aa,u)
function u.SetPercentage(w,A:number)
u:SetValue(A)
end

local w,A=aa:SliderBase(u)
local B=w.Grab

aa:TagElements{
[B]={
BackgroundColor3="ProgressBar"
}
}

return w,A
end,
})








b:DefineElement("Combo",{
Base={
Value="",
Placeholder="",
Callback=d,
Items={},
Disabled=false,
WidthFitPreview=false,
Label="Combo"
},
Create=function(aa,u:Combo__DARKLUA_TYPE_0)

local w=u.Placeholder
local A=u.NoAnimation
local B=u.Selected
local C=u.Label
local F=u.Disabled
local H=u.WidthFitPreview



local I=b:InsertPrefab("Combo",u)
local J=b:MergeMetatables(u,I)

local K=I.Combo
local L


local M=aa:Label{
Text=tostring(w),
Parent=K,

Name="ValueText"
}
local N=aa:ArrowButton{
Parent=K,
Interactable=false,
Size=UDim2.fromOffset(19,19),
LayoutOrder=2,
}
local O=aa:Label{
Text=C,
Parent=I,
LayoutOrder=2,
}


if H then
b:SetProperties(I,{
AutomaticSize=Enum.AutomaticSize.XY,
Size=UDim2.new(0,0,0,0)
})
b:SetProperties(K,{
AutomaticSize=Enum.AutomaticSize.XY,
Size=UDim2.fromScale(0,1)
})
end

local function Callback(P,...)
u:SetOpen(false)
return u.Callback(J,P,...)
end

local function SetAnimationState(P:boolean,Q:boolean?)
local R=aa:GetThemeKey"AnimationTweenInfo"

I.Interactable=not P


o:HeaderCollapseToggle{
Tweeninfo=R,
NoAnimation=Q,
Collapsed=not P,
Toggle=N.Icon,
}
end

local function GetItems()
local P=u.GetItems
local Q=u.Items


if P then
return P()
end


return Q
end

function u.SetValueText(P,Q:string?)
M.Text=tostring(Q)
end

function u.ClosePopup(P)
if L then
L:ClosePopup(true)
end
end

function u.SetDisabled(P,Q:boolean)
P.Disabled=Q
I.Interactable=not Q
aa:SetColorTags({
[O]=Q and"LabelDisabled"or"Label"
},true)
end

function u.SetValue(P,Q)
local R=GetItems()
local S=R[Q]
local T=S or Q

P.Selected=Q
P.Value=T

P:ClosePopup()


if typeof(Q)=="number"then
P:SetValueText(T)
else
P:SetValueText(Q)
end

return Callback(Q,T)
end

function u.SetOpen(P,Q:boolean)
local R=P.Selected

P.Open=Q
SetAnimationState(Q,A)

if not Q then

P:ClosePopup()
return
end


L=aa:Dropdown{
RelativeTo=K,
Items=GetItems(),
Selected=R,
OnSelected=function(...)
u:SetValue(...)
end,
OnClosed=function()
P:SetOpen(false)
end,
}

return P
end

local function ToggleOpen()
local P=u.Open
u:SetOpen(not P)
end


K.Activated:Connect(ToggleOpen)


SetAnimationState(false,true)
u:SetDisabled(F)

if B then
u:SetValue(B)
end


b:SetAnimation(K,"Inputs")

aa:TagElements{
[K]="Frame",
}

return J,I
end,
})

















































































































local aa={

TileBarConfig={
Close={
Image=b.Icons.Close,
IconPadding=UDim.new(0,3)
},
Collapse={
Image=b.Icons.Arrow,
IconPadding=UDim.new(0,3)
},
},

CloseCallback=d,


Collapsible=true,
Open=true,
Focused=false
}

function aa.Tween(u,w)
b:CheckConfig(w,{
Tweeninfo=u:GetThemeKey"AnimationTweenInfo"
})
return o:Tween(w)
end

function aa.TagElements(u,w:ObjectTable__DARKLUA_TYPE_d)local A=
b.Debug


local B=u.TagsList
local C=u.Theme

b:MultiUpdateColors{
Theme=C,
TagsList=B,
Objects=w
}
end





function aa.MakeTitleBarCanvas(u):TitleBarCanvas__DARKLUA_TYPE_1
local w=u.TitleBar


local A=b:MakeCanvas{
WindowClass=u,
Element=w
}
u.TitleBarCanvas=A

return A
end

function aa.AddDefaultTitleButtons(u)
local w=u.TileBarConfig local A=
u.TitleBar

local B=w.Collapse
local C=w.Close


local F=u.TitleBarCanvas
if not F then
F=u:MakeTitleBarCanvas()
end

b:CheckConfig(u,{

Toggle=F:RadioButton{
Icon=B.Image,
IconPadding=B.IconPadding,
LayoutOrder=1,
Ratio=1,
Size=UDim2.new(0,0),
Callback=function()
u:ToggleCollapsed()
end,
},
CloseButton=F:RadioButton{
Icon=C.Image,
IconPadding=C.IconPadding,
LayoutOrder=3,
Ratio=1,
Size=UDim2.new(0,0),
Callback=function()
u:SetVisible(false)
end,
},
TitleLabel=F:Label{
ColorTag="Title",
LayoutOrder=2,
Size=UDim2.new(1,0),
Active=false,
Fill=true,
ClipsDescendants=true,
AutomaticSize=Enum.AutomaticSize.XY
}
})


u:TagElements{
[u.TitleLabel]="WindowTitle"
}
end

function aa.Close(u)
local w=u.CloseCallback


if w then
local A=w(u)
if A==false then return end
end

u:Remove()
end

function aa.SetVisible(u,w:boolean):WindowClass
local A=u.WindowFrame
local B=u.NoFocusOnAppearing

u.Visible=w
A.Visible=w


if w and not B then
b:SetFocusedWindow(u)
end

return u
end

function aa.ToggleVisibility(u,w:boolean):WindowClass
local A=u.Visible
u:SetVisible(not A)
end

function aa.GetWindowSize(u):Vector2
return u.WindowFrame.AbsoluteSize
end

function aa.GetTitleBarSizeY(u):number
local w=u.TitleBar
return w.Visible and w.AbsoluteSize.Y or 0
end

function aa.SetTitle(u,w:string?):WindowClass
u.TitleLabel.Text=tostring(w)
return u
end

function aa.SetPosition(u,w):WindowClass
u.WindowFrame.Position=w
return u
end

function aa.SetSize(u,w:(Vector2|UDim2),A:boolean):WindowClass
local B=u.WindowFrame


if typeof(w)=="Vector2"then
w=UDim2.fromOffset(w.X,w.Y)
end

B.Size=w
u.Size=w

return u
end

function aa.SetCanvasInteractable(u,w:boolean)
local A=u.Body
A.Interactable=w
end

function aa.Center(u):WindowClass
local w=u:GetWindowSize()/2
local A=UDim2.new(0.5,-w.X,0.5,-w.Y)

u:SetPosition(A)
return u
end

function aa.LoadStylesIntoElement(u,w)
local A=w.Flags
local B=w.Object
local C=w.Canvas

local F={FrameRounding=
function()
if A.CornerRadius then return end
if not C then return end

local F=B:FindFirstChild("FrameRounding",true)
if not F then return end

C:TagElements{
[F]="FrameRounding"
}
end,
}

for H,I in F do
local J=u:GetThemeKey(H)
if J==nil then continue end

task.spawn(I,J)
end
end

function aa.SetTheme(u,w:string):WindowClass
local A=b.ThemeConfigs

local B=u.TagsList local C=
u.Focused
local F=u.WindowState


if not w then
w=u.Theme
end


assert(A[w],`{w} is not a valid theme!`)

u.Theme=w


b:MultiUpdateColors{
Animate=false,
Theme=w,
Objects=B
}


u:SetFocusedColors(F)

return u
end

function aa.SetFocusedColors(u,w:string)

local A=u.WindowFrame
local B=u.TitleBar
local C=u.Theme
local F=u.TitleLabel
local H=u:GetThemeKey"AnimationTweenInfo"

local I=A:FindFirstChildOfClass"UIStroke"


local J={
Focused={
[I]="BorderActive",
[B]="TitleBarBgActive",
[F]={
TextColor3="TitleActive"
}
},
UnFocused={
[I]="Border",
[B]="TitleBarBg",
[F]={
TextColor3="Title"
}
},
Collapsed={
[I]="Border",
[B]="TitleBarBgCollapsed",
[F]={
TextColor3="Title"
}
}
}


b:MultiUpdateColors{
Tweeninfo=H,
Animate=true,
Objects=J[w],
Theme=C,
}
end

function aa.SetFocused(u,w:true)
w=w==nil and true or w


local A=u.Collapsed
local B=u.WindowState


if w then
b:SetFocusedWindow(u)
end


local C=A and"Collapsed"or w and"Focused"or"UnFocused"


if C==B then return end
u.Focused=w
u.WindowState=C


u:SetFocusedColors(C)
end

function aa.GetThemeKey(u,w:string)
return b:GetThemeKey(u.Theme,w)
end

function aa.ResetColors(u):WindowClass
local w=b.Theme
local A=u.Theme
local B=u.TagsList


table.clear(A)

b:MultiUpdateColors{
Animate=false,
Theme=w,
Objects=B
}

return aa
end

function aa.SetCollapsible(u,w:boolean):WindowClass
u.Collapsible=w
return u
end

function aa.ToggleCollapsed(u,w:boolean?):WindowClass
local A=u.Collapsed
local B=u.Collapsible


if not w and not B then return u end

u:SetCollapsed(not A)
return u
end

function aa.SetCollapsed(u,w:boolean,A:false):WindowClass
local B=u.WindowFrame
local C=u.Body
local F=u.Toggle
local H=u.ResizeGrab
local I=u.Size
local J=u.AutoSize
local K=u:GetThemeKey"AnimationTweenInfo"

local L=u:GetWindowSize()
local M=u:GetTitleBarSizeY()

local N=F.Icon
local O=UDim2.fromOffset(L.X,M)

u.Collapsed=w
u:SetCollapsible(false)


u:SetFocused(not w)


o:HeaderCollapse{
Tweeninfo=K,
NoAnimation=A,
Collapsed=w,
Toggle=N,
Resize=B,
NoAutomaticSize=not J,
Hide=C,

ClosedSize=O,
OpenSize=I,
Completed=function()
u:SetCollapsible(true)
end
}


u:Tween{
Object=H,
NoAnimation=A,
EndProperties={
TextTransparency=w and 1 or 0.6,
Interactable=not w
}
}

return u
end

function aa.UpdateConfig(u,w)
local A={
NoTitleBar=function(A)
local B=u.TitleBar
B.Visible=not A
end,
NoClose=function(A)
local B=u.CloseButton
B.Visible=not A
end,
NoCollapse=function(A)
local B=u.Toggle
B.Visible=not A
end,
NoTabsBar=function(A)
local B=u.WindowTabSelector
if not B then return end

local C=B.TabsBar
C.Visible=not A
end,
NoScrollBar=function(A)
local B=A and 0 or 9
local C=u.NoScroll
local F=u.WindowTabSelector
local H=u.ContentCanvas


if F then
F.Body.ScrollBarThickness=B
end

if not C then
H.ScrollBarThickness=B
end
end,
NoScrolling=function(A)
local B=u.NoScroll
local C=u.WindowTabSelector
local F=u.ContentCanvas

if C then
C.Body.ScrollingEnabled=not A
end
if not B then
F.ScrollingEnabled=not A
end
end,
NoMove=function(A)
local B=u.DragConnection
B:SetEnabled(not A)
end,
NoResize=function(A)
local B=u.ResizeConnection
B:SetEnabled(not A)
end,
NoBackground=function(A)
local B=u:GetThemeKey"WindowBgTransparency"
local C=u.CanvasFrame
C.BackgroundTransparency=A and 1 or B
end,
}


Merge(u,w)


for B,C in w do
local F=A[B]
if F then
F(C)
end
end

return u
end


function aa.Remove(u)
local w=u.WindowFrame
local A=u.WindowClass
local B=b.Windows


local C=table.find(B,A)
if C then
table.remove(B,C)
end


w:Destroy()
end

function aa.MenuBar(u,w,...)
local A=u.ContentCanvas
local B=u.ContentFrame

w=w or{}

Merge(w,{
Parent=B,
Layout=-1
})

return A:MenuBar(w,...)
end


































b:DefineElement("Window",{
Export=true,
Base={
Theme="DarkTheme",
NoSelect=false,
NoTabs=true,
NoScroll=false,
Collapsed=false,
Visible=true,
AutoSize=false,
MinimumSize=Vector2.new(160,90),
OpenOnDoubleClick=true,
NoAutoTheme=true,
NoWindowRegistor=false,
NoBringToFrontOnFocus=false,
IsDragging=false,
},
Create=function(u,w:WindowFlags__DARKLUA_TYPE_2)

local A=b.Windows
local B=b.Container.Windows

b:CheckConfig(w,{
Parent=B,
Title=b.DefaultTitle
})


local C=w.NoDefaultTitleBarButtons
local F=w.Collapsed
local H=w.MinimumSize
local I=w.Title
local J=w.NoTabs
local K=w.NoScroll
local L=w.Theme
local M=w.AutomaticSize
local N=w.NoWindowRegistor
local O=w.AutoSelectNewTabs local P=
w.OpenOnDoubleClick local Q=
w.NoCollapse
local R=w.Parent~=B

local S={
Scroll=not K,
Fill=not M and true or nil,
UiPadding=UDim.new(0,J and 8 or 0),
AutoSelectNewTabs=O
}


if M then
Merge(S,{
AutomaticSize=M,
Size=UDim2.new(1,0)
})
end


local T:CanvasGroup=b:InsertPrefab("Window",w)
local U:Frame=T.Content
local V:Frame=U.TitleBar


local W=NewClass(aa)


local X=b:MakeCanvas{
Element=U,
WindowClass=W,
Class=W
}


local Y,Z,_
local ab,ac=X:Canvas(Copy(S,{
Parent=U,
CornerRadius=UDim.new(0,0),

}))


local ad=b:MakeResizable{
MinimumSize=H,
Resize=T,
OnUpdate=function(ad)
W:SetSize(ad,true)
end,
}


Merge(W,w)
Merge(W,{
WindowFrame=T,
ContentFrame=U,
CanvasFrame=ac,
ResizeGrab=ad.Grab,
TitleBar=V,
Elements=r,
TagsList={},
_SelectDisabled=R,


ResizeConnection=ad,
HoverConnection=b:DetectHover(U),
DragConnection=b:MakeDraggable{
Grab=U,
Move=T,
SetPosition=function(ae,af:UDim2)
local ag=Y:GetThemeKey"AnimationTweenInfo"

o:Tween{
Tweeninfo=ag,
Object=ae.Move,
EndProperties={
Position=af
}
}
end,
OnDragStateChange=function(ae:boolean)
W.IsDragging=ae
ac.Interactable=not ae


if ae then
b:SetFocusedWindow(_)
end


b:SetWindowFocusesEnabled(not ae)
end,
},
})


if J then

Y,Z=ab,ac
else

Y,Z=ab:TabSelector(S)
W.WindowTabSelector=Y
end


_=b:MergeMetatables(W,Y)


Merge(W,{
ContentCanvas=Y,
WindowClass=_,
Body=Z
})


b:ConnectMouseEvent(U,{
DoubleClick=true,
OnlyMouseHovering=V,
Callback=function(...)
if not W.OpenOnDoubleClick then return end
if W.NoCollapse then return end

W:ToggleCollapsed()
end,
})


if not C then
W:AddDefaultTitleButtons()
end


W:SetTitle(I)
W:SetCollapsed(F,true)


W:SetTheme(L)
W:UpdateConfig(w)


W:SetFocused()


local ae=ad.Grab
b:SetAnimation(ae,"TextButtons")

_:TagElements{
[ae]="ResizeGrab",
[V]="TitleBar",
[ac]="Window"
}


if not N then
table.insert(A,_)
end

return _,T
end,
})




b:DefineElement("TabsWindow",{
Export=true,
Base={
NoTabs=false,
AutoSelectNewTabs=true
},
Create=function(ab,ac:TabsWindowFlags__DARKLUA_TYPE_3)
return ab:Window(ac)
end,
})














b:DefineElement("PopupCanvas",{
Base={
AutoClose=false,
Scroll=false,
Visible=true,
Spacing=UDim.new(0,1),
AutomaticSize=Enum.AutomaticSize.XY,
MaxSizeY=150,
MinSizeX=100,
MaxSizeX=math.huge,
OnClosed=d
},
Create=function(ab,ac:PopupCanvas__DARKLUA_TYPE_4)
ac.Parent=b.Container.Overlays

local ad=ac.RelativeTo
local ae=ac.MaxSizeY
local af=ac.MinSizeX
local ag=ac.MaxSizeX
local u=ac.Visible
local w=ac.AutoClose
local A=ac.NoAnimation


local B,C=ab:OverlayScroll(ac)
local F=C.UIStroke

local H=F.Thickness
local I=C.Parent.AbsolutePosition

local J,K,L,M


local N=b:DetectHover(C,{
MouseOnly=true,
OnInput=function(N,O)
if N then return end
if not C.Visible then return end
ac:OnFocusLost()
end,
})

function ac.FetchScales(O)

local Q=B:GetCanvasSize()

J=ad.AbsolutePosition
K=ad.AbsoluteSize

L=math.clamp(Q.Y,K.Y,ae)
M=math.clamp(K.X,af,ag)
end

function ac.UpdatePosition(O)
C.Position=UDim2.fromOffset(
J.X-I.X+H,
J.Y-I.Y+K.Y
)
end

function ac.GetScale(O,Q:boolean):UDim2
local R=UDim2.fromOffset(M,L)
local S=UDim2.fromOffset(M,0)

return Q and R or S
end

function ac.IsMouseHovering(O):boolean
return N.Hovering
end

function ac.OnFocusLost(O)
local Q=O.OnClosed

O:SetPopupVisible(false)
Q(O)


if w then
O:ClosePopup()
end
end

function ac.ClosePopup(O,Q:boolean?)
O:SetPopupVisible(false,A,Q)
N:Disconnect()
C:Remove()
end

function ac.SetPopupVisible(O,Q:boolean,R:boolean?)

if C.Visible==Q then return end

ad.Interactable=not Q
O:UpdateScales(Q,A,R)
O.Visible=Q
end

function ac.UpdateScales(O,Q:boolean,R:boolean,S:boolean?)
local T=B:GetThemeKey"AnimationTweenInfo"

if Q==nil then
Q=C.Visible
end

ac:FetchScales()
ac:UpdatePosition()

local U=o:Tween{
Tweeninfo=T,
Object=C,
NoAnimation=R,
EndProperties={
Size=ac:GetScale(Q),
Visible=Q,
}
}


if U and S then
U.Completed:Wait()
end
end


ac:UpdateScales(false,true)
ac:SetPopupVisible(u)

B.OnChildChange:Connect(ac.UpdateScales)

return B,C
end,
})

b:DefineElement("PopupModal",{
Export=true,
Base={
NoAnimation=false,
NoCollapse=true,
NoClose=true,
NoResize=true,
NoSelect=true,
NoAutoFlags=true,
NoWindowRegistor=true,
NoScroll=true,
},
Create=function(ab,ac:WindowFlags__DARKLUA_TYPE_2)
ac.Parent=b.Container.Overlays

local ad=ab.WindowClass


local ae=ac.NoAnimation
local af


if ad then
af=ad:GetThemeKey"ModalWindowDimTweenInfo"
ac.Theme=ad.Theme
end


local ag=b:InsertPrefab("ModalEffect",ac)


local u=ab:Window(Copy(ac,{
NoAutoFlags=false,
Parent=ag,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(372,38),
AutomaticSize=Enum.AutomaticSize.Y
}))

function ac.ClosePopup(w)
o:Tween{
Object=ag,
Tweeninfo=af,
NoAnimation=ae,
EndProperties={
BackgroundTransparency=1
},
Completed=function()
ag:Destroy()
end
}

u:Close()
end


o:Tween{
Object=ag,
Tweeninfo=af,
NoAnimation=ae,
StartProperties={
BackgroundTransparency=1
},
EndProperties={
BackgroundTransparency=0.8
}
}


ab:TagElements{
[ag]="ModalWindowDim"
}


local w=b:MergeMetatables(ac,u)
return w,ag
end,
})

local ab=`rbxassetid://`..b.PrefabsId
b:Init{
Prefabs=game:GetService"InsertService":LoadLocalAsset(ab),
}

return b end function a.b()



return function(aa)
for ab,ac in ipairs(aa)do
local ad=getfenv(0)

for ae in string.gmatch(ac,"[^%.]+")do
ad=ad and ad[ae]
if ad==nil then break end
end

if not ad then
return false,ac
end
end

return true
end end function a.c()



return function()
if not cache or not cache.invalidate then
return{
status=400,
message="Global not found",
}
end


local aa=game:GetService"BadgeService"

if aa~=game:GetService"BadgeService"then
return{
status=500,
message="Did a cosmic ray just hit your computer? This should never evaluate"
}
end

cache.invalidate(aa)

if aa==game:GetService"BadgeService"then
return{
status=500,
message="Reference to service object retained"
}
elseif typeof(aa)~="Instance"then
return{
status=500,
message="Reference type wasn't retained"
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.d()




return function()
if not cache or not cache.iscached then
return{
status=400,
message="Global not found",
}
elseif not cache.invalidate then
return{
status=401,
message="Dependency 'cache.invalidate' missing",
}
end


local aa=Instance.new"Part"

if not cache.iscached(aa)then
return{
status=500,
message="Cached part assumed uncached"
}
end

cache.invalidate(aa)

if cache.iscached(aa)then
return{
status=500,
message="Uncached part assumed cached"
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.e()




return function()
if not cache or not cache.replace then
return{
status=400,
message="Global not found",
}
end


local aa=game:GetService"BadgeService"
local ab=game:GetService"Stats"

if aa==ab then
return{
status=500,
message="Did a cosmic ray just hit your computer? This should never evaluate"
}
end

cache.replace(aa,ab)

if aa==ab then
return{
status=500,
message="Reference is old reference"
}
elseif aa==game:GetService"Stats"then
return{
status=500,
message="Reference is old references object"
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.f()




return function()
if not islclosure then
return{
status=400,
message="Global not found",
}
end

local function luaClosure()
return 1
end
local aa=print

if not islclosure(luaClosure)then
return{
status=500,
message="Failed to identify lua closure",
}
elseif islclosure(aa)then
return{
status=500,
message="Identified C closure as lua closure",
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.g()




return function()
if not iscclosure then
return{
status=400,
message="Global not found",
}
end

local function luaClosure()
return 1
end
local aa=print
local ab=newcclosure(function()
return 1
end)

if iscclosure(luaClosure)then
return{
status=500,
message="Lua closure identified as C closure",
}
elseif not iscclosure(aa)then
return{
status=500,
message="C closure not identified as C closure",
}
elseif not iscclosure(ab)then
return{
status=500,
message="C closure not identified as C closure",
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.h()




return function()
if not isexecutorclosure then
return{
status=400,
message="Global not found",
}
end

local function luaClosure()
return 1
end

if not isexecutorclosure(isexecutorclosure)then
return{
status=500,
message="Failed to identify an executor closure",
}
elseif not isexecutorclosure(luaClosure)then
return{
status=500,
message="Did not identify an lua closure as an executor closure",
}
elseif isexecutorclosure(print)then
return{
status=500,
message="Identified a lua standard closure as an executor closure",
}
end


local aa,ab=a.load'b'{
"checkclosure",
"isourclosure"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.i()




return function()
if not newcclosure then
return{
status=400,
message="Global not found",
}
elseif not iscclosure then
return{
status=500,
message="iscclosure required to test newcclosure",
}
end

local aa=function(...)
return...
end
local ab=newcclosure(aa)

if iscclosure(aa)then
return{
status=500,
message="iscclosure returned true a lua closure",
}
elseif not iscclosure(ab)then
return{
status=500,
message="Returned false for a C closure",
}
elseif ab(1)~=1 then
return{
status=500,
message="C closure did not return the expected value",
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.j()



return function()
if not clonefunction then
return{
status=400,
message="Global not found",
}
end


local function originalFunction()
return 1
end
local aa=clonefunction(originalFunction)

if aa==originalFunction then
return{
status=500,
message="Cloned function is the same as the original",
}
elseif aa()~=1 then
return{
status=500,
message="Cloned function behavior mismatch",
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.k()




return function()
if not hookfunction then
return{
status=400,
message="Global not found",
}
end

local function originalFunc1()
return 1
end

local aa=originalFunc1

local function function2()
return 2
end

if aa()~=1 then
return{
status=500,
message="This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
}
end

local ab=hookfunction(aa,function2)

if aa()~=2 then
return{
status=500,
message="Hooked function did not return the expected value",
}
elseif ab()~=1 then
return{
status=500,
message="Old function did not return the expected value",
}
end

hookfunction(aa,ab)

if aa()~=1 then
return{
status=500,
message="Restored function did not return the expected value",
}
end


local ac,ad=a.load'b'{
"hookfunc",
"replaceclosure",
}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.l()




return function()
if not restorefunction then
return{
status=400,
message="Global not found",
}
elseif not hookfunction then
return{
status=401,
message="'hookfunction' needed to test this",
}
end

local function originalFunc1()
return 1
end

local aa=originalFunc1

local function function2()
return 2
end

if aa()~=1 then
return{
status=500,
message="This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
}
end

local ab=hookfunction(aa,function2)

if aa()~=2 then
return{
status=500,
message="Hooked function did not return the expected value",
}
elseif ab()~=1 then
return{
status=500,
message="Old function did not return the expected value",
}
end

restorefunction(aa)

if aa()~=1 then
hookfunction(aa,ab)
return{
status=500,
message="Restored function did not return the expected value",
}
end


local ac,ad=a.load'b'{
"restorefunc",
}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.m()




return function()
if not getfunctionhash then
return{
status=400,
message="Global not found",
}
end

local function hexEncoded(aa)
return#aa==96 and aa:match"^[0-9a-fA-F]+$"~=nil
end

local aa=function()end
local ab=function(...)end
local ac=function()end
local ad=function()return 1 end
local ae=function()return 2 end
local af=pcall(function()
getfunctionhash(print)
end)

if not hexEncoded(getfunctionhash(aa))then
return{
status=500,
message="Hash is not hex encoded",
}
elseif getfunctionhash(aa)==getfunctionhash(ab)then
return{
status=500,
message="Unequal functions returned equal hashes",
}
elseif getfunctionhash(aa)~=getfunctionhash(ac)then
return{
status=500,
message="Equal functions returned unequal hashes",
}
elseif getfunctionhash(ad)==getfunctionhash(ae)then
return{
status=500,
message="Unequal returns gave equal returns",
}
elseif af then
return{
status=500,
message="Passed when given a lua standard C closure",
}
end


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.n()




return function()
if not checkcaller then
return{
status=400,
message="Global not found",
}
elseif not hookmetamethod then
return{
status=401,
message="Dependency 'hookmetamethod' missing",
}
end

local aa=checkcaller()

local ab
local ac
ac=hookmetamethod(game,"__namecall",function(...)
if ab==nil then
ab=checkcaller()
end
return ac(...)
end)

tostring(game)

task.wait(0.1)

hookmetamethod(game,"__namecall",ac)

if aa~=true then
return{
status=500,
message="Returned false in executor thread",
}
elseif ab~=false then
return{
status=500,
message="Did not return false in a hook",
}
end


local ad,ae=a.load'b'{}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.o()

local aa={}
local ab={}

for ac=65,90 do
table.insert(aa,ac)
end

for ac=97,122 do
table.insert(aa,ac)
end

for ac=48,57 do
table.insert(aa,ac)
end
table.insert(aa,43)
table.insert(aa,47)
for ac,ad in ipairs(aa)do
ab[ad]=ac
end
local ac={}
local ad=bit32.rshift
local ae=bit32.lshift
local af=bit32.band





function ac.Encode(ag)
local b={}
local c=0
for d=1,#ag,3 do
local e,f,g=string.byte(ag,d,d+2)
local h=ad(e,2)
local i=ae(af(e,3),4)+ad(f or 0,4)
local j=ae(af(f or 0,15),2)+ad(g or 0,6)
local k=af(g or 0,63)
c=c+1
b[c]=aa[h+1]
c=c+1
b[c]=aa[i+1]
c=c+1
b[c]=f and aa[j+1]or 61
c=c+1
b[c]=g and aa[k+1]or 61
end
local d={}
local e=0
local f
for g=1,c,4096 do
e=e+1
f=g+4096-1
d[e]=string.char(table.unpack(
b,
g,
f>c and c or f
))
end
return table.concat(d)
end





function ac.Decode(ag)
local b={}
local c=0
for d=1,#ag,4 do
local e,f,g,h=string.byte(ag,d,d+3)
local i=ab[e]-1
local j=ab[f]-1
local k=(ab[g]or 1)-1
local l=(ab[h]or 1)-1
local m=ae(i,2)+ad(j,4)
local n=ae(af(j,15),4)+ad(k,2)
local o=ae(af(k,3),6)+l
c=c+1
b[c]=m
if g~=61 then
c=c+1
b[c]=n
end
if h~=61 then
c=c+1
b[c]=o
end
end
local d={}
local e=0
local f
for g=1,c,4096 do
e=e+1
f=g+4096-1
d[e]=string.char(table.unpack(
b,
g,
f>c and c or f
))
end
return table.concat(d)
end
return ac end function a.p()




local aa={}























local function plainFind(ab,ac)
return string.find(ab,ac,0,true)
end

local function streamer(ab):Streamer__DARKLUA_TYPE_5
local ac={}
ac.Offset=0
ac.Source=ab
ac.Length=string.len(ab)
ac.IsFinished=false
ac.LastUnreadBytes=0

function ac.read(ad:Streamer__DARKLUA_TYPE_5,ae:number?,af:boolean?):string
local ag=ae or 1
local b=if af~=nil then af else true
local c=string.sub(ad.Source,ad.Offset+1,ad.Offset+ag)

local d=string.len(c)
local e=ag-d

if b then
ad:seek(ag)
end

ad.LastUnreadBytes=e
return c
end

function ac.seek(ad:Streamer__DARKLUA_TYPE_5,ae:number)
local af=ae or 1

ad.Offset=math.clamp(ad.Offset+af,0,ad.Length)
ad.IsFinished=ad.Offset>=ad.Length
end

function ac.append(ad:Streamer__DARKLUA_TYPE_5,ae:string)

ad.Source..=ae
ad.Length=string.len(ad.Source)
ad:seek(0)
end

function ac.toEnd(ad:Streamer__DARKLUA_TYPE_5)
ad:seek(ad.Length)
end

return ac
end

function aa.compress(ab:string):string
local ac:BlockData__DARKLUA_TYPE_6={}
local ad=streamer(ab)

if ad.Length>12 then
local ae=ad:read(4)

local af=ae
local ag=ae
local b=""
local c=""
local d=true

repeat
d=true
local e=ad:read()

if plainFind(af,e)then
local f=ad:read(3,false)

if string.len(f)<3 then

c=e..f
ad:seek(3)
else
b=e..f

local g=plainFind(af,b)
if g then
ad:seek(3)
repeat
local h=ad:read(1,false)
local i=b..h

local j=plainFind(af,i)
if j then
b=i
g=j
ad:seek(1)
end
until not plainFind(af,i)or ad.IsFinished

local h=string.len(b)
local i=true

if ad.Length-ad.Offset<=5 then
c=b
i=false

end

if i then
d=false


local j=string.len(af)-g
af=af..b

table.insert(ac,{
Literal=ag,
LiteralLength=string.len(ag),
MatchOffset=j+1,
MatchLength=h,
})
ag=""
end
else
c=e
end
end
else
c=e
end

if d then
ag=ag..c
af=af..e
end
until ad.IsFinished
table.insert(ac,{
Literal=ag,
LiteralLength=string.len(ag)
})
else
local ae=ad.Source
ac[1]={
Literal=ae,
LiteralLength=string.len(ae)
}
end



local ae=string.rep("\x00",4)
local function write(af)
ae=ae..af
end

for af,ag in ac do
local b=ag.LiteralLength
local c=(ag.MatchLength or 4)-4


local d=math.clamp(b,0,15)
local e=math.clamp(c,0,15)

local f=bit32.lshift(d,4)+e
write(string.pack("<I1",f))

if b>=15 then
b=b-15

repeat
local g=math.clamp(b,0,0xFF)
write(string.pack("<I1",g))
if g==0xFF then
b=b-255
end
until g<0xFF
end


write(ag.Literal)

if af~=#ac then

write(string.pack("<I2",ag.MatchOffset))


if c>=15 then
c=c-15

repeat
local g=math.clamp(c,0,0xFF)
write(string.pack("<I1",g))
if g==0xFF then
c=c-255
end
until g<0xFF
end
end
end

local af=string.len(ae)-4
local ag=ad.Length

return string.pack("<I4",af)..string.pack("<I4",ag)..ae
end

function aa.decompress(ab:string):string
local ac=streamer(ab)

local ad=string.unpack("<I4",ac:read(4))
local ae=string.unpack("<I4",ac:read(4))

if ad==0 then
return ac:read(ae)
end

local af=streamer""

repeat
local ag=string.byte(ac:read())
local b=bit32.rshift(ag,4)
local c=bit32.band(ag,15)+4

if b>=15 then
repeat
local d=string.byte(ac:read())
b+=d
until d~=0xFF
end

local d=ac:read(b)
af:append(d)
af:toEnd()
if af.Length<ae then

local e=string.unpack("<I2",ac:read(2))
if c>=19 then
repeat
local f=string.byte(ac:read())
c+=f
until f~=0xFF
end

af:seek(-e)
local f=af.Offset
local g=af:read(c)
local h=af.LastUnreadBytes
local i
if h then
repeat
af.Offset=f
i=af:read(h)
h=af.LastUnreadBytes
g..=i
until h<=0
end

af:append(g)
af:toEnd()
end

until af.Length>=ae

return af.Source
end

return aa end function a.q()














local aa={99,124,119,123,242,107,111,197,48,1,103,43,254,215,171,118,202,
130,201,125,250,89,71,240,173,212,162,175,156,164,114,192,183,253,147,38,54,
63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,24,150,5,154,7,
18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179,41,
227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,
239,170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,
157,56,245,188,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,
167,126,61,100,93,25,115,96,129,79,220,34,42,144,136,70,238,184,20,222,
94,11,219,224,50,58,10,73,6,36,92,194,211,172,98,145,149,228,121,231,
200,55,109,141,213,78,169,108,86,244,234,101,122,174,8,186,120,37,46,28,
166,180,198,232,221,116,31,75,189,139,138,112,62,181,102,72,3,246,14,97,
53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,155,30,135,233,206,
85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,187,22}
local ab={82,9,106,213,48,54,165,56,191,64,163,158,129,243,215,251,124,
227,57,130,155,47,255,135,52,142,67,68,196,222,233,203,84,123,148,50,166,
194,35,61,238,76,149,11,66,250,195,78,8,46,161,102,40,217,36,178,118,
91,162,73,109,139,209,37,114,248,246,100,134,104,152,22,212,164,92,204,93,
101,182,146,108,112,72,80,253,237,185,218,94,21,70,87,167,141,157,132,144,
216,171,0,140,188,211,10,247,228,88,5,184,179,69,6,208,44,30,143,202,
63,15,2,193,175,189,3,1,19,138,107,58,145,17,65,79,103,220,234,151,
242,207,206,240,180,230,115,150,172,116,34,231,173,53,133,226,249,55,232,28,
117,223,110,71,241,26,113,29,41,197,137,111,183,98,14,170,24,190,27,252,
86,62,75,198,210,121,32,154,219,192,254,120,205,90,244,31,221,168,51,136,
7,199,49,177,18,16,89,39,128,236,95,96,81,127,169,25,181,74,13,45,
229,122,159,147,201,156,239,160,224,59,77,174,42,245,176,200,235,187,60,131,
83,153,97,23,43,4,126,186,119,214,38,225,105,20,99,85,33,12,125}


local ac={0,1,2,4,8,16,32,64,128,27,54,108,216,171,77,154,47,94,
188,99,198,151,53,106,212,179,125,250,239,197,145,57}

local function xtime(ad)
local ae=bit32.lshift(ad,1)
return if bit32.band(ad,128)==0 then ae else bit32.bxor(ae,27)%256
end


local function subBytes(ad,ae)
ae=if ae then ab else aa
for af=1,4 do
for ag=1,4 do
ad[af][ag]=ae[ad[af][ag]+1]
end
end
end
local function shiftRows(ad,ae)
ad[1][3],ad[2][3],ad[3][3],ad[4][3]=ad[3][3],ad[4][3],ad[1][3],ad[2][3]
if ae then
ad[1][2],ad[2][2],ad[3][2],ad[4][2]=ad[4][2],ad[1][2],ad[2][2],ad[3][2]
ad[1][4],ad[2][4],ad[3][4],ad[4][4]=ad[2][4],ad[3][4],ad[4][4],ad[1][4]
else
ad[1][2],ad[2][2],ad[3][2],ad[4][2]=ad[2][2],ad[3][2],ad[4][2],ad[1][2]
ad[1][4],ad[2][4],ad[3][4],ad[4][4]=ad[4][4],ad[1][4],ad[2][4],ad[3][4]
end
end
local function addRoundKey(ad,ae)
for af=1,4 do
for ag=1,4 do
ad[af][ag]=bit32.bxor(ad[af][ag],ae[af][ag])
end
end
end
local function mixColumns(ad,ae)
local af,ag
if ae then
for b=1,4 do
af=xtime(xtime(bit32.bxor(ad[b][1],ad[b][3])))
ag=xtime(xtime(bit32.bxor(ad[b][2],ad[b][4])))
ad[b][1],ad[b][2]=bit32.bxor(ad[b][1],af),bit32.bxor(ad[b][2],ag)
ad[b][3],ad[b][4]=bit32.bxor(ad[b][3],af),bit32.bxor(ad[b][4],ag)
end
end

local b
for c=1,4 do
b=ad[c]
af,ag=bit32.bxor(b[1],b[2],b[3],b[4]),b[1]
for d=1,4 do
b[d]=bit32.bxor(b[d],af,xtime(bit32.bxor(b[d],b[d+1]or ag)))
end
end
end


local function bytesToMatrix(ad,ae,af)
if af then
table.move(ae[1],1,4,1,ad)
table.move(ae[2],1,4,5,ad)
table.move(ae[3],1,4,9,ad)
table.move(ae[4],1,4,13,ad)
else
for ag=1,#ae/4 do
table.clear(ad[ag])
table.move(ae,ag*4-3,ag*4,1,ad[ag])
end
end

return ad
end
local function xorBytes(ad,ae,af)
table.clear(ad)

for ag=1,math.min(#ae,#af)do
table.insert(ad,bit32.bxor(ae[ag],af[ag]))
end
return ad
end
local function incBytes(ad,ae)
local af=true
for ag=if ae then 1 else#ad,if ae then#ad else 1,if ae then 1 else-1 do
if ad[ag]==255 then
ad[ag]=0
else
ad[ag]+=1
af=false
break
end
end

return af,ad
end


local function expandKey(ad)
local ae=bytesToMatrix(if#ad==16 then{{},{},{},{}}elseif#ad==24 then{{},{},{},{}
,{},{}}else{{},{},{},{},{},{},{},{}},ad)
local af=#ad/4
local ag,b,c=2,{}

while#ae<(#ad/4+7)*4 do
c=table.clone(ae[#ae])
if#ae%af==0 then
table.insert(c,table.remove(c,1))
for d=1,4 do
c[d]=aa[c[d]+1]
end
c[1]=bit32.bxor(c[1],ac[ag])
ag+=1
elseif#ad==32 and#ae%af==4 then
for d=1,4 do
c[d]=aa[c[d]+1]
end
end

table.clear(b)
xorBytes(c,table.move(c,1,4,1,b),ae[#ae-af+1])
table.insert(ae,c)
end

table.clear(b)
for d=1,#ae/4 do
table.insert(b,{})
table.move(ae,d*4-3,d*4,1,b[#b])
end
return b
end
local function encrypt(ad,ae,af,ag,b)
bytesToMatrix(ag,af)
addRoundKey(ag,ae[1])

for c=2,#ad/4+6 do
subBytes(ag)
shiftRows(ag)
mixColumns(ag)
addRoundKey(ag,ae[c])
end
subBytes(ag)
shiftRows(ag)
addRoundKey(ag,ae[#ae])

return bytesToMatrix(b,ag,true)
end
local function decrypt(ad,ae,af,ag,b)
bytesToMatrix(ag,af)

addRoundKey(ag,ae[#ae])
shiftRows(ag,true)
subBytes(ag,true)
for c=#ad/4+6,2,-1 do
addRoundKey(ag,ae[c])
mixColumns(ag,true)
shiftRows(ag,true)
subBytes(ag,true)
end

addRoundKey(ag,ae[1])
return bytesToMatrix(b,ag,true)
end


local function convertType(ad)
if type(ad)=="string"then
local ae={}

for af=1,string.len(ad),7997 do
table.move({string.byte(ad,af,af+7996)},1,7997,af,ae)
end
return ae
elseif type(ad)=="table"then
for ae,af in ipairs(ad)do
assert(type(af)=="number"and math.floor(af)==af and 0<=af and af<256,
"Unable to cast value to bytes")
end
return ad
else
error"Unable to cast value to bytes"
end
end
local function init(ad,ae,af,ag,b)
ad=convertType(ad)
assert(#ad==16 or#ad==24 or#ad==32,"Key must be either 16, 24 or 32 bytes long")
ae=convertType(ae)
assert(#ae%(b or 16)==0,"Input must be a multiple of "..(if b then"segment size "..b
else"16").." bytes in length")
if af then
if type(ag)=="table"then
ag=table.clone(ag)
local c,d=ag.Length,ag.LittleEndian
assert(type(c)=="number"and 0<c and c<=16,
"Counter value length must be between 1 and 16 bytes")
ag.Prefix=convertType(ag.Prefix or{})
ag.Suffix=convertType(ag.Suffix or{})
assert(#ag.Prefix+#ag.Suffix+c==16,"Counter must be 16 bytes long")
ag.InitValue=if ag.InitValue==nil then{1}else table.clone(convertType(ag.InitValue
))
assert(#ag.InitValue<=c,"Initial value length must be of the counter value")
ag.InitOverflow=if ag.InitOverflow==nil then table.create(c,0)else table.clone(
convertType(ag.InitOverflow))
assert(#ag.InitOverflow<=c,
"Initial overflow value length must be of the counter value")
for e=1,c-#ag.InitValue do
table.insert(ag.InitValue,1+if d then#ag.InitValue else 0,0)
end
for e=1,c-#ag.InitOverflow do
table.insert(ag.InitOverflow,1+if d then#ag.InitOverflow else 0,0)
end
elseif type(ag)~="function"then
local c,d=if ag then convertType(ag)else table.create(16,0),{}
assert(#c==16,"Counter must be 16 bytes long")
ag={Length=16,Prefix=d,Suffix=d,InitValue=c,
InitOverflow=table.create(16,0)}
end
elseif af==false then
ag=if ag==nil then table.create(16,0)else convertType(ag)
assert(#ag==16,"Initialization vector must be 16 bytes long")
end
if b then
b=math.floor(tonumber(b)or 1)
assert(type(b)=="number"and 0<b and b<=16,"Segment size must be between 1 and 16 bytes"
)
end

return ad,ae,expandKey(ad),ag,b
end



return{

encrypt_ECB=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7):bytes__DARKLUA_TYPE_7
local af
ad,ae,af=init(ad,ae)

local ag,b,c,d={},{},{{},{},{},{}},{}
for e=1,#ae,16 do
table.move(ae,e,e+15,1,b)
table.move(encrypt(ad,af,b,c,d),1,16,e,ag)
end

return ag
end,
decrypt_ECB=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7):bytes__DARKLUA_TYPE_7
local af
ad,ae,af=init(ad,ae)

local ag,b,c,d={},{},{{},{},{},{}},{}
for e=1,#ae,16 do
table.move(ae,e,e+15,1,b)
table.move(decrypt(ad,af,b,c,d),1,16,e,ag)
end

return ag
end,

encrypt_CBC=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,false,af)

local b,c,d,e,f={},{},af,{{},{},{},{}},{}
for g=1,#ae,16 do
table.move(ae,g,g+15,1,c)
table.move(encrypt(ad,ag,xorBytes(f,c,d),e,d),1,16,g,b)
end

return b
end,
decrypt_CBC=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,false,af)

local b,c,d,e,f={},{},af,{{},{},{},{}},{}
for g=1,#ae,16 do
table.move(ae,g,g+15,1,c)
table.move(xorBytes(c,decrypt(ad,ag,c,e,f),d),1,16,g,b)
table.move(ae,g,g+15,1,d)
end

return b
end,

encrypt_PCBC=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,false,af)

local b,c,d,e,f,g={},{},af,table.create(16,0),{{},{},{},{}},{}
for h=1,#ae,16 do
table.move(ae,h,h+15,1,c)
table.move(encrypt(ad,ag,xorBytes(c,xorBytes(g,d,c),e),f,d),1,16,h,b)
table.move(ae,h,h+15,1,e)
end

return b
end,
decrypt_PCBC=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,false,af)

local b,c,d,e,f,g={},{},af,table.create(16,0),{{},{},{},{}},{}
for h=1,#ae,16 do
table.move(ae,h,h+15,1,c)
table.move(xorBytes(e,decrypt(ad,ag,c,f,g),xorBytes(c,d,e)),1,16,h,b)
table.move(ae,h,h+15,1,d)
end

return b
end,

encrypt_CFB=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?,ag:number?)
:bytes__DARKLUA_TYPE_7
local b
ad,ae,b,af,ag=init(ad,ae,false,af,
if ag==nil then 1 else ag)

local c,d,e,f,g,h={},{},af,{},{{},{},{},{}},{}
for i=1,#ae,ag do
table.move(ae,i,i+ag-1,1,d)
table.move(xorBytes(f,encrypt(ad,b,e,g,h),d),1,ag,i,c)
for j=16,ag+1,-1 do
table.insert(f,1,e[j])
end
table.move(f,1,16,1,e)
end

return c
end,
decrypt_CFB=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7,ag:number?)
:bytes__DARKLUA_TYPE_7
local b
ad,ae,b,af,ag=init(ad,ae,false,af,
if ag==nil then 1 else ag)

local c,d,e,f,g,h={},{},af,{},{{},{},{},{}},{}
for i=1,#ae,ag do
table.move(ae,i,i+ag-1,1,d)
table.move(xorBytes(f,encrypt(ad,b,e,g,h),d),1,ag,i,c)
for j=16,ag+1,-1 do
table.insert(d,1,e[j])
end
table.move(d,1,16,1,e)
end

return c
end,

encrypt_OFB=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:bytes__DARKLUA_TYPE_7?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,false,af)

local b,c,d,e,f={},{},af,{{},{},{},{}},{}
for g=1,#ae,16 do
table.move(ae,g,g+15,1,c)
table.move(encrypt(ad,ag,d,e,f),1,16,1,d)
table.move(xorBytes(f,c,d),1,16,g,b)
end

return b
end,

encrypt_CTR=function(ad:bytes__DARKLUA_TYPE_7,ae:bytes__DARKLUA_TYPE_7,af:((bytes__DARKLUA_TYPE_7)->bytes__DARKLUA_TYPE_7)|bytes__DARKLUA_TYPE_7|{[
string]:any}?):bytes__DARKLUA_TYPE_7
local ag
ad,ae,ag,af=init(ad,ae,true,af)

local b,c,d,e,f,g,h={},{},{},{{},{},{},{}},{},(type(af)=="table")
for i=1,#ae,16 do
if g then
if i>1 and incBytes(af.InitValue,af.LittleEndian)then
table.move(af.InitOverflow,1,16,1,af.InitValue)
end
table.clear(d)
table.move(af.Prefix,1,#af.Prefix,1,d)
table.move(af.InitValue,1,af.Length,#d+1,d)
table.move(af.Suffix,1,#af.Suffix,#d+1,d)
else
h=convertType(af(d,(i+15)/16))
assert(#h==16,"Counter must be 16 bytes long")
table.move(h,1,16,1,d)
end
table.move(ae,i,i+15,1,c)
table.move(xorBytes(d,encrypt(ad,ag,d,e,f),c),1,16,i,b)
end

return b
end
}end function a.r()



local aa=a.load'o'
local ab=a.load'p'

local ac=a.load'q'local ad=

buffer.tostring


local ae=bit32.lshift(1,10)

local af={}

function af.encrypt(ag:string,b:string,c:string):string
return ac.encrypt_CBC(b,ag,c)
end

function af.decrypt(ag:string,b:string,c:string):string
return ac.decrypt_CBC(b,ag,c)
end

function af.base64encode(ag:string):string
return aa.Encode(ag)
end

function af.base64decode(ag:string):string
return aa.Decode(ag)
end

function af.lz4compress(ag:string):string
return ab.compress(ag)
end

function af.lz4decompress(ag:string):string
return ab.decompress(ag)
end





function af.random(ag:number):number
if ag>ae or ag<0 then
error("Expected number within range (0, 1024), got: "..tostring(ag),0)
else
local b={}

for c=33,57 do
table.insert(b,string.char(c))
end

for c=65,90 do
table.insert(b,string.char(c))
end

for c=97,122 do
table.insert(b,string.char(c))
end






local c={}
for d=1,ag do
local e=math.random(1,#b)
table.insert(c,b[e])
end

return table.concat(c)
end
end

return af end function a.s()



return function()
local aa=a.load'r'

if not crypt or not crypt.encrypt then
return{
status=400,
message="Global not found",
}
end

local ab="1234567890abcdef"
local ac="GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
local ad="1234567890abcdef"
local ae="CBC"

local af,ag=pcall(function()
return crypt.encrypt(ab,ac,ad,ae)
end)

if not af then
return{
status=0,
message="Encrypt failed: "..tostring(ag),
}
end

local b="G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh"
local c=aa.base64encode(ag)

if c~=b then
return{
status=500,
message="Encrypted data doesn't match reference data",
}
end


local d,e=a.load'b'{}

if not d then
return{
status=501,
message=`Alias not found: {e}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.t()




return function()
local aa=a.load'r'

if not crypt or not crypt.decrypt then
return{
status=400,
message="Global not found",
}
end

local ab=aa.base64decode"G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh"
local ac="GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
local ad="1234567890abcdef"
local ae="CBC"

local af,ag=pcall(function()
return crypt.decrypt(ab,ac,ad,ae)
end)

if not af then
return{
status=0,
message="Decrypt failed: "..tostring(ag),
}
elseif not ag then
return{
status=500,
message="Decrypt returned nothing",
}
elseif ag~="1234567890abcdef"then
return{
status=500,
message="Decrypted data doesn't match reference data",
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.u()




return function()
local aa=a.load'r'

if not crypt or not crypt.generatekey then
return{
status=400,
message="Global not found",
}
end

local ab=aa.base64decode(crypt.generatekey())
if type(ab)~="string"then
return{
status=500,
message="Generated key doesn't form a string",
}
elseif#ab~=32 then
return{
status=500,
message="Key dosen't match the expected length",
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.v()




return function()
local aa=a.load'r'

if not crypt or not crypt.generatebytes then
return{
status=400,
message="Global not found",
}
end

local ab=math.random(1,512)
local ac=crypt.generatebytes(ab)
local ad=aa.base64decode(ac)
if type(ad)~="string"then
return{
status=500,
message="Generated bytes do not form a string",
}
elseif#ad~=ab then
return{
status=500,
message="Bytes length mismatch: "..tostring(#ad).." != "..tostring(ab),
}
end


local ae,af=a.load'b'{
"base64_decode",
"crypt.base64.decode",
"base64.decode",
"crypt.base64_decode",
}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.w()




return function()
local aa=a.load'r'

if not crypt or not crypt.base64encode then
return{
status=400,
message="Global not found",
}
end

local ab="MYRIAD"
local ac=crypt.base64encode(ab)

if not ac or typeof(ac)~="string"then
return{
status=500,
message="Did not return the expected type",
}
elseif ac~=aa.base64encode(ab)then
return{
status=500,
message="Encoded data doesn't match reference data",
}
end


local ad,ae=a.load'b'{
"base64_encode",
"crypt.base64.encode",
"base64.encode",
"crypt.base64_encode",
}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.x()




return function()
local aa=a.load'r'

if not crypt or not crypt.base64decode then
return{
status=400,
message="Global not found",
}
end

local ab="MYRIAD"
local ac=aa.base64encode(ab)
local ad=crypt.base64decode(ac)

if not ac or typeof(ac)~="string"then
return{
status=500,
message="Reference crypt failed",
}
elseif not ad or typeof(ad)~="string"then
return{
status=500,
message="Did not return the expected type",
}
elseif ad~=ab then
return{
status=500,
message="Decoded data doesn't match reference data",
}
end


local ae,af=a.load'b'{
"base64_decode",
"crypt.base64.decode",
"base64.decode",
"crypt.base64_decode",
}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.y()




return function()
if not crypt or not crypt.hash then
return{
status=400,
message="Global not found",
}
end

local aa="MYRIAD"

local ab={
md5="4f4c0116fe2faa1318448c548b35db329d04b95d6a564c9952674be7470292a8",

sha1="fc7f43037330bdab9a8a3b19a7cbcde1ca35f0f3413e8109f2378d448e09d746",

sha224="c289f37be9147ea83aea5178831674ac35512679c9ac728b0af58d1354aa9586",
sha256="c9d5cae0702443d77159a3da3993a31e21fe71347946e8088e29c329b2fad67d",
sha384="75805da0851cdb609be9cce35c7cf9b8c560fe1d015370d9ffdc7dc974cec3d2",
sha512="9e5a7723b2776d0a26cfc7a1ee141ee7e23ab9be07a7bbe9a83ad9a44d6c932c",

["sha3-256"]="508c76d7f914e8f434b11c84fa5c55a086f86b8b0b38ce0dffa861fdfbdc77b3",
["sha3-384"]="1fb780f81b5a6013af2bfe6677a34439970c63b8447a00e0c23c0e5ff1a4bbd2",
["sha3-512"]="bc49e307d6fd0fc8f9ab5c9236ea93194dfa99dd89fea20e75aed6530bd6820b",
}

for ac,ad in pairs(ab)do
local ae,af=pcall(crypt.hash,aa,ac)

if not ae then
return{
status=0,
message=`Hashing failed with {ac}: {af}`,
}

elseif not af then
return{
status=500,
message=`Hashing failed, expected a hash. Algorithm: {ac}`,
}

elseif af~=ad then
return{
status=500,
message=`Hash mismatch. Algorithm: {ac}`,
}
end
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.z()



return function()
if not crypt or not crypt.random then
return{
status=400,
message="Global not found",
}
end local

aa, ab=pcall(function()
return crypt.random(512)
end)local
ac, ad=pcall(function()
return crypt.random(-1)
end)
local ae,af=pcall(function()
return crypt.random(64)
end)

if not ae then
return{
status=0,
message="Failed: "..tostring(af),
}
elseif ac then
return{
status=500,
message="Arg[1] passed -1, should have failed.",
}
elseif not aa then
return{
status=500,
message="Arg[1] passed 512, should have passed.",
}
elseif#af~=64 then
return{
status=500,
message="Len mismatch. Expected 64, got: "..tostring(#af),
}
end


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.A()




return function()a.load'r'


if not crypt or not crypt.hmac then
return{
status=400,
message="Global not found",
}
end

local aa="MYRIAD"
local ab="secret_key"
local ac="sha256"

local ad="FaDPiTSLlbxRP5rKvomt0dzwl7zhszc46/QFPsZRGWY="
local ae=crypt.hmac(ab,aa,ac)

if not ae then
return{
status=500,
message="Did not return the expected type",
}
elseif ae~=ad then
return{
status=500,
message="Data doesn't match reference data",
}
end


local af,ag=a.load'b'{}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.B()




return function()
if not debug or not debug.getconstant then
return{
status=400,
message="Global not found",
}
end


local function originalFunction()
local aa=2
local ab="A"

print(aa)
tostring(ab)

Date.now()
end

local aa={
[1]="print",

[3]="A",
[4]="tostring",

[6]="Date",
[7]="now"
}

for ab,ac in ipairs(aa)do
local ad=debug.getconstant(originalFunction,ab)
if ad~=ac then
return{
status=500,
message=`Constant at {ab} should be: {ac}. Got: {ad}`,
}
end
end

local ab,ac=pcall(debug.getconstant,originalFunction,9)

if not ab then
return{
status=500,
message="Should pass nil instead of errroing for invalid indexes",
}
elseif ac then
return{
status=500,
message="Constant 9 shouldn't exist",
}
elseif pcall(debug.getconstant,print,1)then
return{
status=500,
message="Should error with C closures",
}
end


local ad,ae=a.load'b'{
"getconstant",
}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.C()




return function()
if not debug or not debug.getconstants then
return{
status=400,
message="Global not found",
}
end


local function originalFunction()
local aa=2
local ab="A"

print(aa)
tostring(ab)

Date.now()
end

local aa={
[1]="print",

[3]="A",
[4]="tostring",

[6]="Date",
[7]="now"
}

for ab,ac in pairs(debug.getconstants(originalFunction))do
if not aa[ab]then
return{
status=500,
message=`{ab} dosen't exist in expected constant order`
}
elseif aa[ab]~=ac then
return{
status=500,
message=`Constant at {ab} should be: {aa[ab]}. Got: {ac}`
}
end
end

if pcall(debug.getconstants,print)then
return{
status=500,
message="Should error with C closures"
}
end


local ab,ac=a.load'b'{
"getconstants"
}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.D()




return function()
if not debug or not debug.getproto then
return{
status=400,
message="Global not found",
}
end


local function originalFunction()
return function()
return"MYRI"
end
end

local aa=debug.getproto(originalFunction,1,true)[1]

if originalFunction()~=aa then
return{
status=500,
message="Actual prototype dosen't match assumed prototype"
}
elseif aa()~="MYRI"then
return{
status=500,
message="Unexpected value of assumed prototype"
}
end


local ab,ac=a.load'b'{
"getproto"
}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.E()




return function()
if not debug or not debug.getprotos then
return{
status=400,
message="Global not found",
}
end


local function originalFunction()
return function()
return"MYRI1"
end,function()
return"MYRI2"
end
end

local aa=0
for ab,ac in ipairs(debug.getprotos(originalFunction))do
aa+=ac()==(ab==1 and"MYRI1"or"MYRI2")and 1 or 0
end

if aa~=2 then
return{
status=500,
message="Didn't recieve correct prototypes, or prototypes didn't return expected values.",
}
end


local ab,ac=a.load'b'{
"getprotos",
}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.F()




return function()
if not debug or not debug.getupvalue then
return{
status=400,
message="Global not found",
}
end




local aa,ab=a.load'b'{
"getupvalue"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.G()




return function()
if not debug or not debug.getupvalues then
return{
status=400,
message="Global not found",
}
end




local aa,ab=a.load'b'{
"getupvalues"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.H()




return function()
if not debug or not debug.getstack then
return{
status=400,
message="Global not found",
}
end




local aa,ab=a.load'b'{
"getstack"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.I()




return function()
if not debug or not debug.setconstant then
return{
status=400,
message="Global not found",
}
end




local aa,ab=a.load'b'{
"setconstant"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.J()




return function()
if not debug or not debug.setupvalue then
return{
status=400,
message="Global not found",
}
end




local aa,ab=a.load'b'{
"setupvalue"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.K()




return function()
if not Drawing or not Drawing.new then
return{
status=400,
message="Global Drawing API not found",
}
end

local function checkProperties(aa,ab,ac)
for ad,ae in ipairs(ac)do
local af,ag=pcall(function()
return ab[ae]
end)
if not af or ag==nil then
return{
status=500,
message=`{aa} is missing property: {ae} (Did you give it a default value?)`,
}
end
ab:Destroy()
end
end


do
local aa=Drawing.new"Line"
if not aa then
return{
status=500,
message="Line drawing object not found",
}
end

local ab=checkProperties("Line",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Text"
if not aa then
return{
status=500,
message="Text drawing object not found",
}
end

local ab=checkProperties("Text",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Image"
if not aa then
return{
status=500,
message="Image drawing object not found",
}
end

local ab=checkProperties("Image",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Circle"
if not aa then
return{
status=500,
message="Circle drawing object not found",
}
end

local ab=checkProperties("Circle",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Square"
if not aa then
return{
status=500,
message="Square drawing object not found",
}
end

local ab=checkProperties("Square",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Quad"
if not aa then
return{
status=500,
message="Quad drawing object not found",
}
end

local ab=checkProperties("Quad",aa,{
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
if ab then
return ab
end
end


do
local aa=Drawing.new"Triangle"
if not aa then
return{
status=500,
message="Triangle drawing object not found",
}
end

local ab=checkProperties("Triangle",aa,{
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
if ab then
return ab
end
end


local aa,ab,ac=math.random(1,255),math.random(1,255),math.random(1,255)
local ad=gethui and gethui()or game:GetService"CoreGui"
local ae=Drawing.new"Line"

ae.Color=Color3.fromRGB(aa,ab,ac)
ae.Transparency=1-aa/255

if ad then
for af,ag in pairs(ad:GetDescendants())do
if ag:IsA"Frame"and ag.BackgroundColor3==ae.Color and ag.BackgroundTransparency==ae.Transparency then
return{
status=500,
message="Drawing library almost certainly depends on ScreenGui"
}
end
end
end


local af,ag=a.load'b'{}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.L()




return function()
if not Drawing or not Drawing.Fonts then
return{
status=400,
message="Global not found",
}
end

if not Drawing.Fonts.UI then
return{
status=500,
message="UI font not found",
}
elseif not Drawing.Fonts.System then
return{
status=500,
message="System font not found",
}
elseif not Drawing.Fonts.Plex then
return{
status=500,
message="Plex font not found",
}
elseif not Drawing.Fonts.Monospace then
return{
status=500,
message="Monospace font not found",
}
elseif Drawing.Fonts.UI~=0 then
return{
status=500,
message="UI font isn't ID 0",
}
elseif Drawing.Fonts.System~=1 then
return{
status=500,
message="System font isn't ID 1",
}
elseif Drawing.Fonts.Plex~=2 then
return{
status=500,
message="Plex font isn't ID 2",
}
elseif Drawing.Fonts.Monospace~=3 then
return{
status=500,
message="Monospace font isn't ID 3",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.M()




return function()
if not getrenderproperty then
return{
status=400,
message="Global not found",
}
elseif not Drawing or not Drawing.new then
return{
status=401,
message="Drawing library needed to test this",
}
end

local aa=Drawing.new"Line"
aa.Thickness=2
aa.Visible=false

local ab=getrenderproperty(aa,"Thickness")
local ac=getrenderproperty(aa,"Visible")

if ab~=2 or ac~=false then
return{
status=500,
message="Property not found or mismatch",
}
end


local ad,ae=a.load'b'{}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.N()




return function()
if not setrenderproperty then
return{
status=400,
message="Global not found",
}
elseif not Drawing or not Drawing.new then
return{
status=401,
message="Drawing library needed to test this",
}
end

local aa=Drawing.new"Line"
setrenderproperty(aa,"Thickness",2)
setrenderproperty(aa,"Visible",false)

if aa.Thickness~=2 or aa.Visible~=false then
return{
status=500,
message="Incorrect property value",
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.O()




return function()
if not cleardrawcache then
return{
status=400,
message="Global not found",
}
elseif not Drawing or not Drawing.new then
return{
status=401,
message="Drawing library needed to test this",
}
end

local aa=Drawing.new"Line"
aa.Visible=false
aa.Thickness=2

task.defer(cleardrawcache)
task.wait(0.1)
if aa.__OBJECT_EXISTS then
return{
status=500,
message="Drawing exists after draw clear",
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.P()




return function()
if not isrenderobj then
return{
status=400,
message="Global not found",
}
elseif not Drawing or not Drawing.new then
return{
status=401,
message="Drawing library needed to test this",
}
end

local aa=Drawing.new"Line"
aa.Visible=false

if not isrenderobj(aa)then
return{
status=500,
message="Didn't return true for a render object",
}
elseif isrenderobj{}or isrenderobj(game:GetService"Workspace")then
return{
status=500,
message="Returned true for a non-render object",
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.Q()




return function()
if not getgenv then
return{
status=400,
message="Global not found",
}
end

getfenv().MYRI="Hello, World!"
getgenv().MYRI1="Hello, World!"
getgenv().MYRI2=123456789

if getgenv().MYRI=="Hello, World!"then
return{
status=500,
message="getfenv affected getgenv",
}
end
if getgenv().MYRI1~="Hello, World!"then
return{
status=500,
message="MYRI1 not found or unexpected value",
}
elseif getgenv().MYRI2~=123456789 then
return{
status=500,
message="MYRI2 not found or unexpected value",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.R()




return function()
if not getrenv then
return{
status=400,
message="Global not found",
}
end

getrenv().MYRIR1="Hello, World!"
getrenv().MYRIR2=123456789

if getrenv().MYRIR1~="Hello, World!"then
return{
status=500,
message="MYRIR1 not found or unexpected value",
}
elseif getrenv().MYRIR2~=123456789 then
return{
status=500,
message="MYRIR2 not found or unexpected value",
}
elseif getrenv().game~=game then
return{
status=500,
message="game not found or unexpected value",
}
elseif getrenv().print~=print then
return{
status=500,
message="print not found or unexpected value",
}
elseif getrenv()._G==_G then
return{
status=500,
message="_G in roblox environment shouldn't match the executor's",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.S()




return function()
if not getgc then
return{
status=400,
message="Global not found",
}
end

local aa={}
local function originalFunction()end
task.wait(0.1)

local ab
local ac
for ad,ae in pairs(getgc(true))do
if ae==originalFunction then
ab=true
elseif ae==aa then
ac=true
end
end

if not ab then
return{
status=500,
message="Original function not found",
}
elseif not ac then
return{
status=500,
message="Original table not found",
}
end


local ad,ae=a.load'b'{}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.T()




return function()
if not filtergc then
return{
status=400,
message="Global not found",
}
end

local aa="MYRIAD"
local function originalFunction()
return"MYRIAD",aa
end

local ab=setmetatable({
MYRIAD="MYRI",
},{
__index=function()end
})local ac=

ab.MYRIAD

originalFunction()

task.wait(0.1)

local ad=filtergc("function",{
Constants={"MYRIAD"},
Upvalues={"MYRIAD"},
IgnoreExecutor=false,
},true)

local ae=filtergc("table",{
KeyValuePairs={MYRIAD="MYRI"},
Metatable=getmetatable(ab),
},true)

if ad~=originalFunction then
return{
status=500,
message="filtergc failed to retrieve the original function",
}
elseif ae~=ab then
return{
status=500,
message="filtergc failed to retrieve the original table",
}
end


local af,ag=a.load'b'{}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.U()




return function()
if not getcustomasset then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

writefile(aa,"31kr6ji222uvn7zvz6ue5yfyn7ky")

task.wait(0.2)

local ab=getcustomasset(aa)

if not typeof(ab)=="string"then
return{
status=500,
message="Asset is not of the expected type (string)"
}
elseif not ab:match"rbxasset://"then
return{
status=500,
message="Asset string dosen't include a rbxasset prefix"
}
end

delfile(aa)


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.V()




return function()
if not isfile then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")
local ab=game:GetService"HttpService":GenerateGUID(false):gsub("-","")
local ac=false
local ad=false

writefile(aa,"")
writefile(ab,"")

task.wait(0.2)

for ae,af in listfiles""do
if af==aa then
ac=true
end
if af==ab then
ad=true
end
end

if not ac and ad then
return{
status=500,
message="Didn't find the expected files"
}
end

delfile(aa)
delfile(ab)


local ae,af=a.load'b'{}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.W()




return function()
if not loadfile then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
end


local aa,ab=math.random(1,100),math.random(1,100)
local ac=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

writefile(ac,"return function(...) return select(1, ...) + select(2, ...) end")

task.wait(0.2)

local ad=loadfile(ac)
if not ad then
return{
status=500,
message="Failed to load file",
}
end

if ad()(aa,ab)~=aa+ab then
return{
status=500,
message="File did not return the expected value",
}
end

delfile(ac)


local ae,af=a.load'b'{}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.X()




return function()
if not appendfile then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
elseif not readfile then
return{
status=401,
message="Dependency 'readfile' not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

writefile(aa,"Hello, ")

task.wait(0.2)

appendfile(aa,"World!")

task.wait(0.2)

if readfile(aa)~="Hello, World!"then
return{
status=500,
message="File did not read the expected value",
}
end

delfile(aa)


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.Y()




return function()
if not delfile then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
elseif not isfile then
return{
status=401,
message="Dependency 'isfile' not found",
}
end


local aa,ab=pcall(writefile,"test1.txt","Content")
local ac,ad=pcall(writefile,"./test2.txt","Content")

local ae=pcall(writefile,"C:/test3.txt","Content")
local af=pcall(writefile,"../test4.txt","Content")

if not aa then
return{
status=0,
message="Failed to write @ test1.txt: "..ab
}
elseif not ac then
return{
status=0,
message="Failed to write @ ./test2.txt: "..ad
}
elseif ae then
return{
status=500,
message="Didn't fail to write in illegal location: @ C:/test3.txt"
}
elseif af then
return{
status=500,
message="Didn't fail to write in illegal location: @ ../test4.txt"
}
elseif not isfile"test1.txt"then
return{
status=500,
message="Didn't find: test1.txt"
}
elseif not isfile"./test2.txt"then
return{
status=500,
message="Didn't find: ./test2.txt"
}
end

delfile"test1.txt"
delfile"./test2.txt"

task.wait(0.2)

if isfile"test1.txt"then
return{
status=500,
message="Found: test1.txt"
}
elseif isfile"./test2.txt"then
return{
status=500,
message="Found: ./test2.txt"
}
end


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.Z()




return function()
if not delfolder then
return{
status=400,
message="Global not found",
}
elseif not makefolder then
return{
status=401,
message="Dependency 'makefolder' not found",
}
elseif not isfolder then
return{
status=401,
message="Dependency 'isfolder' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

if isfolder(aa)then
return{
status=500,
message=`Nonexistent file returned true`,
}
end

makefolder(aa)

task.wait(0.2)

if not isfolder(aa)then
return{
status=500,
message=`Existing file returned false`,
}
end

delfolder(aa)

task.wait(0.2)

if isfolder(aa)then
return{
status=500,
message=`Nonexistent file returned true`,
}
end


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a._()




return function()
if not isfile then
return{
status=400,
message="Global not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

if isfile(aa)then
return{
status=500,
message=`Nonexistent file returned true`,
}
end

writefile(aa,"")

task.wait(0.2)

if not isfile(aa)then
return{
status=500,
message=`Existing file returned false`,
}
end

delfile(aa)


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aa()




return function()
if not isfolder then
return{
status=400,
message="Global not found",
}
elseif not makefolder then
return{
status=401,
message="Dependency 'makefolder' not found",
}
elseif not delfolder then
return{
status=401,
message="Dependency 'delfolder' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")

if isfolder(aa)then
return{
status=500,
message=`Nonexistent folder returned true`,
}
end

makefolder(aa)

task.wait(0.2)

if not isfolder(aa)then
return{
status=500,
message=`Existing folder returned false`,
}
end

delfolder(aa)


local ab,ac=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ab()




return function()
if not writefile then
return{
status=400,
message="Global not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
elseif not readfile then
return{
status=401,
message="Dependency 'readfile' not found",
}
end


local aa,ab=pcall(writefile,"test1.txt","Content")
local ac,ad=pcall(writefile,"./test2.txt","Content")

local ae=pcall(writefile,"C:/test3.txt","Content")
local af=pcall(writefile,"../test4.txt","Content")

if not aa then
return{
status=0,
message="Failed to write @ test1.txt: "..ab
}
elseif not ac then
return{
status=0,
message="Failed to write @ ./test2.txt: "..ad
}
elseif ae then
return{
status=500,
message="Didn't fail to write in illegal location: @ C:/test3.txt"
}
elseif af then
return{
status=500,
message="Didn't fail to write in illegal location: @ ../test4.txt"
}
elseif readfile"test1.txt"~="Content"then
return{
status=500,
message="File didn't give expected contnet"
}
elseif readfile"test2.txt"~="Content"then
return{
status=500,
message="File didn't give expected contnet"
}
end

delfile"test1.txt"
delfile"./test2.txt"


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ac()




return function()
if not readfile then
return{
status=400,
message="Global not found",
}
elseif not delfile then
return{
status=401,
message="Dependency 'delfile' not found",
}
elseif not writefile then
return{
status=401,
message="Dependency 'writefile' not found",
}
end


local aa,ab=pcall(writefile,"test1.txt","Content")

if not aa then
return{
status=0,
message="Failed to write @ test1.txt: "..ab
}
elseif readfile"test1.txt"~="Content"then
return{
status=500,
message="File didn't return the expected content"
}
end

delfile"test1.txt"


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ad()




return function()
if not makefolder then
return{
status=400,
message="Global not found",
}
elseif not delfolder then
return{
status=401,
message="Dependency 'delfolder' not found",
}
end


local aa,ab=pcall(makefolder,"test1")
local ac,ad=pcall(makefolder,"./test2")

local ae=pcall(makefolder,"C:/test3")
local af=pcall(makefolder,"../test4")

if not aa then
return{
status=0,
message="Failed to make @ test1: "..ab
}
elseif not ac then
return{
status=0,
message="Failed to make @ ./test2: "..ad
}
elseif ae then
return{
status=500,
message="Didn't fail to make in illegal location: @ C:/test3"
}
elseif af then
return{
status=500,
message="Didn't fail to make in illegal location: @ ../test4"
}
end

delfolder"test1"
delfolder"./test2"


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ae()




return function()
if not isrbxactive then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{
"iswindowactive",
"isgameactive",
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.af()




return function()
if not keypress then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ag()




return function()
if not keyrelease then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ah()




return function()
if not keytap then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ai()




return function()
if not mouse1click then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aj()




return function()
if not mouse1press then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ak()




return function()
if not mouse1release then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.al()




return function()
if not mouse2click then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.am()




return function()
if not mouse2press then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.an()




return function()
if not mouse2release then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ao()




return function()
if not mousemoveabs then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ap()




return function()
if not mousemoverel then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aq()




return function()
if not mousescroll then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ar()




return function()
if not setclipboard then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{
"toclipboard"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.as()




return function()
if not setrbxclipboard then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.at()




return function()
if not gethui then
return{
status=400,
message="Global not found",
}
end

local aa=gethui()
if not(aa:IsA"ScreenGui"or aa:IsA"BasePlayerGui"or aa:IsA"Folder")then
return{
status=500,
message="Container is not a ScreenGui, BasePlayerGui, or Folder",
}
end
if aa==game:GetService"CoreGui"then
return{
status=500,
message="Container cannot be an uncloned reference to CoreGui",
}
end


local ab,ac=a.load'b'{
"get_hidden_gui"
}

if not ab then
return{
status=501,
message=`Alias not found: {ac}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.au()




return function()
if not cloneref then
return{
status=400,
message="Global not found",
}
end

local aa=Instance.new"Part"
local ab=game:GetService"CoreGui"

if cloneref(aa)==aa then
return{
status=500,
message=`Cloned part cannot be equal to original reference`,
}
elseif cloneref(ab)==ab then
return{
status=500,
message=`Cloned service cannot be equal to original reference`,
}
end


local ac,ad=a.load'b'{
"clonereference",
}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.av()




return function()
if not compareinstances then
return{
status=400,
message="Global not found",
}
elseif not cloneref then
return{
status=401,
message="'cloneref' needed to test this reliably",
}
end

local aa=Instance.new"Part"
local ab=game:GetService"CoreGui"

if cloneref(aa)==aa then
return{
status=500,
message=`(CR) Cloned part cannot be equal to original reference`,
}
elseif cloneref(ab)==ab then
return{
status=500,
message=`(CR) Cloned service cannot be equal to original reference`,
}

elseif not compareinstances(game,game)then
return{
status=500,
message=`Two equal instances (game, game) assumed unequal`,
}
elseif compareinstances(game,workspace)then
return{
status=500,
message=`Two unequal instances (game, workspace) assumed equal`,
}
elseif not compareinstances(aa,cloneref(aa))then
return{
status=500,
message=`Two equal instances (originalPart, clonedPart) assumed equal`,
}
elseif not compareinstances(ab,cloneref(ab))then
return{
status=500,
message=`Two equal instances (originalService, clonedService) assumed equal`,
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aw()




return function()
if not getinstances then
return{
status=400,
message="Global not found",
}
end


local aa,ab=Instance.new"Part",false
local ac,ad=Instance.new("Part",workspace),false

ac.Anchored=true
ac.Transparency=1
ac.CanCollide=false
ac.Position=Vector3.new(0,-100,0)

for ae,af in pairs(getinstances())do
if af==aa then
ab=true
elseif af==ac then
ad=true
elseif not af:IsA"Instance"then
return{
status=500,
message="Found a part that isn't an instance"
}
end
end

if not ab then
return{
status=500,
message="Didn't find a part w/ a nil parent"
}
elseif not ad then
return{
status=500,
message="Didn't find a part w/ a parent"
}
end


local ae,af=a.load'b'{}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ax()




return function()
if not getnilinstances then
return{
status=400,
message="Global not found",
}
end


local aa,ab=Instance.new"Part",false
local ac,ad=Instance.new("Part",workspace),false
local ae=false

ac.Anchored=true
ac.Transparency=1
ac.CanCollide=false
ac.Position=Vector3.new(0,-100,0)

for af,ag in pairs(getnilinstances())do
if ag==aa then
ab=true
elseif ag==ac then
ad=true
elseif ag:IsDescendantOf(game)then
ae=true
elseif not ag:IsA"Instance"then
return{
status=500,
message="Found a part that isn't an instance"
}
end
end

if not ab then
return{
status=500,
message="Didn't find a part w/ a nil parent"
}
elseif ad or ae then
return{
status=500,
message="Found a part w/ a parent"
}
end


local af,ag=a.load'b'{}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ay()




return function()
if not getinstances then
return{
status=400,
message="Global not found",
}
end


local aa,ab,ac=math.random(1,10),math.random(1,10),math.random(1,10)
local ad=Instance.new"BindableFunction"
local ae=Instance.new"BindableFunction"
local af=Instance.new"RemoteFunction"

ad.OnInvoke=function(ag,b)
return(ag+b)^ac
end
af.OnServerInvoke=function()
return ac
end

local ag=getcallbackvalue(ad,"OnInvoke")
local b=getcallbackvalue(ae,"OnInvoke")
local c=getcallbackvalue(af,"OnServerInvoke")

if not ag then
return{
status=500,
message="Didn't return a callback value for a bindable",
}
elseif b then
return{
status=500,
message="Returned a callback value for a bindable with none",
}
elseif not c then
return{
status=500,
message="Returned a callback value for a remote with none",
}
elseif ag(aa,ab)~=(aa+ab)^ac then
return{
status=500,
message="Bindable's callback value didn't return the expected value",
}
elseif c(game.Players.LocalPlayer)~=ac then
return{
status=500,
message="Remote's callback value didn't return the expected value",
}
end


local d,e=a.load'b'{
"getcallbackmember"
}

if not d then
return{
status=501,
message=`Alias not found: {e}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.az()




return function()
if not fireclickdetector then
return{
status=400,
message="Global not found",
}
end


local aa=Instance.new("Part",workspace)
local ab=Instance.new("ClickDetector",aa)

aa.Anchored=true
aa.Transparency=1
aa.CanCollide=false
aa.Position=Vector3.new(0,-100,0)

local function testEvent(ac)
ab[ac]:Connect(function(ad)
if ad~=game:GetService"Players".LocalPlayer then
return{
status=500,
message="Player passed wasn't the LocalPlayer"
}
end
end)

local ad,ae=fireclickdetector(ab,0,ac)

if not ad then
return{
status=0,
message=`Failed w/ error: {ae}`
}
end

return true
end

local ac=testEvent"MouseClick"
local ad=testEvent"RightMouseClick"
local ae=testEvent"MouseHoverEnter"
local af=testEvent"MouseHoverLeave"

game:GetService"RunService".PostSimulation:Wait()

if not ac then
return{
status=500,
message="MouseClick event was not fired."
}
end
if not ad then
return{
status=500,
message="RightMouseClick event was not fired."
}
end
if not ae then
return{
status=500,
message="MouseHoverEnter event was not fired."
}
end
if not af then
return{
status=500,
message="MouseHoverLeave event was not fired."
}
end


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aA()




return function()
if not fireproximityprompt then
return{
status=400,
message="Global not found",
}
end


local aa=false

local ab=game:GetService"Players".LocalPlayer
local ac=game:GetService"ProximityPromptService"
local ad=Instance.new("Part",workspace)
local ae=Instance.new("ProximityPrompt",ad)

ad.Anchored=true
ad.Transparency=1
ad.CanCollide=false
ad.Position=Vector3.new(0,-100,0)
ae.HoldDuration=1

ac.PromptButtonHoldBegan:Connect(function(af)
return{
status=500,
message="Proximity prompt was manually fired"
}
end)

ac.PromptButtonHoldEnded:Connect(function(af)
return{
status=500,
message="Proximity prompt was manually fired"
}
end)

ae:GetPropertyChangedSignal"HoldDuration":Connect(function()
return{
status=500,
message="Modified HoldDuration"
}
end)

ae.Triggered:Connect(function(af)
if af~=ab then
return{
status=500,
message="Player passed wasn't the LocalPlayer"
}
end

aa=true
end)

local af,ag=pcall(fireproximityprompt,ae)

game:GetService"RunService".PostSimulation:Wait()

if not af then
return{
status=0,
message=`Failed w/ error: {ag}`
}
elseif not aa then
return{
status=500,
message=`Prompt was not triggered`
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aB()




return function()
if not firetouchinterest then
return{
status=400,
message="Global not found",
}
end


local aa=game.Players.LocalPlayer.Character.Head
local ab=false
local ac=false
local ad=Instance.new"Part"

ad.Anchored=true
ad.Transparency=1
ad.CanCollide=false
ad.Position=Vector3.new(0,-100,0)
ad.Parent=workspace

ad.Touched:Connect(function(ae:BasePart)
if ae~=aa then
ad:Destroy()

return{
status=500,
message="Touch part given wasn't the passed touch part",
}
end

ab=true
end)

ad.TouchEnded:Connect(function(ae:BasePart)
if ae~=aa then
ad:Destroy()

return{
status=500,
message="Touch part given wasn't the passed touch part",
}
end

ac=true
end)

firetouchinterest(aa,ad,false)
game:GetService"RunService".PostSimulation:Wait()

if not ab then
return{
status=500,
message="Touched event wasn't fired",
}
end

firetouchinterest(aa,ad,true)
game:GetService"RunService".PostSimulation:Wait()

if not ac then
return{
status=500,
message="Touched event wasn't fired",
}
end

ad:Destroy()


local ae,af=a.load'b'{}

if not ae then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aC()




return function()
if not saveinstance then
return{
status=400,
message="Global not found",
}
elseif not listfiles then
return{
status=501,
message="Dependant global 'listfiles' not found",
}
elseif not delfile then
return{
status=501,
message="Dependant global 'delfile' not found",
}
end


local aa=game:GetService"HttpService":GenerateGUID(false):gsub("-","")
local ab=Instance.new"Part"

saveinstance(ab,{
FileName=aa
})

task.wait(0.5)

local ac=false

for ad,ae in pairs(listfiles"")do
if ae:find(aa)then
ac=true
delfile(ae)
end
end

if not ac then
return{
status=500,
message="Couldn't find saved part. Args passed: (Instance, { FileName = string })"
}
end


local ad,ae=a.load'b'{}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aD()




return function()
if not getrawmetatable then
return{
status=400,
message="Global not found",
}
end

local aa=getrawmetatable(game)

if typeof(aa)~="table"then
return{
status=500,
message="Didn't return a table",
}
elseif aa.__index(game,"Workspace")~=game:GetService"Workspace"then
return{
status=500,
message="Didn't give correct index for Workspace",
}
elseif aa.__index(game,"ReplicatedStorage")~=game:GetService"ReplicatedStorage"then
return{
status=500,
message="Didn't give correct index for ReplicatedStorage",
}
elseif aa.__index(game,"Stats")~=game:GetService"Stats"then
return{
status=500,
message="Didn't give correct index for Stats",
}
end

local ab={
__add="add",
__sub="sub",
__mul="mul",
__div="div",
__mod="mod",
__pow="pow",
__unm="unm",
__idiv="idiv",
__band="band",
__bor="bor",
__bxor="bxor",
__bnot="bnot",
__shl="shl",
__shr="shr",
__concat="concat",
__len="len",
__eq="eq",
__lt="lt",
__le="le",
__call="call",
}

for ac,ad in pairs(ab)do
if aa[ac]then
return{
status=500,
message=`Found {ad} metamethod in the raw meta table`,
}
end
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aE()




return function()
if not setrawmetatable then
return{
status=400,
message="Global not found",
}
end

local aa=setmetatable({},{
__index=function()
return false
end,
__metatable="Locked",
})
local ab=setrawmetatable(aa,{
__index=function()
return true
end,
})

if not aa then
return{
status=500,
message="Original object not given",
}
elseif aa.MYRI~=true then
return{
status=500,
message="Return function gave true, MYRI not found",
}
elseif not ab then
return{
status=500,
message="Returned object not given",
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.aF()




return function()
if not hookmetamethod then
return{
status=400,
message="Global not found",
}
end

local aa=false
local ab

ab=hookmetamethod(game,"__namecall",function(...)
aa=true

return ab(...)
end)

game:GetService"RunService".Heartbeat:Wait()

if not aa then
return{
status=500,
message="Failed to hook __namecall metamethod",
}
end


local ac,ad=a.load'b'{}

if not ac then
return{
status=501,
message=`Alias not found: {ad}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.aG()




return function()
if not getnamecallmethod then
return{
status=400,
message="Global not found",
}
elseif not hookmetamethod then
return{
status=400,
message="Global not found",
}
end

local aa=Instance.new"Part"
local ab=false
local ac

ac=hookmetamethod(aa,"__namecall",function(...)
if not ab then
ab=getnamecallmethod()
end

return ac(...)
end)

aa:Destroy()
task.wait()

if ab~="Destroy"then
return{
status=500,
message="Didn't return the correct method",
}
end


local ad,ae=a.load'b'{}

if not ad then
return{
status=501,
message=`Alias not found: {ae}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.aH()




return function()
if not setreadonly then
return{
status=400,
message="Global not found",
}
end

local aa=table.freeze{
MYRIAD="MYRI"
}local

ab, ac=pcall(function()
aa.MYRIAD="MYRIAD"
end)local
ad, ae=pcall(function()
setreadonly(aa,false)
aa.MYRIAD="MYRIAD"
end)
local af,ag=pcall(function()
setreadonly(aa,true)
aa.MYRIAD="MYRIAD"
end)

if ab then
return{
status=500,
message="Frozen table writable (???): "..ag
}
elseif not ad then
return{
status=500,
message="Table unwritable after readonly was disabled: "..ag
}
elseif af then
return{
status=500,
message="Table writable after readonly was enabled: "..ag
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aI()




return function()
if not makereadonly then
return{
status=400,
message="Global not found",
}
end

local aa=table.freeze{
MYRIAD="MYRI"
}local

ab, ad=pcall(function()
aa.MYRIAD="MYRIAD"
end)
local af,ag=pcall(function()
makereadonly(aa)
aa.MYRIAD="MYRIAD"
end)

if ab then
return{
status=500,
message="Frozen table writable (???): "..ag
}
elseif af then
return{
status=500,
message="Table unwritable after readonly was disabled: "..ag
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aJ()




return function()
if not isreadonly then
return{
status=400,
message="Global not found",
}
end


local aa={}

if isreadonly(aa)then
return{
status=500,
message="Writable table is assumed read-only"
}
end

table.freeze(aa)

if not isreadonly(aa)then
return{
status=500,
message="Table assumed writable after being set as read-only"
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aK()




return function()
if not identifyexecutor then
return{
status=400,
message="Global not found",
}
end


local aa,ab=identifyexecutor()
if not aa or not ab then
return{
status=500,
message=`Did not return expected data (executor, version)`,
}
elseif type(aa)~="string"or type(ab)~="string"then
return{
status=500,
message=`Expected [string, string] got [{aa}, {ab}]`,
}
end


local af,ag=a.load'b'{
"getexecutorname"
}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message=`Passed ({aa}, {ab})`,
}
end end function a.aL()




return function()
if not setfpscap then
return{
status=400,
message="Global not found",
}
end


local aa=game:GetService"RunService".RenderStepped

local function step()
aa:Wait()
local ab=0
for af=1,10 do
ab+=1/aa:Wait()
end
return math.round(ab/10)
end

setfpscap(60)
local ab=step()
setfpscap(0)
local af=step()


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed (60: {ab}, 0: {af})`,
}
end end function a.aM()




return function()
if not getfpscap then
return{
status=400,
message="Global not found",
}
end


if typeof(getfpscap())~="number"then
return{
status=500,
message=`Did not return a number`,
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aN()




return function()
if not request then
return{
status=400,
message="Global not found",
}
end


local aa=request{
Url="https://httpbin.org/user-agent",
Method="GET",
}

if typeof(aa)~="table"then
return{
status=500,
message="Reponse wasn't a table"
}
elseif aa.StatusCode~=200 then
return{
status=500,
message="Didn't give status 200 (is httpbin.org down?)"
}
end

local ab=game:GetService"HttpService":JSONDecode(aa.Body)
if type(ab)~="table"and type(ab["user-agent"])~="string"then
return{
status=500,
message="Didn't give a table w/ user-agent string"
}
end


local af,ag=a.load'b'{
"http.request",
"http_request"
}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message=`Passed ({ab["user-agent"]})`,
}
end end function a.aO()




return function()
local aa=a.load'r'

if not lz4compress then
return{
status=400,
message="Global not found",
}
end

local ab="MYRIAD"
local af=aa.base64decode"YE1ZUklBRA=="
local ag=lz4compress(ab)

if typeof(ag)~="string"then
return{
status=500,
message="Did not return the expected type",
}
elseif ag~=af then
return{
status=500,
message="Compressed data doesn't match reference data",
}
end


local b,c=a.load'b'{
"crypt.lz4compress"
}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.aP()




return function()
local aa=a.load'r'

if not lz4decompress then
return{
status=400,
message="Global not found",
}
end

local ab="MYRIAD"
local af=aa.base64decode"YE1ZUklBRA=="
local ag=lz4decompress(af,#ab)

if typeof(ag)~="string"then
return{
status=500,
message="Did not return the expected type",
}
elseif ag~=ab then
return{
status=500,
message="Compressed data doesn't match reference data",
}
end


local b,c=a.load'b'{
"crypt.lz4decompress"
}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.aQ()




return function()
if not getfpscap then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{
"queueonteleport"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aR()




return function()
if not messagebox then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aS()




return function()
if not rconsoleprint then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aT()




return function()
if not rconsoleinfo then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aU()




return function()
if not rconsolewarn then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aV()




return function()
if not rconsoleerr then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aW()




return function()
if not rconsoleinput then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aX()




return function()
if not rconsoleclear then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aY()




return function()
if not rconsolename then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.aZ()




return function()
if not rconsolehide then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a_()




return function()
if not rconsoleshow then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a0()




return function()
if not sethiddenproperty then
return{
status=400,
message="Global not found",
}
elseif not gethiddenproperty then
return{
status=400,
message="Global not found",
}
end


local aa=Instance.new"Part"

local ab,af=gethiddenproperty(aa,"Name")
local ag,b=gethiddenproperty(aa,"siz")

if af then
return{
status=500,
message="Non-hidden property assumed hidden",
}
elseif ab~="Part"then
return{
status=500,
message="Non-hidden property value incorrect",
}
elseif not b then
return{
status=500,
message="Hidden property assumed non-hidden",
}
elseif ag~="can't get value"then
return{
status=500,
message="Hidden property value incorrect",
}
end

sethiddenproperty(aa,"siz","can get value")

if not gethiddenproperty(aa,"siz")=="can get value"then
return{
status=500,
message="Hidden property's value was incorrectly set"
}
end


local c,d=a.load'b'{}

if not c then
return{
status=501,
message=`Alias not found: {d}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a1()




return function()
if not gethiddenproperty then
return{
status=400,
message="Global not found",
}
end


local aa=Instance.new"Part"

local ab,af=gethiddenproperty(aa,"Name")
local ag,b=gethiddenproperty(aa,"siz")

if af then
return{
status=500,
message="Non-hidden property assumed hidden",
}
elseif ab~="Part"then
return{
status=500,
message="Non-hidden property value incorrect",
}
elseif not b then
return{
status=500,
message="Hidden property assumed non-hidden",
}
elseif ag~="can't get value"then
return{
status=500,
message="Hidden property value incorrect",
}
end


local c,d=a.load'b'{}

if not c then
return{
status=501,
message=`Alias not found: {d}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a2()




return function()
if not setthreadidentity then
return{
status=400,
message="Global not found",
}
end


local aa,ab=a.load'b'{
"setidentity",
"setthreadcontext"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a3()




return function()
if not getthreadidentity then
return{
status=400,
message="Global not found",
}
end


if typeof(getthreadidentity())~="number"then
return{
status=500,
message="Did not return a number",
}
end


local aa,ab=a.load'b'{
"getidentity",
"getthreadcontext"
}

if not aa then
return{
status=501,
message=`Alias not found: {ab}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a4()




return function()
if not setscriptable then
return{
status=400,
message="Global not found",
}
end

local aa=Instance.new"Part"

if pcall(function()local ab=aa.MaterialVariantSerialized end)then
return{
status=500,
message="Unaccessible property accessible",
}
end

setscriptable(aa,"MaterialVariantSerialized",true)
if not pcall(function()local ab=aa.MaterialVariantSerialized end)then
return{
status=500,
message="MaterialVariantSerialized inaccessible after being set as scriptable",
}
end

setscriptable(aa,"MaterialVariantSerialized",false)
if pcall(function()local ab=aa.MaterialVariantSerialized end)then
return{
status=500,
message="MaterialVariantSerialized accessible after being set as unscriptable",
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a5()




return function()
if not isscriptable then
return{
status=400,
message="Global not found",
}
end

local aa=Instance.new"Part"

if not isscriptable(aa,"Name")then
return{
status=500,
message="Accessible property 'Name' assumed inaccessible",
}
elseif isscriptable(aa,"MaterialVariantSerialized")then
return{
status=500,
message="Inaccessible property 'MaterialVariantSerialized' assumed accessible",
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a6()




return function()
if not getscripts then
return{
status=400,
message="Global not found",
}
end


local aa=Instance.new"LocalScript"
local ab=Instance.new"ModuleScript"
local af=Instance.new"Script"
local ag=Instance.new"Script"
ag.RunContext=Enum.RunContext.Client
local b=getscripts()

if not table.find(b,aa)then
return{
status=500,
message="LocalScript not found in returned table",
}
elseif not table.find(b,ab)then
return{
status=500,
message="ModuleScript not found in returned table",
}
elseif not table.find(b,ag)then
return{
status=500,
message="ServerScript w/ client runcontext not found in returned table",
}
elseif table.find(b,af)then
return{
status=500,
message="ServerScript found in returned table",
}
end


local c,d=a.load'b'{}

if not c then
return{
status=501,
message=`Alias not found: {d}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a7()




return function()
if not getrunningscripts then
return{
status=400,
message="Global not found",
}
end


local aa=game.Players.LocalPlayer.Character:FindFirstChild"Animate"
local ab=game.Players.LocalPlayer.Character:FindFirstChild"whysoud"
local af=game.Players.LocalPlayer.Character:FindFirstChild"whysodtc"
local ag=game.Players.LocalPlayer.Character:FindFirstChild"maybeisdtc"

local b=Instance.new"LocalScript"
local c=Instance.new"ModuleScript"
local d=Instance.new"Script"
local e=Instance.new"Script"
e.RunContext=Enum.RunContext.Client
local f=getrunningscripts()

if table.find(f,b)then
return{
status=500,
message="LocalScript found in returned table",
}
elseif table.find(f,c)then
return{
status=500,
message="ModuleScript found in returned table",
}
elseif table.find(f,e)then
return{
status=500,
message="ServerScript w/ client runcontext found in returned table",
}
elseif table.find(f,d)then
return{
status=500,
message="ServerScript found in returned table",
}
elseif table.find(f,af)then
return{
status=500,
message="Disabled script found in returned table",
}
elseif table.find(f,ag)then
return{
status=500,
message="Non-running script found in returned table",
}
elseif not table.find(f,aa)or not table.find(f,ab)then
return{
status=500,
message="Didn't find a running script in the returned table"
}
end


local g,h=a.load'b'{}

if not g then
return{
status=501,
message=`Alias not found: {h}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a8()




return function()
if not getcallingscript then
return{
status=400,
message="Global not found",
}
elseif not checkcaller then
return{
status=401,
message="Dependency 'checkcaller' not found"
}
elseif not hookmetamethod then
return{
status=401,
message="Dependency 'hookmetamethod' not found"
}
end


local aa;
aa=hookmetamethod(game,"__index",function(ab,af)
if not checkcaller()then
getcallingscript()

hookmetamethod(game,"__index",aa)
end

return aa(ab,af)
end)

if getcallingscript()then
return{
status=500,
message="Executor call assumed to be a game call"
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.a9()




return function()
local aa,ab=pcall(function()return game:GetService"StarterPlayer".StarterPlayerScripts.PlayerModule end)
if not getloadedmodules then
return{
status=400,
message="Global not found",
}
elseif not aa then
return{
status=401,
message="Testing dependency 'PlayerModule' not found.",
}
end


require(ab)
local af=Instance.new"ModuleScript"

local ag=getloadedmodules()
if not table.find(ag,ab)then
return{
status=500,
message="Loaded module not found in returned table",
}
elseif table.find(ag,af)then
return{
status=500,
message="Unloaded module found in returned table",
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.ba()




return function()
local aa,ab=pcall(function()
return game.Players.LocalPlayer.Character.Animate
end)
if not getloadedmodules then
return{
status=400,
message="Global not found",
}
elseif not aa then
return{
status=401,
message="Testing dependency 'Animate' not found.",
}
end


local af=getsenv(ab)
if not af.onSwimming or not typeof(af.onSwimming)=="function"then
return{
status=500,
message="Global in test script wasn't found, or didn't return the right type",
}
end


local ag,b=a.load'b'{}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bb()




return function()
local aa,ab=pcall(function()return game.Players.LocalPlayer.Character.Animate end)
if not getscripthash then
return{
status=400,
message="Global not found",
}
elseif not aa then
return{
status=401,
message="Testing dependency 'Animate' not found.",
}
end

local af=Instance.new"LocalScript"
local ag,b=pcall(function()
return getscripthash(ab)
end)local
c, d=pcall(function()
return getscripthash(af)
end)

if not ag then
return{
status=500,
message="Failed to get bytecode of 'Animate': "..b,
}
elseif not c then
return{
status=500,
message="Failed to get script w/ no bytecode. Errored instead of returning nil.",
}
elseif typeof(b)~="string"then
return{
status=500,
message="Did not return a hash string",
}
elseif hashNoBytecode~=nil then
return{
status=500,
message="A script with no bytecode returned non-nil data",
}
end

ab:Clone()
local e=ab.Source
ab.Source="return 1"
local f=getscripthash(ab)

if b==f then
return{
status=500,
message="Gave the same hash for a modified script",
}
end

ab.Source=e


local g,h=a.load'b'{}

if not g then
return{
status=501,
message=`Alias not found: {h}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bc()




return function()
if not loadstring then
return{
status=400,
message="Global not found",
}
end

local aa=loadstring("MYRIAD","MYRIAD")

loadstring[[
		globalVar = {"Hello", "World"}
	]]()

if not globalVar or not(globalVar[1]=="Hello"and globalVar[2]=="World")then
return{
status=500,
message="Global variable insert from loadstring not found",
}
elseif aa~=nil then
return{
status=500,
message="Didn't error on incomplete expression",
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bd()




return function()a.load'r'

if not getrunningscripts then
return{
status=400,
message="Global not found",
}
end


local aa=game.Players.LocalPlayer.Character:FindFirstChild"whysoud"
local ab=getscriptbytecode(aa)
local af={
"sigma",
"task",
"wait",
"GOT A DROP ON THIS FLEXING FELLA<MYRIAD_UD_MAX_UD_NEVER_SPEAK_TO_ME_AGAIN_KING_VON_IS_A_SAINT",
"tostring"
}

for ag,b in pairs(af)do
if not ab:find(b)then
return{
status=500,
message="Didn't find an expected segment in the bytecode"
}
end
end


local ag,b=a.load'b'{
"dumpstring"
}

if not ag then
return{
status=501,
message=`Alias not found: {b}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.be()




return function()a.load'r'

if not getscriptclosure then
return{
status=400,
message="Global not found",
}
end


local aa=game.Players.LocalPlayer.Character:FindFirstChild"maybeisdtc"
local ab=getscriptclosure(aa)

if typeof(ab)~="function"then
return{
status=500,
message="Expected a closure"
}
elseif ab()~="GOT A DROP ON THIS FLEXING FELLA"then
return{
status=500,
message="Closure did not return the expected value"
}
end


local af,ag=a.load'b'{
"getscriptfunction"
}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bf()




return function()
local aa,ab=pcall(function()
return game.ReplicatedFirst.decompmeplssss
end)

if not decompile then
return{
status=400,
message="Global not found",
}
elseif not aa then
return{
status=401,
message="Testing dependency 'ReplicatedFirst.decompmeplssss' not found.",
}
end


local function checkPatterns(af,ag)
local b={}
for c,d in ipairs(ag)do
if not af:find(d,1,true)then
table.insert(b,d)
end
end

if#b>0 then
return false,b
end

return true
end

local af=decompile(ab)

if typeof(af)~="string"then
return{
status=500,
message="Decompiled script isn't a string",
}
elseif#af<=0 then
return{
status=500,
message="Decompiled script didn't return anything",
}
end

local ag,b=checkPatterns(af,{
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

if not ag then
return{
status=500,
message="Decompiled script missing expected strings: "..table.concat(b,", "),
}
end


local c,d=a.load'b'{}
if not c then
return{
status=501,
message=`Alias not found: {d}`,
}
end

return{
status=200,
message="Passed",
}
end end function a.bg()




return function()
if not isparallel then
return{
status=400,
message="Global not found",
}
elseif not run_on_actor then
return{
status=401,
message="Dependency 'run_on_actor' not found",
}
end


local aa=game.Players.LocalPlayer.Character:FindFirstChild"PMOVON"

if isparallel()then
return{
status=500,
message="Non-parallel thread assumed to be in a parallel state"
}
end


run_on_actor(aa,[[
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

if not game.ReplicatedStorage:FindFirstChild(os.date"%H".."(1)")then
return{
status=500,
message="Parallel thread assumed to be in a non-parallel state"
}
end

task.wait()

if isparallel()then
return{
status=500,
message="Non-parallel thread assumed to be in a parallel state"
}
end


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bh()












































































































return function()
if not run_on_actor then
return{
status=400,
message="Global not found",
}
end


local aa=game.Players.LocalPlayer.Character:FindFirstChild"PMOVON"

if not aa then
return{
status=500,
message="Failed find to actor"
}
end

run_on_actor(aa,[[local originalPart = Instance.new("Part")
		originalPart.Name = os.date("%H")
		originalPart.Parent = game.ReplicatedStorage
	]])

task.wait(0.1)

if not game.ReplicatedStorage:FindFirstChild(os.date"%H")then
return{
status=500,
message="Failed to find a part created by the actor"
}
end

game.ReplicatedStorage:FindFirstChild(os.date"%H"):Destroy()


local ab,af=a.load'b'{}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bi()




return function()
if not create_comm_channel then
return{
status=400,
message="Global not found",
}
elseif not run_on_actor then
return{
status=401,
message="Dependency 'run_on_actor' not found",
}
elseif not get_comm_channel then
return{
status=401,
message="Dependency 'get_comm_channel' not found",
}
end


local aa=0
local ab=game.Players.LocalPlayer.Character:FindFirstChild"PMOVON"

if not ab then
return{
status=500,
message="Failed to find actor",
}
end

local af,ag=create_comm_channel()

if not ag then
return{
status=500,
message=`EventObject dosen't exist`,
}
elseif typeof(af)~="number"then
return{
status=500,
message="Communication ID isn't a number",
}
end

ag.Event:Connect(function(b)
if b~="abs"then
aa=-1
end

aa=1
end)

run_on_actor(ab,[[
		local channel = get_comm_channel(...)
		channel:Fire('abs')
	]],af)

task.wait(0.1)

if aa==0 then
return{
status=500,
message="Did not fire the event",
}
elseif not aa==-1 then
return{
status=500,
message="Passed argument[1] wasn't the expected value",
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bj()














































































































return function()
if not get_comm_channel then
return{
status=400,
message="Global not found",
}
elseif not run_on_actor then
return{
status=401,
message="Dependency 'run_on_actor' not found",
}
elseif not create_comm_channel then
return{
status=401,
message="Dependency 'create_comm_channel' not found",
}
end


local aa=0
local ab=game.Players.LocalPlayer.Character:FindFirstChild"PMOVON"

if not ab then
return{
status=500,
message="Failed to find actor",
}
end

local af,ag=create_comm_channel()

if not ag then
return{
status=500,
message=`EventObject dosen't exist`,
}
elseif typeof(af)~="number"then
return{
status=500,
message="Communication ID isn't a number",
}
end

ag.Event:Connect(function(b)
if b~="abs"then
aa=-1
end

aa=1
end)

run_on_actor(ab,[[
		local channel = get_comm_channel(...)
		channel:Fire('abs')
	]],af)

task.wait(0.1)

if aa==0 then
return{
status=500,
message="Did not fire the event",
}
elseif not aa==-1 then
return{
status=500,
message="Passed argument[1] wasn't the expected value",
}
end


local b,c=a.load'b'{}

if not b then
return{
status=501,
message=`Alias not found: {c}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bk()












































































































return function()
if not getactors then
return{
status=400,
message="Global not found",
}
end


local aa=false
local ab=game.Players.LocalPlayer.Character:FindFirstChild"PMOVON"

for af,ag in pairs(getactors())do
if ag==ab then
aa=true
end
end

if not aa then
return{
status=500,
message="Didn't find a game actor"
}
end


local af,ag=a.load'b'{}

if not af then
return{
status=501,
message=`Alias not found: {ag}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bl()




return function()
if not WebSocket or not WebSocket.connect then
return{
status=400,
message="Global not found",
}
end


local aa=WebSocket.connect"ws://echo.websocket.events"
if not(type(aa)=="table"or type(aa)=="userdata")then
return{
status=500,
message="Didn't give a table | userdata",
}
end

for ab,af in pairs{OnClose=

{"RBXScriptSignal",{table={"Connect","Once","Wait"}}},OnMessage=
{"RBXScriptSignal",{table={"Connect","Once","Wait"}}},Send=
"function",Close=
"function",
}do
local ag,b=pcall(function()
return aa[ab]
end)

if not ag or b==nil then
return{
status=500,
message=`WebSocketObject is missing: {ab}`,
}
end

local c=typeof(af)=="table"and af[1]or af
if typeof(b)~=c then
return{
status=500,
message=`WebSocketObject.{ab} is not a {c} (got {typeof(b)})`,
}
end

if typeof(af)=="table"and af[2]and typeof(af[2])=="table"then
for d,e in pairs(af[2])do
if d=="table"and typeof(b)=="table"then
for f,g in ipairs(e)do
if typeof(b[g])~="function"then
return{
status=500,
message=`WebSocketObject.{ab}.{g} is not a function`,
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


local ab,af=a.load'b'{
"websocket.connect",
}

if not ab then
return{
status=501,
message=`Alias not found: {af}`,
}
end

return{
status=200,
message=`Passed`,
}
end end function a.bm()



return function(aa,ab)

local af
local ag
local b={}
local c={}

local d={
checkpointDelay=0,
statusFilter=false,
stripRichtext=false,
formatDiff=false,
includeMetadata=false,
}

local e={
bullet="•",
}

local f={
[0]="❓",
[200]="✅",
[400]="🔎",
[401]="📦",
[500]="🛠️",
[501]="🏷️",
}

local g={
cache={
["cache.invalidate"]=a.load'c',
["cache.iscached"]=a.load'd',
["cache.replace"]=a.load'e',
},

Closures={islclosure=a.load'f'
,iscclosure=a.load'g'
,isexecutorclosure=a.load'h'
,newcclosure=a.load'i'
,clonefunction=a.load'j'
,hookfunction=a.load'k'
,restorefunction=a.load'l'
,getfunctionhash=a.load'm'
,checkcaller=a.load'n'
,
},

crypt={
["crypt.encrypt"]=a.load's',
["crypt.decrypt"]=a.load't',
["crypt.generatekey"]=a.load'u',
["crypt.generatebytes"]=a.load'v',
["crypt.base64encode"]=a.load'w',
["crypt.base64decode"]=a.load'x',
["crypt.hash"]=a.load'y',
["crypt.random"]=a.load'z',
["crypt.hmac"]=a.load'A',
},

debug={
["debug.getconstant"]=a.load'B',
["debug.getconstants"]=a.load'C',
["debug.getproto"]=a.load'D',
["debug.getprotos"]=a.load'E',
["debug.getupvalue"]=a.load'F',
["debug.getupvalues"]=a.load'G',
["debug.getstack"]=a.load'H',
["debug.setconstant"]=a.load'I',
["debug.setupvalue"]=a.load'J',
},

Drawing={
["Drawing.new"]=a.load'K',
["Drawing.Fonts"]=a.load'L',getrenderproperty=a.load'M'
,setrenderproperty=a.load'N'
,cleardrawcache=a.load'O'
,isrenderobj=a.load'P'
,
},

Environment={getgenv=a.load'Q'
,getrenv=a.load'R'
,getgc=a.load'S'
,filtergc=a.load'T'
,
},

Filesystem={getcustomasset=a.load'U'
,listfiles=a.load'V'
,loadfile=a.load'W'
,appendfile=a.load'X'
,delfile=a.load'Y'
,delfolder=a.load'Z'
,isfile=a.load'_'
,isfolder=a.load'aa'
,writefile=a.load'ab'
,readfile=a.load'ac'
,makefolder=a.load'ad'
,
},

Input={isrbxactive=a.load'ae'
,keypress=a.load'af'
,keyrelease=a.load'ag'
,keytap=a.load'ah'
,mouse1click=a.load'ai'
,mouse1press=a.load'aj'
,mouse1release=a.load'ak'
,mouse2click=a.load'al'
,mouse2press=a.load'am'
,mouse2release=a.load'an'
,mousemoveabs=a.load'ao'
,mousemoverel=a.load'ap'
,mousescroll=a.load'aq'
,setclipboard=a.load'ar'
,setrbxclipboard=a.load'as'
,
},

Instances={gethui=a.load'at'
,cloneref=a.load'au'
,compareinstances=a.load'av'
,getinstances=a.load'aw'
,getnilinstances=a.load'ax'
,getcallbackvalue=a.load'ay'
,fireclickdetector=a.load'az'
,fireproximityprompt=a.load'aA'
,firetouchinterest=a.load'aB'
,saveinstance=a.load'aC'
,
},

Metatable={getrawmetatable=a.load'aD'
,setrawmetatable=a.load'aE'
,hookmetamethod=a.load'aF'
,getnamecallmethod=a.load'aG'
,setreadonly=a.load'aH'
,makereadonly=a.load'aI'
,isreadonly=a.load'aJ'
,
},

Miscellaneous={identifyexecutor=a.load'aK'
,setfpscap=a.load'aL'
,getfpscap=a.load'aM'
,request=a.load'aN'
,lz4compress=a.load'aO'
,lz4decompress=a.load'aP'
,queue_on_teleport=a.load'aQ'
,
},

External={messagebox=a.load'aR'
,rconsoleprint=a.load'aS'
,rconsoleinfo=a.load'aT'
,rconsolewarn=a.load'aU'
,rconsoleerr=a.load'aV'
,rconsoleinput=a.load'aW'
,rconsoleclear=a.load'aX'
,rconsolename=a.load'aY'
,rconsolehide=a.load'aZ'
,rconsoleshow=a.load'a_'
,
},

Reflection={sethiddenproperty=a.load'a0'
,gethiddenproperty=a.load'a1'
,setthreadidentity=a.load'a2'
,getthreadidentity=a.load'a3'
,setscriptable=a.load'a4'
,isscriptable=a.load'a5'
,
},

Scripts={getscripts=a.load'a6'
,getrunningscripts=a.load'a7'
,getcallingscript=a.load'a8'
,getloadedmodules=a.load'a9'
,getsenv=a.load'ba'
,getscripthash=a.load'bb'
,loadstring=a.load'bc'
,getscriptbytecode=a.load'bd'
,getscriptclosure=a.load'be'
,decompile=a.load'bf'
,
},

Signals={

},

Actors={isparallel=a.load'bg'
,run_on_actor=a.load'bh'
,create_comm_channel=a.load'bi'
,get_comm_channel=a.load'bj'
,getactors=a.load'bk'
,
},

WebSocket={connect=a.load'bl'
,
},
}


local h=function(...)
local h=table.concat({...}," ")
ag:AppendText(h)
end

local i=function(...)
local i=table.concat({...}," ")
ag:AppendText(`<font color="#FFA500">{i}</font>`)
end

local function test()
if af then
task.cancel(af)
end

af=task.spawn(function()
local j=time()
local k=0
local l=0
local m=0

for n,o in g do
b[n]=nil
c[n]={}

for p in o do
m+=1
b[n]=p
end
end

local n={}
for o,p in g do
for q,r in p do
table.insert(n,{
groupName=o,
name=q,
test=r,
})
end
end

for o,p in ipairs(n)do
local q=p.groupName
local r=p.name
local s=p.test

local t=n[o+1]

local u,w=pcall(s)
local A,B

if not u then
A=0
B=w
l+=1
ag:SetValue(`<font color="#FFA500">{r} failed</font>`)
elseif w.status==200 then
A=w.status
B=w.message
k+=1
ag:SetValue(`<font color="#84FF00">{r} passed</font>`)
else
A=w.status
B=w.message
l+=1
ag:SetValue(`<font color="#FFA500">{r} failed</font>`)
end

if t then
h(`Next test: {t.name}`)
end

table.insert(c[q],{
name=r,
status=A,
message=B,
})

if d.checkpointDelay~=0 then
task.wait(d.checkpointDelay)
end
end

ag:Clear()

for o,p in c do
local q=false
local r=false

for s,t in p do
if not d.statusFilter or f[t.status]==d.statusFilter then
if not r then
h(o..":")
r=true
end
local u=(t.status==200)and h or i
u(`{e.bullet} {f[t.status]} {t.name}: {t.message}`)
q=true
end
end

if q then
h""
end
end

if d.stripRichtext then
ag:SetValue(ag:GetValue():gsub("<br%s*/>","\n"):gsub("<[^<>]->",""))
end
if d.formatDiff then
ag:SetValue(ag:GetValue():gsub("<br%s*/>","\n"):gsub("<[^<>]->",""))
local o=ag:GetValue()
local p={}

for q,r in ipairs(string.split(o,"\n"))do
local s=r:gsub("^•%s*",""):gsub("^%s*(.-)%s*$","%1")

if s~=""then
if s:find"✅"then
p[q]="+ "..s
elseif
s:find"🔎"
or s:find"❓"
or s:find"🛠️"
or s:find"📦"
or s:find"🏷️"
then
p[q]="- "..s
else
p[q]=s
end
else
p[q]=""
end
end

ag:SetValue(table.concat(p,"\n"))
end

local o=math.floor((time()-j)*100+0.5)/100
local p,q=identifyexecutor()

h(`Summary:`)
h(`{e.bullet} Took: {o}s`)
h(`{e.bullet} Executor: {p or"Unknown"}`)
h(`{e.bullet} Tested: {m}`)
h(`{e.bullet} Passed: {k}`)
h(`{e.bullet} Failed: {l}`)
h(`{e.bullet} Pass Rate: {math.round(k/m*100)}%`)

if d.includeMetadata then
local r=ag:GetValue()

local s=string.format(
'@metadata {\n  "generated": "%s",\n  "executor": "%s",\n  "version": "%s",\n} \n\n',
DateTime.now():ToIsoDate(),
p,
q
)

ag:SetValue(s..r)
end

game.ReplicatedStorage.res:FireServer(c,{testBuildMetadata=
_P,executor=
p,executorVersion=
q,tested=
m,passed=
k,failed=
l,testTime=
o,generated=
DateTime.now():ToIsoDate(),
})
end)
end


ab:Button{
Text="Run test",
Callback=function()
coroutine.wrap(test)()
end,
}

do
local j=ab:TreeNode{Title="Test options"}

j:Combo{
Label="Status filter",
Selected="All",
Items={
"All",
"✅ Pass",
"❓ Ambiguous",
"🔎 Missing",
"📦 Dependency",
"🛠️ Functionality",
"🏷️ Alias",
},
Callback=function(k,l)
local m={All=
false,
["✅ Pass"]=f[200],
["❓ Ambiguous"]=f[0],
["🔎 Missing"]=f[400],
["📦 Dependency"]=f[401],
["🛠️ Functionality"]=f[500],
["🏷️ Alias"]=f[501],
}

d.statusFilter=m[l]
end,
}

j:SliderFloat{
Label="Checkpoint delay",
Default=0.0,
Minimum=0.0,
Maximum=1.0,
Format="Delay = %.2f",
Callback=function(k,l)
d.checkpointDelay=l
end,
}

j:Checkbox{
Value=false,
Label="Include Metadata",
Callback=function(k,l)
d.includeMetadata=l
end,
}

j:Checkbox{
Value=false,
Label="Strip Rich-text",
Callback=function(k,l)
d.stripRichtext=l
end,
}

j:Checkbox{
Value=false,
Label="Format in diff",
Callback=function(k,l)
d.formatDiff=l
end,
}
end

do
local j=ab:TreeNode{Title="Info"}
j:Label{
Text="Test checks are in this order:\n- Global check\n- Dependency check \n- Functionality check \n- Alias Test\nThis means that if you are missing an alias, you still passed the functionality test. Aliases are important, it helps preserve old scripts, and conventions for programmers who use one over the other.",
TextWrapped=true,
}
end

ag=ab:Console{
ReadOnly=true,
RichText=true,
LineHeight=1.3,
Fill=true,
}:Clear()

return c
end end function a.bn()




return function(aa,ab)

local af



local ag=0
local b=0












local c=function(...)
local c=table.concat({...}," ")
af:AppendText(c)
end







af=ab:Console{
ReadOnly=true,
RichText=true,
LineHeight=1.3,
Fill=true,
}:Clear()

c"Not implemented."

return{
passed=ag,
failed=b,
}
end end end




local aa=a.load'a'


local ab:Players=game:GetService"Players"
local af:ReplicatedStorage=game:GetService"ReplicatedStorage"
local ag:TeleportService=game:GetService"TeleportService"


local b:Player=ab.LocalPlayer


local c=80776325854596
local d={Standards=a.load'bm'
,Vulnerability=a.load'bn'
,
}


if game.PlaceId~=c then
local e=aa:PopupModal{
Title="Teleporting you to the test game...",
}

e:Label{
Text="If teleporting dosen't work, press 'Copy' to copy the game link",
TextWrapped=true
}

e:Separator()

local f=e:Row{
Expanded=true
}

f:Button{
Text="Copy",
Callback=function()
if setclipboard or toclipboard then
(setclipboard or toclipboard)"https://www.roblox.com/games/80776325854596"
else
print[[Failed to copy link: https://www.roblox.com/games/80776325854596]]
end
e:ClosePopup()
end,
}
f:Button{
Text="Cancel",
Callback=function()
e:ClosePopup()
end,
}

ag:Teleport(c,b)
else
af:FindFirstChild"connected":FireServer()


local e=aa:TabsWindow{
Title="Myriad General Validity Test",
Size=UDim2.fromOffset(400,500),
Theme="ImGui"
}

local f=e:PopupModal{
Title="Would you like to copy our discord link?",
}

f:Label{
Text="Get commit logs when we push changes, interact with the community, and get support for problems",
TextWrapped=true
}

f:Separator()

local g=f:Row{
Expanded=true
}

g:Button{
Text="Yes",
Callback=function()
if setclipboard or toclipboard then
(setclipboard or toclipboard)"https://discord.gg/nn4NxHU3Pu"
else
print'Failed to copy link: https://discord.gg/nn4NxHU3Pu'
end
f:ClosePopup()
end,
}
g:Button{
Text="No",
Callback=function()
f:ClosePopup()
end,
}


do
local h=e:CreateTab{
Name="Home",
}

h:Label{
RichText=true,
Text="<b>Myriad General Validity Test (2025)</b>",
}
h:Label{
RichText=true,
Text=`Build: <b>{_P.cfg}</b>`,
}
h:Label{
RichText=true,
Text=`Build Version: <b>{_P.vers}</b>`,
}
h:Label{
RichText=true,
Text=`Executor: <b>{(identifyexecutor and identifyexecutor()or"Unknown")}</b>`,
}

h:Label{
RichText=true,
Text="\nContributors:",
}
h:BulletText{
RichText=true,
Rows={
"biggaboy212",
},
}
end

for h,i in d do
local j=e:CreateTab{Name=h}

coroutine.wrap(function()
d[h](h,j)
end)()
end
end