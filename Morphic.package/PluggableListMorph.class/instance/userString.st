debug and other
userString
	"Do I have a text string to be searched on?"

	^ String streamContents: [:strm |
		self getFullList do: [:item |
			"must use asStringOrText because that's what the drawing uses, too"
			strm nextPutAll: item asStringOrText; cr]]