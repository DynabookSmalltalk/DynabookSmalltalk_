instance creation
encompassing: listOfPoints
	"A number of callers of encompass: should use this method."
	| topLeft bottomRight |
	topLeft := bottomRight := nil.
	listOfPoints do:
		[:p | topLeft == nil
			ifTrue: [topLeft := bottomRight := p]
			ifFalse: [topLeft := topLeft min: p.
					bottomRight := bottomRight max: p]].
	^ topLeft corner: bottomRight