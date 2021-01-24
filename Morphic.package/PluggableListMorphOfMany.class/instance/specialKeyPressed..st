model access
specialKeyPressed: asciiValue
	"Toggle the selection on [space]."
	
	asciiValue = Character space asciiValue
		ifTrue: [ | index |
			index :=  self getCurrentSelectionIndex.
			self
				listSelectionAt: index
				put: ((self listSelectionAt: index) not).
			^ self].
		
	super specialKeyPressed: asciiValue.