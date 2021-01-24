instance creation
basicReadFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream."

	| object |
	(Compiler couldEvaluate: textStringOrStream)
		ifFalse: [^ self error: 'expected String, Stream, or Text' translated].
	object := self environment beCurrentDuring: [
		Compiler evaluate: textStringOrStream environment: self environment].
	(object isKindOf: self) ifFalse: [self error: ('{1} expected' translated format: {self name})].
	^object