model access - keystroke
modifierKeyPressed: aChar 
	
	keystrokeActionSelector ifNil: [^ self].

	model
		perform: keystrokeActionSelector
		withEnoughArguments: {
			aChar.
			self}.