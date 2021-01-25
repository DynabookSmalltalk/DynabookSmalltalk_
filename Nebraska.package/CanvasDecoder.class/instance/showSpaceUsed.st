decoding
showSpaceUsed

	| total |
	CachedForms ifNil: [^self].
	total := 0.
	CachedForms do: [ :each |
		each ifNotNil: [
			total := total + (each depth * each width * each height // 8).
		].
	].
	(total // 1024) printString,'     ',
	(Smalltalk garbageCollectMost // 1024) printString,'     ' displayAt: 0@0