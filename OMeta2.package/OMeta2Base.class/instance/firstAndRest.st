rules-basic
firstAndRest

	| first rest |
	first := self apply: #anything.
	rest := self apply: #anything.
	^ self genericMany: [self apply: rest] into: (OrderedCollection with: (self apply: first))