initialize
fromFileNamed: aName
	fullName := aName.
	FileStream readOnlyFileNamed: aName do: [:stream |
		stream setConverterForCode.
		self fileInFrom: stream]