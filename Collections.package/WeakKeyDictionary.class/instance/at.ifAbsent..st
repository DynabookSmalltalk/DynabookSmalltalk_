accessing
at: key ifAbsent: aBlock 
	"While no nil key can be added, keys become nil when they are garbage collected.
	This must not let nil accidentally 'inherit' the value of such a stale association."
	key ifNil: [^ aBlock value].
	^ super at: key ifAbsent: aBlock