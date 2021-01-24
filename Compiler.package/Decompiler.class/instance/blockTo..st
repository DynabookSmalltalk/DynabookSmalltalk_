control
blockTo: end
	"Decompile a range of code as in statementsTo:, but return a block node."
	| exprs block oldBase lastStatementOfBlockIsNil |
	oldBase := blockStackBase.
	blockStackBase := stack size.
	exprs := self statementsTo: end.
	lastStatementOfBlockIsNil := pc < method endPC and: [exprs notEmpty and: [exprs last == (constTable at: 4)]].
	lastStatementOfBlockIsNil ifTrue:
		[exprs := exprs allButLast].
	block := constructor codeBlock: exprs returns: lastReturnPc = lastPc.
	blockStackBase := oldBase.
	lastReturnPc := -1.  "So as not to mislead outer calls"
	^block