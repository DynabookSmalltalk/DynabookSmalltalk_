comparing
requirements
	^superclassName == #nil
		ifTrue: [self poolDictionaries]
		ifFalse: [{ superclassName }, self poolDictionaries]