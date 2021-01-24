morphic ui
workingCopies
	^ MCWorkingCopy allManagers sort:
		[ :a :b | a package name <= b package name ]