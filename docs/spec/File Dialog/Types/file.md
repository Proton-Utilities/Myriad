# `file`

A file returned from a dialog.

## Summary

```luau
type file = item & {
    Read: (self: file) -> string,
    Write: (self: file, content: string) -> (),
    Append: (self: file, content: string) -> (),
}
```

### Extensions

- [`item`](./item.md)
