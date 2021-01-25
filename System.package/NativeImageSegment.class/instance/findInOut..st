testing
findInOut: anArray
	"Take an array of references to a morph, and try to classify them:  in the segment, in outPointers, or other."

String streamContents: [:strm |
	anArray withIndexDo: [:obj :ind |
		strm cr; nextPutAll: obj printString; space.

		]].