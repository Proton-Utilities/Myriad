# Changelog

## `STABLE` v1.2.3

```diff
+ [PR] #5 - Loadstring source chunk semantics
+ [PR] #6 - run_on_actor extra semantics
+ [PR] #7 - More rigorous clonefunction checking

+ Introduce new checks for actor communication channel creation, retrieval, and parallel execution.

! Fix `debug.getconstant` always passing with inconsistency. Incomplete check.
! `Websocket.connect` test to validate signals based on methods rather than type. This accounts for custom signal implementations.
! Make keytap main alias `keyclick` instead of `keytap`
! Fix `fireclickdetector`, `fireproximityprompt` and `firetouchinterest` returning a result in connections.
```

## `STABLE` v1.2.2

```diff
+ Add vulnerability test webresults support
+ Update webresults calls to latest format
```

## `STABLE` v1.2.1

```diff
+ Added vulnerability test
```

## `STABLE` v1.2.0

```diff
! MAJOR: Fixed crashes related to UI package "ReGui"
! Updated internal framework

+ Change UI Library to Cascade
+ Added global exclusions to standards test
```

## `STABLE` v1.1.0

```diff
+ Add `crypt.generatekey` unique-ness check
+ Added dex check to fix overwriting `decompile`
+ Add `base64encode` and `base64decode` empty string encoding and padding check

! Fixed incorrect hash to algorithm map in `crypt.hash`
! Made Regui less executor-dependant
! Let `debug.getproto` and `debug.getprotos` given protos be non-callable
! Unenforced `getconstant` and `getconstants` constant order
! Fixed `gethiddenproperty` and `sethiddenproperty` checking for a returned lua state on writeonly properties instead of returning `nil`
```

## `STABLE` v1.0.3

```diff
! Update outdated webscoket reference (i#3774060932)
! Fix UI library icon issues
! Move gh key to dotenv, releasing the .pcmp config
! Move standard definitions out of the lua entrypoint

+ Add keytap alias "keyclick"
```

## `STABLE` v1.0.2

```diff
! Backend changes
! Fixed the status message returned by sethiddenproperty when `gethiddenproperty` is missing
```

> [!NOTE]
> There might be other changes I missed because it's been a while since I worked on this, and this release is based on uncommitted changes

## `STABLE` v1.0.1

- Added touch/ended order checking for firetouchinterest
- Added more build info to home page of UI

## `STABLE` v1.0.0

- Moved to github releases (old dist.luau loadstring redirects to the latest release)
- debug getconstants fix (not completely validated, dont take this for certain)
- setrawmetatable originalobject check removed
- fix build metadata

## `PRE-RELEASE` v1.0.0-beta.3

- debug getconstants fix

## `PRE-RELEASE` v1.0.0-beta.2

- new build system (ProCMP)
- fix set raw mt shit
- updated regui: 1.4.2 - > 1.4.3
- setfpscap format
