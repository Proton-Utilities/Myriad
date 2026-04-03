# Changelog

## Unmarked (Target: v1.6.0)

- Added a small declaration to the main window subtitle
- Corrected some button states, since almost everything used `Primary`, fighting for visual attention.
- Keybinds are editable now
- Added a window setting to disable `WindowPill`
- Myriad will clean up previous instances of itself, if `getgenv` is supported
- Added a Myriad API
- Added Myriad docs

## `STABLE` v1.5.4

- Test settings now use a seperate view and sub-tab
- Added an `Includes` option to the `Standards` test
- Added parent traversal tests to the `Vulnerabilities` test
- Added a `restorefunction` check for upvalue preservation
- The counters for the Test status now count in real time instead of only updating on each check's completion.
- The console in each test is hidden until the test is completed, it looked like a big black box with no output in it.

## `STABLE` v1.5.3

- Fixed an issue with keybinds related to multi-stroke binds.
- `KeybindLabel` component is used instead of crafting them primitively
- We now use a custom `TestingState` component instead of using the console.
- Fixed some inconsistency between the standards and vulnerabilities test.
- Added a `testTimeout` setting to the tests.

## `STABLE` v1.5.2

- Added `Window` settings tab
- Added keybinds to each test
- Made the test scroll to the console to focus the output whenever a test is ran. (Also focuses the tab if it wasn't already.)

## `STABLE` `HOTFIX` v1.5.1

- Removed the nested check for `appendfile`. Mirror `fopen` instead and don't make the path since its not a create related function, only writes to existing files.
- Fixed `cloneref` test contaminating `getnilinstances`
- Added some dependency checks for said functions.

## `STABLE` v1.5.0

- New `Manual` framework for the `Standards` tests. (#19)
- Add FileDialog Tests (#18)
- Updated package `Cascade` v1.0.1-beta -> v1.2.0
- Use proper type checking
- Notify user that the link was copied to their clipboard if their not in the main testing game
- Link the docs for file dialog functions
- Reduce executor dependance
- Check the actual test results for filesystem dependency in the `getcustomasset` test instead of just doing a global check
- `Filesystem` related tests now check for file nesting compatability.
- `getcustomasset` now checks for: PNG, JPG, MP3, OGG, WEBM, MP4, OBJ, and TTF files.
- `WebSocket.connect` now checks the `is_binary` parameter, and checks if sent data in general is recieved.

## `PRE-RELEASE` v1.5.0-beta.1

- New `Manual` framework for the `Standards` tests. (#19)
- Add FileDialog Tests (#18)
- Updated package `Cascade` v1.0.1-beta -> v1.2.0

## `STABLE` `HOTFIX` v1.4.4

```diff
! Updated the testing gameid to our new one.
```

## `STABLE` `HOTFIX` v1.4.3

```diff
! Fixed not being able to publish results due to per-test time not being included.
```

## `STABLE` v1.4.2

```diff
! Rework backend
```

## `STABLE` `HOTFIX` v1.4.1

```diff
! Fix actor location
```

## `STABLE` v1.4.0

```diff
+ New `getsenv` checks. Now the ENV of a dead script and an ENV whose `.script` property is nil are tested
+ New `sethiddenproperty` checks. It checks whether the property actually changed or was just a memory edit with no effect on the game
+ New `gethiddenproperty` check. A property that dynamically changes with another value has been added 
+ New `setrawmetatable` checks. Strings are used to make the test more difficult to fake, and a property is added that setmetatable normal cannot set
+ New `hookmetamethod` checks. It checks in a table and verifies whether it makes a hook or just tries to replace the function
+ New `getrawmetatable` checks. It checks whether an error occurs when attempting to obtain the functions, whether the tables change, and whether the __index matches
+ New `compareinstances` checks. It checks if the same object is equal and returns an error if it does not pass 2 instances
+ New `newcclosure` checks. It checks whether it supports putting a name as the second argument, yielding, wrapping it 198 times, seeing if it cuts arguments or returns, and whether it can be executed 5 times and give the correct arguments
+ New `get_comm_channel` checks. It checks whether there is an error with a comm_id number that does not exist
+ New `create_comm_channel` checks. It checks whether they have all the necessary methods, whether comm_id has decimals, and whether get_comm_channel returns the same eventObject
+ Added `require` to the standard.
+ Added `getreg` to the standard.
+ Added new executor vulnerabilities module.
+ Added file access vulnerability (`file://` protocol bypass) check to `request`, `http_request`, `http.request`, `HttpGet`, `HttpGetAsync`, and `game` methods.
+ Added `OmniRecommendationsService` and `HttpRbxApiService` to the Services blocklist tests.
+ Refactored vulnerabilities testing suite to match the standard suite's logging format.
+ Extracted Auth Leak testing to a dedicated `leaks` module in the vulnerability testing suite.
+ Created an `escapes` vulnerabilities module and added an Environment/Context Escape test using `clonefunction` and `hookmetamethod`.

! Fix `run_on_actor` not conversion of xrefs
! Fix getconstant out of bounds index check
! Fix Drawing library not checking alpha conversion properly in the ScreenGui based lib check.
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
