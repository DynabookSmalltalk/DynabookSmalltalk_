initialize-release
stateArray
	^ {ChangeText.
		FindText.
		history ifNil: [TextEditorCommandHistory new]. "Convert old instances"
		self markIndex to: self pointIndex - 1.
		self startOfTyping.
		emphasisHere}