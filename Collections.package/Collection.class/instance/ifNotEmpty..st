testing
ifNotEmpty: aBlock
	"Evaluate aBlock if I'm not empty, return myself otherwise. If aBlock has an argument, evaluate it with myself as its argument. See also #ifNotEmptyDo:."

	self isEmpty ifFalse: [^ aBlock cull: self].