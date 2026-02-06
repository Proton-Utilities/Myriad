type WatchHandler = (newValue: any?) -> any

declare debugger: {
	halt: (conditional: boolean?) -> (),
	watch: (name: string, handler: WatchHandler) -> (),
	watchBatch: (vars: { [string]: WatchHandler }) -> (),
	check: <T>(current: T, newValue: T?) -> T,

	watchStack: { [string]: WatchHandler },
}