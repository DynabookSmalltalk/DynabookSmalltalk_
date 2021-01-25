scanning
scanFrom: aByteStream
	"Sieze control of the fileIn.  Put myself in as the context.  If any UniClasses (for just one instance) are defined, they will do it through me, and I will look for conflicting class names.  If so, install the old name as a class var of me, so the compile will work.  Tell my SmartRefStream about renaming the class."

	| valWithOddName47 scannerNamed53 chunkNamed117 |
	pvt3SmartRefStrm := SmartRefStream on: aByteStream.
	aByteStream ascii.
	[aByteStream atEnd] whileFalse:
		[aByteStream skipSeparators.
		valWithOddName47 := (aByteStream peekFor: $!)
			ifTrue: [chunkNamed117 := aByteStream nextChunk.	"debug"
					scannerNamed53 := Compiler evaluate: chunkNamed117
							for: self logged: false.
					scannerNamed53 class == self class 
						ifTrue: ["I already am the scanner for this file"]
						ifFalse: [scannerNamed53 scanFrom: aByteStream]]
			ifFalse: [chunkNamed117 := aByteStream nextChunk.
					chunkNamed117 := self lookAhead: chunkNamed117.
					Compiler evaluate: chunkNamed117 for: self logged: true].
		aByteStream skipStyleChunk].
	^ valWithOddName47