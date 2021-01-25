testing
activeClasses   "NativeImageSegment activeClasses"
	"Restore all remaining MD faults and return the active classes"

	| unused active |
	unused := OrderedCollection new.
	active := OrderedCollection new.
	Smalltalk allClasses do:
		[:c | (c instVarNamed: 'methodDict') 
			ifNil: [unused addLast: c]
			ifNotNil: [active addLast: c]].
	unused do: [:c | c recoverFromMDFault].
	^ active