menus
loadClassSelectionIntoOtherEnvironment
	| env |
	classSelection ifNil: [ ^self ].
	env := EnvironmentRequest signal.
	env beCurrentDuring: [
		(self packageClasses detect: [ :ea | ea className = classSelection ] ifNone: [ ^self ])
			load.
		self methodsForSelectedClass do: [ :m | m load ]].