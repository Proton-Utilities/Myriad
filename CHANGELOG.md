<!-- markdownlint-disable MD024 -->
# Changelog

[1.6.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.6.1...v1.6.2
[1.6.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.6.0...v1.6.1
[1.6.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.4...v1.6.0
[1.5.4]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.3...v1.5.4
[1.5.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.2...v1.5.3
[1.5.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.1...v1.5.2
[1.5.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.0...v1.5.1
[1.5.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.5.0-beta.1...v1.5.0
[1.5.0-beta.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.4.4...v1.5.0-beta.1
[1.4.4]: https://github.com/Proton-Utilities/Myriad/compare/v1.4.3...v1.4.4
[1.4.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.4.2...v1.4.3
[1.4.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.3.3...v1.4.0
[1.3.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.3.2...v1.3.3
[1.3.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.3.1...v1.3.2
[1.3.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.5...v1.3.0
[1.2.5]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.4...v1.2.5
[1.2.4]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.3...v1.2.4
[1.2.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.3...v1.1.0
[1.0.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.0-beta.3...v1.0.0
[1.0.0-beta.3]: https://github.com/Proton-Utilities/Myriad/compare/v1.0.0-beta.2...v1.0.0-beta.3
[1.0.0-beta.2]: https://github.com/Proton-Utilities/Myriad/releases/tag/v1.0.0-beta.2

## [1.6.2] - `STABLE`

### Added

- Home section with a changelog tab

## [1.6.1] - `STABLE` `HOTFIX`

### Fixed

- Fixed an issue where Myriad's cleanup function would toggle between each execution, requiring double execution to re-execute

## [1.6.0] - `STABLE`

### Added

- Small declaration to the main window subtitle
- Editable keybinds
- Window setting to disable `WindowPill`
- Myriad cleanup of previous instances (if `getgenv` is supported)
- Myriad API
- Myriad docs

### Changed

- Corrected button states to reduce visual conflict (reduced `Primary` usage)

## [1.5.4] - `STABLE`

### Added

- `Includes` option to the `Standards` test
- Parent traversal tests to the `Vulnerabilities` test
- `restorefunction` check for upvalue preservation
- Separate view and sub-tab for test settings

### Changed

- Test counters now count in real time instead of only updating on check completion
- Console in each test is now hidden until test completion

## [1.5.3] - `STABLE`

### Added

- Custom `TestingState` component for test output

### Changed

- Use `KeybindLabel` component instead of primitive construction
- `keydown` handling improved for multi-stroke binds

### Fixed

- Fixed an issue with keybinds related to multi-stroke binds
- Fixed inconsistency between the standards and vulnerabilities test

### Added

- `testTimeout` setting to the tests

## [1.5.2] - `STABLE`

### Added

- `Window` settings tab
- Keybinds to each test

### Changed

- Test scroll now focuses console when test is run, also focuses tab if not already active

## [1.5.1] - `STABLE` `HOTFIX`

### Changed

- Removed nested check for `appendfile`; mirror `fopen` instead without path creation

### Fixed

- Fixed `cloneref` test contaminating `getnilinstances`
- Fixed dependency checks for related functions

## [1.5.0] - `STABLE`

### Added

- New `Manual` framework for the `Standards` tests (#19)
- FileDialog Tests (#18)
- Proper type checking
- Clipboard notification when link is copied (outside main testing game)
- Docs links for file dialog functions
- Filesystem compatibility nesting checks
- Support for PNG, JPG, MP3, OGG, WEBM, MP4, OBJ, and TTF file checks in `getcustomasset`
- `WebSocket.connect` check for `is_binary` parameter and data reception

### Changed

- Updated package `Cascade` v1.0.1-beta → v1.2.0
- Reduced executor dependence
- Check actual test results for filesystem dependency in `getcustomasset` instead of global check
- `Filesystem` related tests now check for file nesting compatibility

## [1.5.0-beta.1] - `PRE-RELEASE`

### Added

- New `Manual` framework for the `Standards` tests (#19)
- FileDialog Tests (#18)

### Changed

- Updated package `Cascade` v1.0.1-beta → v1.2.0

## [1.4.4] - `STABLE` `HOTFIX`

### Changed

- Updated the testing gameid to the new one

## [1.4.3] - `STABLE` `HOTFIX`

### Fixed

- Fixed inability to publish results due to missing per-test time inclusion

## [1.4.2] - `STABLE`

### Changed

- Backend rework

## [1.4.1] - `STABLE` `HOTFIX`

### Fixed

- Fixed actor location

## [1.4.0] - `STABLE`

### Added

- `getsenv` checks for dead scripts and scripts with nil `.script` property
- `sethiddenproperty` checks to verify property changes vs. memory-only edits
- `gethiddenproperty` check for dynamically changing properties
- `setrawmetatable` checks using strings and property additions
- `hookmetamethod` checks for hook creation vs. function replacement
- `getrawmetatable` checks for error handling, table changes, and `__index` matching
- `compareinstances` checks for object equality and error handling
- `newcclosure` checks for naming support, yielding, wrapping, argument cutting, and multiple executions
- `get_comm_channel` checks for non-existent comm_id errors
- `create_comm_channel` checks for required methods, decimal comm_ids, and return value consistency
- `require` to the standard
- `getreg` to the standard
- New executor vulnerabilities module
- File access vulnerability (`file://` protocol bypass) checks for `request`, `http_request`, `http.request`, `HttpGet`, `HttpGetAsync`, and `game` methods
- `OmniRecommendationsService` and `HttpRbxApiService` to Services blocklist tests
- `escapes` vulnerabilities module with Environment/Context Escape test using `clonefunction` and `hookmetamethod`
- Auth Leak testing as dedicated `leaks` module in vulnerability testing suite

### Changed

- Refactored vulnerabilities testing suite to match standard suite's logging format
- Extracted Auth Leak testing from main vulnerabilities module

### Fixed

- Fixed `run_on_actor` xrefs conversion
- Fixed `getconstant` out of bounds index check
- Fixed Drawing library alpha conversion check in ScreenGui-based lib check

## [1.3.3] - `STABLE`

### Added

- New `debug.getproto` checks

### Changed

- Removed `.IsLoaded` check for `getcustomasset`

### Fixed

- Fixed `getnilinstances` not checking for `IsDescendantOf`
- Fixed `getproto` problems caused by internal Lua `setfenv` behavior

## [1.3.2] - `STABLE` `HOTFIX`

### Fixed

- Fixed `cloneref` making a new table per `__index` invocation

## [1.3.1] - `STABLE` `HOTFIX`

### Added

- New `run_on_actor` checks

### Changed

- Removed `IsLoaded` check for `getcustomasset`

### Deprecated

- `setfflag`
- `getfflag`

## [1.3.0] - `STABLE`

### Added

- Native signal library test (`Signal.new`)
- `cansignalreplicate` checks
- `firesignal` checks
- `getconnections` checks
- `getsignalarguments` checks
- `getsignalargumentsinfo` checks
- `getsignalwhitelist` checks
- `replicatesignal` checks

### Fixed

- Fixed `run_on_actor` xrefs check

## [1.2.5] - `STABLE` `HOTFIX`

### Fixed

- Fixed `set`/`get` fflag tests not returning any status

## [1.2.4] - `STABLE`

### Added

- `getcustomasset` checks
- `isfunctionhooked` checks
- `get`/`setfflag` checks
- `setsimulationradius` checks
- `clearqueueonteleport` checks

### Changed

- Enforced `run_on_actor` same reference to a global object
- Changed main alias for `keydown` from `keytap` to `keyclick`

### Fixed

- Fixed `getscripthash` overwriting source (autofails next run, logically inconsistent)

## [1.2.3] - `STABLE`

### Added

- Loadstring source chunk semantics (#5)
- `run_on_actor` extra semantics (#6)
- More rigorous clonefunction checking (#7)
- Checks for actor communication channel creation, retrieval, and parallel execution

### Fixed

- Fixed `debug.getconstant` always passing with inconsistency
- Fixed `Websocket.connect` test to validate signals based on methods rather than type
- Fixed `fireclickdetector`, `fireproximityprompt`, and `firetouchinterest` returning results in connections

### Changed

- Changed main alias for `keydown` from `keytap` to `keyclick`

## [1.2.2] - `STABLE`

### Added

- Vulnerability test webresults support

### Changed

- Updated webresults calls to latest format

## [1.2.1] - `STABLE`

### Added

- Vulnerability test

## [1.2.0] - `STABLE`

### Added

- Global exclusions to standards test

### Changed

- UI Library changed from ReGui to Cascade
- Updated internal framework

### Fixed

- Fixed crashes related to UI package "ReGui"

## [1.1.0] - `STABLE`

### Added

- `crypt.generatekey` uniqueness check
- Dex check to prevent overwriting `decompile`
- `base64encode` and `base64decode` empty string encoding and padding check

### Fixed

- Fixed incorrect hash to algorithm map in `crypt.hash`
- Fixed `debug.getproto` and `debug.getprotos` given protos being non-callable
- Fixed `gethiddenproperty` and `sethiddenproperty` checking for returned Lua state on writeonly properties instead of `nil`

### Changed

- Made ReGui less executor-dependent
- Unenforced `getconstant` and `getconstants` constant order

## [1.0.3] - `STABLE`

### Added

- Keytap alias "keyclick"

### Changed

- Moved GitHub key to dotenv, releasing the .pcmp config
- Moved standard definitions out of the Lua entrypoint

### Fixed

- Updated outdated WebSocket reference (i#3774060932)
- Fixed UI library icon issues

## [1.0.2] - `STABLE`

### Changed

- Backend changes

### Fixed

- Fixed status message returned by `sethiddenproperty` when `gethiddenproperty` is missing

## [1.0.1] - `STABLE`

### Added

- Touch/ended order checking for `firetouchinterest`
- More build info to home page of UI

## [1.0.0] - `STABLE`

### Added

- Moved to GitHub releases (old dist.luau loadstring redirects to the latest release)

### Changed

- Build metadata updated

### Fixed

- Fixed `debug.getconstants` (not completely validated)

### Removed

- `setrawmetatable` originalobject check

## [1.0.0-beta.3] - `PRE-RELEASE`

### Fixed

- Fixed `debug.getconstants`

## [1.0.0-beta.2] - `PRE-RELEASE`

### Added

- New build system (ProCMP)

### Changed

- Updated ReGui: 1.4.2 → 1.4.3

### Fixed

- Fixed setrawmetatable
