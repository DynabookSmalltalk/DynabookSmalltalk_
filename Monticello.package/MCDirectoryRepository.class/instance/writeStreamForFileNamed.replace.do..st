private
writeStreamForFileNamed: aString replace: aBoolean do: aBlock
	| file sel |
	sel := aBoolean ifTrue: [#forceNewFileNamed:] ifFalse: [#newFileNamed:].
	file := FileStream perform: sel with: (directory fullNameFor: aString).
	aBlock value: file.
	file close.