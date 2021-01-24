logical operations
| aBoolean 
	"Evaluating disjunction (OR) -- answer true since the receiver is true, but let the VM quickly check the type of the argument first."

	aBoolean ifTrue: [ ^true ].
	^true