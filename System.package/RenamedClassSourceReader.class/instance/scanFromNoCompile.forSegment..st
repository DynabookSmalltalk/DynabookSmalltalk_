fileIn/Out
scanFromNoCompile: aStream forSegment: anImageSegment
	"Just move the source code for the methods from aStream."
	| methodText d |

	[
		(methodText _ aStream nextChunkText) size > 0
	] whileTrue: [
		(SourceFiles at: 2) ifNotNil: [
			d _ Dictionary new.
			d
				at: #oldClassName put: class;		"may be 'Player1' or 'Player1 class'"
				at: #methodText put: methodText;
				at: #changeStamp put: changeStamp;
				at: #category put: category.
			anImageSegment acceptSingleMethodSource: d.
		]
	]