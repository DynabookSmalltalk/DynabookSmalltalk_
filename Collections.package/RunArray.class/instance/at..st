accessing
at: index

	self at: index setRunOffsetAndValue: [:run :offset :value | 
		offset < 0 ifTrue: [ self errorSubscriptBounds: index ].
		offset >= (runs at: run) ifTrue: [ self errorSubscriptBounds: index ].
		^value]