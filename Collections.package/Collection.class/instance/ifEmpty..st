testing
ifEmpty: aBlock
	"Evaluate aBlock if I'm empty, return myself otherwise."

	self isEmpty ifTrue: [^ aBlock value].