as yet unclassified
getChoice: aString

	aString = 'group' ifTrue: [^groupMode ifNil: [true]].