testing
ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise. If the notEmptyBlock has an argument, evaluate it with myself as its argument. See also #ifNotEmptyDo:ifEmpty:."

	self isEmpty ifFalse: [^notEmptyBlock cull: self].
	^ emptyBlock value