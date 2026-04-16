# `InputCapture.new`

[`InputListener`]: ./InputListener.md
[`InputDescriptor`]: ../InputDescriptor.md

Creates a new [`InputListener`].

## Signature

```luau
function new(
    trigger: InputCaptureTrigger?, -- A specific input to use. If none is provided, it will listen for any input.
    options: InputCaptureOptions?
): InputListener
```

### Types

[`InputDescriptor`]

```luau
type InputCaptureTrigger = InputDescriptor
type InputCaptureOptions = {
    sink: boolean?, -- This will sink the other inputs from the same input in the game (Can be done via ContextActionService) | default: false
    assert: boolean | (): boolean | { boolean | (): boolean }? -- List of conditions that have to be true for the signal to fire
}
```

## Summary

### Parameters

| Parameter | Type                   | Description                              |
| --------- | ---------------------- | ---------------------------------------- |
| `trigger` | `InputCaptureTrigger`  | The input to listen for.                 |
| `options` | `InputCaptureOptions?` | Optional options for the input listener. |

## Examples

### Basic keybind

```lua
local listener = InputCapture.new()

listener.Captured:Connect(function(input: InputDescriptor)
    if input == InputCapture.Mouse.Left or input == InputCapture.Mouse.Right then
        listener:Release()
    end
end)
```
