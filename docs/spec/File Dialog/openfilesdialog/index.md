# `openfilesdialog`

[`file`]: ../Types/file.md
[`fileDialogOptions`]: ../Types/fileDialogOptions.md

Opens a dialog to select multiple files.
Blocks the calling thread until the dialog is dismissed.

## Signature

```luau
declare function openfilesdialog(options: fileDialogOptions?): {file}?
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

| Type      | Description                                            |
| --------- | ------------------------------------------------------ |
| `{file}?` | Array of file objects, or `nil` if the user cancelled. |
