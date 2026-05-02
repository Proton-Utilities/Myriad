# `saveDialogOptions`

[`fileDialogOptions`]: ./fileDialogOptions.md

Options for save file dialogs.

## Summary

```luau
type saveDialogOptions = fileDialogOptions & {
    suggestedName: string?, -- Pre-filled filename in the dialog's name field
    defaultExtension: string?, -- Appended automatically if no extension was given (e.g. "json")
}
```

### Extensions

- [`fileDialogOptions`]
