# `openfiledialog`

[`file`]: ../Types/file.md
[`fileDialogOptions`]: ../Types/fileDialogOptions.md

Opens a dialog to select a file.
Blocks the calling thread until the dialog is dismissed.

## Signature

```luau
declare function openfiledialog(options: fileDialogOptions?): file?
```

## Extensions

- [`file`]
- [`fileDialogOptions`]

## Summary

### Parameters

| Parameter | Type                   | Description                           |
| --------- | ---------------------- | ------------------------------------- |
| `options` | `fileDialogOptions?`   | Optional options for the file dialog. |

### Returns

| Type    | Description                                  |
| ------- | -------------------------------------------- |
| `file?` | File object, or `nil` if the user cancelled. |

## Examples

### Config system

```luau
print("Pick a config to use")

local config
local configFile = openfiledialog({
    extensionFilter = { "json" },
})

if configFile then
    config = configFile:Read()
else
    print("No config selected.")
end
```
