enumerating
detectMin: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the element for which aBlock evaluates to the lowest number.
	If collection empty, return nil."

	| minElement minValue |
	self do: [:each | | val | 
		minValue
			ifNotNil: [ 
				(val := aBlock value: each) < minValue
					ifTrue: [ 
						minElement := each.
						minValue := val ] ]
			ifNil: [ 
				"first element"
				minElement := each.
				minValue := aBlock value: each ].
				"Note that there is no way to get the first element that works 
				for all kinds of Collections.  Must test every one."].
	^ minElement