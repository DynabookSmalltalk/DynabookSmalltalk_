snapshot and quit
snapshot: save andQuitWithExitCode: exitCode

	^self
		snapshot: save
		andQuit: true
		withExitCode: exitCode
		embedded: false