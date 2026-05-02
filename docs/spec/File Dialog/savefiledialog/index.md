# `savefiledialog`

Opens a dialog to choose a path to save to, then writes content to that path.
Blocks the calling thread until the dialog is dismissed.

## Signature

```luau
declare function savefiledialog(content: string, options: saveDialogOptions?): file?
```

## Extensions

- [`file`](../Types/file.md)
- [`saveDialogOptions`](../Types/saveDialogOptions.md)

## Summary

### Parameters

| Parameter | Type                   | Description                                |
| --------- | ---------------------- | ------------------------------------------ |
| `content` | `string`               | Content to write to the file.              |
| `options` | `saveDialogOptions?`   | Optional options for the save file dialog. |

### Returns

| Type    | Description                                           |
| ------- | ----------------------------------------------------- |
| `file?` | File object of the saved file, or `nil` if cancelled. |

## Examples

### Save config

```luau
print("Save your config")

local config = "{ aimbot = true }"
local configFile = savefiledialog(config, {
    extensionFilter = { "json" },
})

if configFile then
    print("Save success")
else
    print("Save cancelled")
end
```
