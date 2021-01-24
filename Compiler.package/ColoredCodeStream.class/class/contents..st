instance creation
contents: blockWithArg 
	"Evaluate blockWithArg on a DialectStream of the given description"

	| stream |
	stream := self on: (Text new: 400).
	blockWithArg value: stream.
	^ stream contents