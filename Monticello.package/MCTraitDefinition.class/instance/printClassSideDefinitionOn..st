printing
printClassSideDefinitionOn: stream
	stream
		nextPutAll: self className;
		nextPutAll: ' classTrait ';
		cr; tab;
		nextPutAll: 'uses: ';
 		nextPutAll: self classTraitCompositionString