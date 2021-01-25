as yet unclassified
matchStream: aReadStream with: aRule withArgs: args withPlaybackDebugging: debugging

	| input matcher ans|
	input := OM2LazyStream for: aReadStream withPos: 1.
	matcher := self new initInput: input.
	[
		matcher apply: #empty withArgs: args.
		ans := matcher apply: aRule.
		matcher apply: #end.
		^ ans
	] on: OM2Fail do: [:e |
		| curr prev prevPrev |
		debugging ifFalse: [e signal].
		curr := input.
		prev := nil.
		prevPrev := nil.
		[curr notNil] whileTrue: [
			prevPrev := prev.
			prev := curr.
			curr := curr basicTail
		].
		curr := prevPrev ifNotNil: [prevPrev] ifNil: [prev].
		self inform: 'will halt each time matcher reaches ', curr printString.
		matcher
			initInput: input;
			forgetEverything.
		curr ifNil: [self error: 'you''ve found a bug -- please tell Alex'].
		curr become: (OM2StreamDebugger for: curr copy).
		matcher haltingPoint: curr.
		matcher apply: #empty withArgs: args.
		ans := matcher apply: aRule.
		matcher apply: #end.
		^ ans
	]