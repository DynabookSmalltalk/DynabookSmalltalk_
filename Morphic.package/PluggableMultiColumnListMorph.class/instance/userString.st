debug and other
userString
	"Do I have a text string to be searched on?"

	^ String streamContents: [:strm |
		1 to: self rowCount do: [:row |
			1 to: self columnCount do: [:col |
				strm nextPutAll: ((self getFullList at: col) at: row) asStringOrText; tab].
			strm cr]]