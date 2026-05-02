# `folder`

A folder returned from a dialog.

## Summary

```luau
type folder = item & {
    List: (self: folder, recursive: boolean?) -> {dialogItem},
    MakeFolder: (self: folder, name: string) -> folder,
}
```

### Extensions

- [`item`](./item.md)
- [`dialogItem`](./dialogItem.md)
