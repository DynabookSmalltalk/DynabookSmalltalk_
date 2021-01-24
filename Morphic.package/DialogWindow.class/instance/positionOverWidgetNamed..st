initialization
positionOverWidgetNamed: nameSymbol 
	self allMorphsDo:
		[ : each | each knownName = nameSymbol ifTrue: [ self preferredPosition: each ] ]