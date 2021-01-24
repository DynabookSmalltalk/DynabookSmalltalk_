visiting
writeSnapshot: aSnapshot 
	aSnapshot definitions ifEmpty: [ MCEmptyVersion signal ].
	self
		
		addString: (self serializeDefinitions: aSnapshot definitions)
		at: 'snapshot/source.' , self snapshotWriterClass extension
		encodedTo: 'utf8' ;
		
		addString: (self serializeInBinary: aSnapshot)
		at: 'snapshot.bin'