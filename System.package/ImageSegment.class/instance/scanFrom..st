fileIn/Out
scanFrom: aStream
	"Move source code from a fileIn to the changes file for classes in an ImageSegment.  Do not compile the methods.  They already came in via the image segment.  After the ImageSegment in the file, !ImageSegment new! captures control, and scanFrom: is called."
	| val chunk |

	[aStream atEnd] whileFalse: 
		[aStream skipSeparators.
		val := (aStream peekFor: $!)
			ifTrue: ["Move (aStream nextChunk), find the method or class 
						comment, and install the file location bytes"
					(Compiler evaluate: aStream nextChunk logged: false)
						scanFromNoCompile: aStream forSegment: self]
			ifFalse: [chunk := aStream nextChunk.
					aStream checkForPreamble: chunk.
					Compiler evaluate: chunk logged: true].
		aStream skipStyleChunk].
	"regular fileIn will close the file"
	^ val