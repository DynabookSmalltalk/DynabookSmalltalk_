accessing
source
	^ self localChosen
		ifTrue: [operation fromSource]
		ifFalse: [operation source]