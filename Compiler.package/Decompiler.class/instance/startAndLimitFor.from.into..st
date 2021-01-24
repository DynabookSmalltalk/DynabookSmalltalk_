private
startAndLimitFor: incrVar from: aStack into: binaryBlock
	"If incrVar matches the increment of a whileLoop at the end of statements
	 evaluate binaryBlock with the init statement for incrVar and the init statement
	 for the block's limit, if any, and answer true.  Otherwise answer false.  Used to
	 help convert whileTrue: loops into to:[by:]do: loops."
	| guard initExpr limitInit size |
	((size := aStack size) >= 1
	 and: [(initExpr := aStack at: size) isAssignmentNode]) ifFalse:
		[^false].
	initExpr variable == incrVar ifTrue:
		[binaryBlock value: initExpr value: nil.
		 ^true].
	limitInit := initExpr.
	(size >= 2
	 and: [(initExpr := aStack at: size - 1) isAssignmentNode
	 and: [initExpr variable == incrVar
	 and: [(guard := statements last receiver) isBlockNode
	 and: [guard statements size = 1
	 and: [(guard := guard statements first) isMessageNode
	 and: [guard receiver == incrVar
	 and: [guard arguments first == limitInit variable]]]]]]]) ifTrue:
		[binaryBlock value: initExpr value: limitInit.
		 ^true].
	^false