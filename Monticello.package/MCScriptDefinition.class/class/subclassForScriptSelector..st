private - instance creation
subclassForScriptSelector: selectorString
	^self allSubclasses detect: [:ea | ea scriptSelector = selectorString]