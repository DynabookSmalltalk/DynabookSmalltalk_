logical operations
& aBoolean 
	"Evaluating conjunction -- could answer aBoolean since receiver is true, but let the VM quickly check the type of the argument instead."

	aBoolean ifFalse: [ ^false ].
	^true