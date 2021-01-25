private
collectionToString: aCollection
	| stream |
	stream _ String new writeStream.
	stream nextPutAll: '('.
	aCollection
		do: [:each | stream nextPutAll: each asString]
		separatedBy: [stream nextPutAll: ', '].
	stream nextPutAll: ')'.
	^ stream contents