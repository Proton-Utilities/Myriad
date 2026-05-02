# `item`

Shared item functions.

## Summary

```luau
type item = {
    GetName: (self: item) -> string,
    IsFile: (self: item) -> boolean,
    IsFolder: (self: item) -> boolean,
    Delete: (self: item) -> (),
}
```
