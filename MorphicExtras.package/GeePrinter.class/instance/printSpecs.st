accessing
printSpecs

	^printSpecs ifNil: [printSpecs := PrintSpecifications defaultSpecs].
