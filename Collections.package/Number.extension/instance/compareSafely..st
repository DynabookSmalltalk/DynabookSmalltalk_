*collections
compareSafely: aNumber 
	^ aNumber isNumber
		ifTrue: [ self < aNumber ]
		ifFalse: [ super compareSafely: aNumber ]