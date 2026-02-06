-- Base Types

export type Instance = {
	Name: string?,
	Parent: Instance?,
	Archivable: boolean?,
	ClassName: string?,

	Clone: ((self: Instance) -> Instance)?,
	Destroy: ((self: Instance) -> ())?,
	FindFirstAncestor: ((self: Instance, name: string) -> Instance?)?,
	FindFirstAncestorWhichIsA: ((self: Instance, className: string) -> Instance?)?,
	FindFirstAncestorOfClass: ((self: Instance, className: string) -> Instance?)?,
	FindFirstChild: ((self: Instance, name: string, recursive: boolean?) -> Instance?)?,
	FindFirstChildWhichIsA: ((self: Instance, className: string, recursive: boolean?) -> Instance?)?,
	FindFirstChildOfClass: ((self: Instance, className: string, recursive: boolean?) -> Instance?)?,
	GetAttribute: ((self: Instance, attribute: string) -> any)?,
	GetAttributes: ((self: Instance) -> { [string]: any })?,
	GetChildren: ((self: Instance) -> { Instance })?,
	GetDescendants: ((self: Instance) -> { Instance })?,
	HasTag: ((self: Instance, tag: string) -> boolean)?,
	IsA: ((self: Instance, className: string) -> boolean)?,
	IsAncestorOf: ((self: Instance, descendant: Instance) -> boolean)?,
	IsDescendantOf: ((self: Instance, ancestor: Instance) -> boolean)?,
	WaitForChild: ((self: Instance, childName: string, timeOut: number?) -> Instance)?,

	AncestryChanged: ((self: Instance, handler: (child: Instance, parent: Instance?) -> ()) -> RBXScriptConnection)?,
	AttributeChanged: ((self: Instance, handler: (attribute: string) -> ()) -> RBXScriptConnection)?,
	ChildAdded: ((self: Instance, handler: (child: Instance) -> ()) -> RBXScriptConnection)?,
	ChildRemoved: ((self: Instance, handler: (child: Instance) -> ()) -> RBXScriptConnection)?,
	DescendantAdded: ((self: Instance, handler: (descendant: Instance) -> ()) -> RBXScriptConnection)?,
	DescendantRemoving: ((self: Instance, handler: (descendant: Instance) -> ()) -> RBXScriptConnection)?,
	Destroying: ((self: Instance, handler: () -> ()) -> RBXScriptConnection)?,
	PropertyChanged: ((self: Instance, property: string) -> RBXScriptConnection)?,
}

export type GuiBase2d = Instance & {
	AutoLocalize: boolean?,
	RootLocalizationTable: LocalizationTable?,
	SelectionBehaviorDown: Enum.SelectionBehavior?,
	SelectionBehaviorLeft: Enum.SelectionBehavior?,
	SelectionBehaviorRight: Enum.SelectionBehavior?,
	SelectionBehaviorUp: Enum.SelectionBehavior?,
	SelectionGroup: boolean?,
}

export type LayerCollector = GuiBase2d & {
	Enabled: boolean?,
	ResetOnSpawn: boolean?,
	ZIndexBehavior: Enum.ZIndexBehavior?,
}

export type GuiObject = GuiBase2d & {
	AnchorPoint: Vector2?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	BorderColor3: Color3?,
	BorderMode: Enum.BorderMode?,
	BorderSizePixel: number?,
	ClipsDescendants: boolean?,
	LayoutOrder: number?,
	Position: UDim2?,
	Rotation: number?,
	Selectable: boolean?,
	SelectionImageObject: GuiObject?,
	Size: UDim2?,
	SizeConstraint: Enum.SizeConstraint?,
	Visible: boolean?,
	ZIndex: number?,
	AutomaticSize: Enum.AutomaticSize?,
}

export type ScreenGui = LayerCollector & {
	DisplayOrder: number?,
	IgnoreGuiInset: boolean?,
	ScreenInsets: Enum.ScreenInsets?,
	ClipToDeviceSafeArea: boolean?,
	SafeAreaCompatibility: Enum.SafeAreaCompatibility?,
}

export type Frame = GuiObject & {
	Style: Enum.FrameStyle?,
}

export type TextLabel = GuiObject & {
	FontFace: Font?,
	LineHeight: number?,
	MaxVisibleGraphemes: number?,
	OpenTypeFeatures: string?,
	RichText: boolean?,
	Text: string?,
	TextColor3: Color3?,
	TextDirection: Enum.TextDirection?,
	TextScaled: boolean?,
	TextSize: number?,
	TextStrokeColor3: Color3?,
	TextStrokeTransparency: number?,
	TextTransparency: number?,
	TextTruncate: Enum.TextTruncate?,
	TextWrapped: boolean?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
}

export type TextBox = GuiObject & {
	ClearTextOnFocus: boolean?,
	CursorPosition: number?,
	MultiLine: boolean?,
	ShowNativeInput: boolean?,
	TextEditable: boolean?,
	ContentText: string?,
	FontFace: Font?,
	LineHeight: number?,
	MaxVisibleGraphemes: number?,
	OpenTypeFeatures: string?,
	OpenTypeFeaturesError: string?,
	PlaceholderColor3: Color3?,
	PlaceholderText: string?,
	RichText: boolean?,
	Text: string?,
	TextBounds: Vector2?,
	TextColor3: Color3?,
	TextDirection: Enum.TextDirection?,
	TextFits: boolean?,
	TextScaled: boolean?,
	TextSize: number?,
	TextStrokeColor3: Color3?,
	TextStrokeTransparency: number?,
	TextTransparency: number?,
	TextTruncate: Enum.TextTruncate?,
	TextWrapped: boolean?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
	SelectionStart: number?,

	CaptureFocus: ((self: TextBox) -> ())?,
	IsFocused: ((self: TextBox) -> boolean)?,
	ReleaseFocus: ((self: TextBox, submitted: boolean?) -> ())?,

	Focused: ((self: TextBox, handler: () -> ()) -> RBXScriptConnection)?,
	FocusLost: ((
		self: TextBox,
		handler: (enterPressed: boolean, inputThatCausedFocusLoss: InputObject) -> ()
	) -> RBXScriptConnection)?,
	ReturnPressedFromOnScreenKeyboard: ((self: TextBox, handler: () -> ()) -> RBXScriptConnection)?,
}

export type ImageLabel = GuiObject & {
	Image: string?,
	ImageColor3: Color3?,
	ImageContent: string?,
	ImageRectOffset: Vector2?,
	ImageRectSize: Vector2?,
	ImageTransparency: number?,
	IsLoaded: boolean?,
	ResampleMode: Enum.ResamplerMode?,
	ScaleType: Enum.ScaleType?,
	SliceCenter: Rect?,
	SliceScale: number?,
	TileSize: UDim2?,
}

export type GuiButton = GuiObject & {
	AutoButtonColor: boolean?,
	Modal: boolean?,
	Style: Enum.ButtonStyle?,
	HoverHapticEffect: HapticEffect?,
	PressHapticEffect: HapticEffect?,
	Selected: boolean?,

	Activated: (
		(self: GuiButton, handler: (inputObject: InputObject, clickCount: number) -> ()) -> RBXScriptConnection
	)?,
	MouseButton1Click: ((self: GuiButton, handler: () -> ()) -> RBXScriptConnection)?,
	MouseButton1Down: ((self: GuiButton, handler: (x: number, y: number) -> ()) -> RBXScriptConnection)?,
	MouseButton1Up: ((self: GuiButton, handler: (x: number, y: number) -> ()) -> RBXScriptConnection)?,
	MouseButton2Click: ((self: GuiButton, handler: () -> ()) -> RBXScriptConnection)?,
	MouseButton2Down: ((self: GuiButton, handler: (x: number, y: number) -> ()) -> RBXScriptConnection)?,
	MouseButton2Up: ((self: GuiButton, handler: (x: number, y: number) -> ()) -> RBXScriptConnection)?,
}

export type TextButton = GuiButton & {
	FontFace: Font?,
	LineHeight: number?,
	MaxVisibleGraphemes: number?,
	OpenTypeFeatures: string?,
	RichText: boolean?,
	Text: string?,
	TextColor3: Color3?,
	TextDirection: Enum.TextDirection?,
	TextScaled: boolean?,
	TextSize: number?,
	TextStrokeColor3: Color3?,
	TextStrokeTransparency: number?,
	TextTransparency: number?,
	TextTruncate: Enum.TextTruncate?,
	TextWrapped: boolean?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,

	SetTextFromInput: ((self: TextButton, text: string) -> ())?,
}

export type ValueState = {
	Value: any,
	Connect: (...any) -> any,
}

export type Theme = { [any]: any } -- TODO

--// Components
export type BaseComponent = {
	Type: string,
	Theme: Theme,
	Structures: { [string]: Instance | { any } },
}

-- App
export type AppProperties = ScreenGui & {
	WindowPill: boolean?,
	Theme: Theme?,
}

export type App = AppProperties & Components

-- Window
export type WindowProperties = Frame & {
	Searching: boolean?,
	Draggable: boolean?,
	Resizable: boolean?,
	Title: string?,
	Subtitle: string?,
	Maximized: boolean?,
	Minimized: boolean?,

	Dropshadow: boolean?,
	UIBlur: boolean?,
}

export type Window = BaseComponent & Components & WindowProperties

-- Section
export type SectionProperties = Frame & {
	Title: string?,
	Disclosure: boolean?,
	Expanded: boolean?,
}

export type Section = BaseComponent & Components & SectionProperties

-- Tab
export type TabProperties = Frame & {
	Title: string?,
	Icon: string?,
	Indentation: number?,
	Selected: boolean?,
}

export type Tab = BaseComponent & Components & TabProperties

-- Form
export type FormProperties = Frame
export type Form = BaseComponent & Components & FormProperties

-- Row
export type RowProperties = Frame & {
	SearchIndex: string?,
}

export type Row = BaseComponent & Components & RowProperties & {
	Left: (self: Row) -> Row,
	Right: (self: Row) -> Row,
}

-- Stack
export type StackProperties = Frame & {
	Padding: UDim?,
	HorizontalAlignment: Enum.HorizontalAlignment?,
	VerticalAlignment: Enum.VerticalAlignment?,
}

export type Stack = BaseComponent & Components & StackProperties

-- TitleStack
export type TitleStackProperties = Frame & {
	Title: string?,
	Subtitle: string?,
}

export type TitleStack = BaseComponent & Components & TitleStackProperties

-- PageSection
export type PageSectionProperties = Frame & {
	Title: string?,
	Subtitle: string?,
}

export type PageSection = BaseComponent & Components & PageSectionProperties

-- Label
export type LabelProperties = TextLabel
export type Label = BaseComponent & Components & LabelProperties

-- Symbol
export type SymbolProperties = ImageLabel & {
	Style: ("Primary" | "Secondary")?,
}

export type Symbol = BaseComponent & Components & SymbolProperties

-- Toggle
export type ToggleProperties = Frame & {
	Value: boolean?,
	ValueChanged: ((self: Toggle, value: boolean) -> unknown)?,
}

export type Toggle = BaseComponent & Components & ToggleProperties

-- TextField
export type TextFieldProperties = Frame & {
	Placeholder: string?,
	Value: string?,
	TextChanged: ((self: TextField, text: string) -> unknown)?,
	ValueChanged: ((self: TextField, value: string) -> unknown)?,
}

export type TextField = BaseComponent & Components & TextFieldProperties

-- KeybindField
export type KeybindFieldProperties = Frame & {
	Placeholder: string?,
	Value: Enum.KeyCode?,
	BindPressed: ((
		self: KeybindField,
		value: Enum.KeyCode,
		inputComplete: boolean,
		gameProcessedEvent: boolean
	) -> unknown)?,
	ValueChanged: ((self: KeybindField, value: Enum.KeyCode) -> unknown)?,
}

export type KeybindField = BaseComponent & Components & KeybindFieldProperties

-- Slider
export type SliderProperties = ImageLabel & {
	Minimum: number?,
	Maximum: number?,
	Value: number?,
	ValueChanged: ((self: Slider, value: number) -> unknown)?,
}

export type Slider = BaseComponent & Components & SliderProperties

-- Button
export type ButtonProperties = TextButton & {
	State: ("Primary" | "Secondary" | "Destructive")?,
	Label: string?,
	Pushed: ((self: Button) -> unknown)?,
}

export type Button = BaseComponent & Components & ButtonProperties

-- Stepper
export type StepperProperties = ImageLabel & {
	Minimum: number?,
	Maximum: number?,
	Step: number?,
	Fielded: boolean?,
	Value: number?,
	ValueChanged: ((self: Stepper, value: number) -> unknown)?,
}

export type Stepper = BaseComponent & Components & StepperProperties & {
	Increment: () -> nil,
	Decrement: () -> nil,
}

-- RadioButtonGroup
export type RadioButtonGroupProperties = Frame & {
	Options: { [number]: string }?,
	Value: number?,
	ValueChanged: ((self: RadioButtonGroup, value: number) -> unknown)?,
}

export type RadioButtonGroup = BaseComponent & Components & RadioButtonGroupProperties & {
	Option: (Name: string?) -> Frame,
}

-- PopUpButton
export type PopUpButtonProperties = Frame & {
	Options: { [number]: string }?,
	Expanded: boolean?,
	Maximum: number?,
	Value: (number | { number })?,
	ValueChanged: ((self: PopUpButton, value: number | { number }) -> unknown)?,
}

export type PopUpButton = BaseComponent & Components & PopUpButtonProperties & {
	Option: (Name: string?) -> Frame,
	Remove: (Index: number?) -> nil,
}

-- PullDownButton
export type PullDownButtonProperties = Frame & {
	Options: { [number]: string }?,
	Expanded: boolean?,
	Label: string?,
	Value: number?,
	ValueChanged: ((self: PullDownButton, value: number) -> unknown)?,
}

export type PullDownButton = BaseComponent & Components & PullDownButtonProperties & {
	Option: (Name: string?) -> Frame,
	Remove: (Index: number?) -> nil,
}

-- Export
export type Components = {
	Window: (self: any, properties: WindowProperties?) -> Window,
	Section: (self: any, properties: SectionProperties?) -> Section,
	Tab: (self: any, properties: TabProperties?) -> Tab,
	Form: (self: any, properties: FormProperties?) -> Form,
	Row: (self: any, properties: RowProperties?) -> Row,
	VStack: (self: any, properties: StackProperties?) -> Stack,
	HStack: (self: any, properties: StackProperties?) -> Stack,
	TitleStack: (self: any, properties: TitleStackProperties?) -> TitleStack,
	PageSection: (self: any, properties: PageSectionProperties?) -> PageSection,
	Label: (self: any, properties: LabelProperties) -> Label,
	Symbol: (self: any, properties: SymbolProperties) -> Symbol,
	Toggle: (self: any, properties: ToggleProperties) -> Toggle,
	TextField: (self: any, properties: TextFieldProperties) -> TextField,
	KeybindField: (self: any, properties: KeybindFieldProperties) -> KeybindField,
	Slider: (self: any, properties: SliderProperties) -> Slider,
	Button: (self: any, properties: ButtonProperties) -> Button,
	Stepper: (self: any, properties: StepperProperties) -> Stepper,
	RadioButtonGroup: (self: any, properties: RadioButtonGroupProperties) -> RadioButtonGroup,
	PopUpButton: (self: any, properties: PopUpButtonProperties) -> PopUpButton,
	PullDownButton: (self: any, properties: PullDownButtonProperties) -> PullDownButton,
}

return 1