printing
summaryAndRevision
	^String streamContents:
		[:s | s nextPutAll: self timeStamp;
			space; nextPutAll: self summary;
			nextPutAll: ' {'; nextPutAll: self category;
			nextPut: $}]