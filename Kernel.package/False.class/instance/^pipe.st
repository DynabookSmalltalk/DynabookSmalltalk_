logical operations
| aBoolean 
	"Evaluating disjunction (OR) -- could  answer aBoolean since receiver is false, but let the VM quickly check the type of the argument instead."

	aBoolean ifTrue: [ ^true ].
	^false