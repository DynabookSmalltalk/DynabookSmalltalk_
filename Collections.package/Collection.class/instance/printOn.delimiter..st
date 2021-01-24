printing - obsolete
printOn: aStream delimiter: delimString

	self flag: #deprecate.
	self
		printElementsOn: aStream
		separatedBy: delimString.