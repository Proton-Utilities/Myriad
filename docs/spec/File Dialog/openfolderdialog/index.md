# `openfolderdialog`

[`folder`]: ../Types/folder.md
[`dialogOptions`]: ../Types/dialogOptions.md

Opens a dialog to select a folder.
Blocks the calling thread until the dialog is dismissed.

## Signature

```luau
declare function openfolderdialog(options: dialogOptions?): folder?
```

## Extensions

- [`folder`]
- [`dialogOptions`]

## Summary

### Parameters

| Parameter | Type               | Description                           |
| --------- | ------------------ | ------------------------------------- |
| `options` | `dialogOptions?`   | Optional options for the dialog.      |

### Returns

| Type      | Description                                    |
| --------- | ---------------------------------------------- |
| `folder?` | Folder object, or `nil` if the user cancelled. |
