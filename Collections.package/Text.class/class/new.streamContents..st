instance creation
new: newSize streamContents: blockWithArg

	| stream |
	stream := TextStream on: (self new: newSize).
	blockWithArg value: stream.
	^ stream contents