private
readStreamForFileNamed: aString do: aBlock
	| file val |
	file := FileStream readOnlyFileNamed: (directory fullNameFor: aString).
	val := aBlock value: file.
	file close.
	^ val