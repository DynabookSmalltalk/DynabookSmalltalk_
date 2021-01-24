testing
ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise. If the notEmptyBlock has an argument, evalualte it with myself as its argument. See also #ifEmpty:ifNotEmptyDo:."

	self isEmpty ifTrue: [^ emptyBlock value].
	^ notEmptyBlock cull: self