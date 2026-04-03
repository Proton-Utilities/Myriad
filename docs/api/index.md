# API

This section provides information on using Myriad's API.

## Getting the API

```luau
local API = loadstring(game:HttpGetAsync("https://github.com/Proton-Utilities/Myriad/releases/latest/download/api.luau"))()
```

## Metadata

| Field       | Type     | Description                |
| ----------- | -------- | -------------------------- |
| `Version`   | `string` | The version of the API.    |
| `Target`    | `string` | The target of the API.     |
| `BuildDate` | `string` | The build date of the API. |

```luau
print(API.Version)
print(API.Target)
print(API.BuildDate)
```
