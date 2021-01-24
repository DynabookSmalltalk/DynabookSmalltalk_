printing
stringForReadout
	"Answer a String whose characters are a description of the receiver layed out in rows and columns"

	^ String streamContents: [:aStream | 
	1
		to: self rowCount
		do: [:iRow | 
			1
				to: self columnCount
				do: [:iCols | 
					aStream
						print: (self at: iRow at: iCols).
					aStream tab: 2].
			aStream cr]]