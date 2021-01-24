printing
printCommentOn: stream
	stream
		nextPut: $";
		nextPutAll: self comment asString;
		nextPut: $"
