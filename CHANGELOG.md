# Changelog

## `UNMARKED`

```diff
+ New `setsenv` checks. Now the ENV of a dead script and an ENV whose `.script` property is nil are tested
+ New `sethiddenproperty` checks. It checks whether the property actually changed or was just a memory edit with no effect on the game
+ New `gethiddenproperty` check. A property that dynamically changes with another value has been added 
+ New `setrawmetatable` checks. Strings are used to make the test more difficult to fake, and a property is added that setmetatable normal cannot set
+ New `hookmetamethod` checks. It checks in a table and verifies whether it makes a hook or just tries to replace the function
+ New `getrawmetatable` checks. It checks whether an error occurs when attempting to obtain the functions, whether the tables change, and whether the __index matches
+ New `compareinstances` checks. It checks if the same object is equal and returns an error if it does not pass 2 instances
+ New `newcclosure` checks. It checks whether it supports putting a name as the second argument, yielding, wrapping it 198 times, seeing if it cuts arguments or returns, and whether it can be executed 5 times and give the correct arguments
+ New `get_comm_channel` checks. It checks whether there is an error with a comm_id number that does not exist
+ New `create_comm_channel` checks. It checks whether they have all the necessary methods, whether comm_id has decimals, and whether get_comm_channel returns the same eventObject

! Fix `run_on_actor` not conversion of xrefs
! Fix getconstant out of bounds index check
```

## `STABLE` v1.3.3

```diff
+ New `debug.getproto` checks

! Fix getnilinstances not checking for IsDescendantOf
! Fix getproto problems caused by internal lua setfenv behavior

- Remove .IsLoaded check for `getcustomasset`
```

## `STABLE` `HOTFIX` v1.3.2

``` diff
! Fix cloneref making a new table per __index invocation
```

## `STABLE` `HOTFIX` v1.3.1

```diff
! New `run_on_actor` checks
! Removed IsLoaded check for `getcustomasset`
! DEPRECATED: `setfflag`, `getfflag`
```

## `STABLE` v1.3.0

```diff
+ Added native signal library test (Signal.new)
+ Added cansignalreplicate
+ Added firesignal
+ Added getconnections
+ Added getsignalarguments
+ Added getsignalargumentsinfo
+ Added getsignalwhitelist
+ Added replicatesignal

! Fixed run_on_actor xrefs check
```

## `STABLE` `HOTFIX` v1.2.5

- Fixed Set/Get fflag tests don't return any status

## `STABLE` v1.2.4

```diff
+ getcustomasset
+ isfunctionhooked
+ get/setfflag
+ setsimulationradius
+ clearqueueonteleport

! Enforcing run_on_actor same reference to a global object
! getscripthash overwriting source, which: autofails next run, dosen't logically work since scripts are compiled.
! make main qot alias queueonteleport
```

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
