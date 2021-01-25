as yet unclassified
toggleChoice: aString

	(acceptableTypes includes: aString) ifTrue: [
		acceptableTypes remove: aString ifAbsent: []
	] ifFalse: [
		acceptableTypes add: aString
	].