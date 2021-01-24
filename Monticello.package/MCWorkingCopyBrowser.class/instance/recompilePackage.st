actions
recompilePackage
	(workingCopy withEnvironmentActiveDo: [workingCopy package packageInfo methods])
		do: [:ea | ea actualClass recompile: ea methodSymbol]
		displayingProgress: 'Recompiling...'