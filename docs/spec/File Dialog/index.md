# `File Dialog`

The File Dialog API provides a standard set of functions for users to choose a specific file from anywhere of their choosing. It is completely user-choice and safe, as developers cannot programmatically choose for them.

## Problem Statement

Normal FS functions are in a sandbox which is totally fine, but eliminates the chance for users to select things outside of the workspace, which is really inconvenient. For example, to make a config system, relying on the sandboxed workspace is inconvenient and inconsistent across executors.

## Behavior Specification

- The dialog should yield only the calling thread, don't freeze the environment until the dialog is dismissed one way or another.
- It shouldn't error if the user cancels, only return `nil` as shown in the type definitions.
- The dialog should use standard windows file dialog prompts.
- `savefiledialog` should write before returning the path.
- The filter table makes sure the user is only selecting certain types of files.

## Implementation Notes

The file dialogs return their own filesystem functions, since the standard filesystem functions are isolated to its workspace sandbox.
