forgetting
transitiveForgetEverything

	| curr |
	curr := self.
	[curr notNil] whileTrue: [
		curr forgetEverything.
		curr := curr basicTail
	]