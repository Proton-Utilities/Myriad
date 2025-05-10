export type DrawingBase = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: DrawingBase) -> (),
}
export type DrawingBaseData = {
    Visible: boolean?,
    ZIndex: number?,
    Transparency: number?,
    Color: Color3?,
}

export type DrawingLine = DrawingBase & {
    Thickness: number,
    From: Vector2,
    To: Vector2,
}
export type DrawingLineData = DrawingBaseData & {
    Thickness: number?,
    From: Vector2?,
    To: Vector2?,
}

export type DrawingText = DrawingBase & {
    Text: string,
    Size: number,
    Center: boolean,
    Outline: boolean,
    OutlineColor: Color3,
    Position: Vector2,
    TextBounds: Vector2, --readonly
}
export type DrawingTextData = DrawingBaseData & {
    Text: string?,
    Size: number?,
    Center: boolean?,
    Outline: boolean?,
    OutlineColor: Color3?,
    Position: Vector2?,
}

export type DrawingImage = DrawingBase & {
    Data: string, --writeonly
    Size: Vector2,
    Position: Vector2,
    Rounding: number,   
}
export type DrawingImageData = DrawingBaseData & {
    Data: string?,
    Size: Vector2?,
    Position: Vector2?,
    Rounding: number?,
}

export type DrawingCircle = DrawingBase & {
    Thickness: number,
    NumSides: number,
    Radius: number,
    Filled: boolean,
    Position: Vector2,
}
export type DrawingCircleData = DrawingBaseData & {
    Thickness: number?,
    NumSides: number?,
    Radius: number?,
    Filled: boolean?,
    Position: Vector2?,
}

export type DrawingSquare = DrawingBase & {
    Thickness: number,
    Size: Vector2,
    Position: Vector2,
    Filled: boolean,
}
export type DrawingSquareData = DrawingBaseData & {
    Thickness: number?,
    Size: Vector2?,
    Position: Vector2?,
    Filled: boolean?,
}

export type DrawingQuad = DrawingBase & {
    Thickness: number,
    PointA: Vector2,
    PointB: Vector2,
    PointC: Vector2,
    PointD: Vector2,
    Filled: boolean,
}
export type DrawingQuadData = DrawingBaseData & {
    Thickness: number?,
    PointA: Vector2?,
    PointB: Vector2?,
    PointC: Vector2?,
    PointD: Vector2?,
    Filled: boolean?,
}

export type DrawingTriangle = DrawingBase & {
    Thickness: number,
    PointA: Vector2,
    PointB: Vector2,
    PointC: Vector2,
    Filled: boolean,
}
export type DrawingTriangleData = DrawingBaseData & {
    Thickness: number?,
    PointA: Vector2?,
    PointB: Vector2?,
    PointC: Vector2?,
    Filled: boolean?,
}

export type DrawingFonts = {
    UI: number,
    System: number,
    Plex: number,
    Monospace: number,
}
export type DrawingFontsData = {
    UI: number?,
    System: number?,
    Plex: number?,
    Monospace: number?,
}

export type DrawingNewTypes = "Line" | "Text" | "Image" | "Circle" | "Square" | "Quad" | "Triangle"
export type DrawingObject = DrawingLine | DrawingText | DrawingImage | DrawingCircle | DrawingSquare | DrawingQuad | DrawingTriangle
export type DrawingObjectData = DrawingLineData | DrawingTextData | DrawingImageData | DrawingCircleData | DrawingSquareData | DrawingQuadData | DrawingTriangleData

export type DrawingNewFunction =
    (("Line") -> DrawingLine)
    & (("Text") -> DrawingText)
    & (("Image") -> DrawingImage)
    & (("Circle") -> DrawingCircle)
    & (("Square") -> DrawingSquare)
    & (("Quad") -> DrawingQuad)
    & (("Triangle") -> DrawingTriangle)
export type DrawingNewWithPropsFunction =
    (("Line", DrawingLineData?) -> DrawingLine)
    & (("Text", DrawingTextData?) -> DrawingText)
    & (("Image", DrawingImageData?) -> DrawingImage)
    & (("Circle", DrawingCircleData?) -> DrawingCircle)
    & (("Square", DrawingSquareData?) -> DrawingSquare)
    & (("Quad", DrawingQuadData?) -> DrawingQuad)
    & (("Triangle", DrawingTriangleData?) -> DrawingTriangle)
export type DrawingSetPropertiesFunction =
    ((DrawingLine, DrawingLineData) -> DrawingLine)
    & ((DrawingText, DrawingTextData) -> DrawingText)
    & ((DrawingImage, DrawingImageData) -> DrawingImage)
    & ((DrawingCircle, DrawingCircleData) -> DrawingCircle)
    & ((DrawingSquare, DrawingSquareData) -> DrawingSquare)
    & ((DrawingQuad, DrawingQuadData) -> DrawingQuad)   
    & ((DrawingTriangle, DrawingTriangleData) -> DrawingTriangle)

export type Drawing = {
    Fonts: DrawingFonts,
    new: DrawingNewFunction
}
declare Drawing: Drawing