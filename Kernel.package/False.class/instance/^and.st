logical operations
& aBoolean 
	"Evaluating conjunction -- answer false since receiver is false, but let the VM quickly check the type of the argument first."

	aBoolean ifFalse: [ ^false ].
	^false