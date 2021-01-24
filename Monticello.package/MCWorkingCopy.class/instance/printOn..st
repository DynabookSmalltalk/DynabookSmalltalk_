accessing
printOn: stream
	super printOn: stream.
	stream
		nextPut: $(;
		nextPutAll: self packageName;
		nextPut: $)