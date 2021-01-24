instruction decoding
jump: dist if: condition

	| savePc sign elsePc elseStart end cond ifExpr thenBlock elseBlock
	  thenJump elseJump condHasValue isIfNil saveStack |
	lastJumpIfPcStack addLast: lastPc.
	stack last == CascadeFlag ifTrue: [^ [self case: dist] ensure: [lastJumpIfPcStack removeLast]].
	elsePc := lastPc.
	elseStart := pc + dist.
	end := limit.
	"Check for bfp-jmp to invert condition.
	Don't be fooled by a loop with a null body."
	sign := condition.
	savePc := pc.
	self interpretJump ifNotNil:
		[:elseDist|
		 (elseDist >= 0 and: [elseStart = pc]) ifTrue:
			 [sign := sign not.  elseStart := pc + elseDist]].
	pc := savePc.
	ifExpr := stack removeLast.
	(isIfNil := stack size > 0 and: [stack last == IfNilFlag]) ifTrue:
		[stack removeLast].
	saveStack := stack.
	stack := OrderedCollection new.
	thenBlock := self blockTo: elseStart.
	condHasValue := hasValue or: [isIfNil].
	"ensure jump is within block (in case thenExpr returns)"
	thenJump := exit <= end ifTrue: [exit] ifFalse: [elseStart].
	"if jump goes back, then it's a loop"
	thenJump < elseStart
		ifTrue:
			[| blockBody blockArgs savedReadCounts blockBodyReadCounts selector |
			 "Must be a while loop...
			  thenJump will jump to the beginning of the while expr.  In the case of while's
			  with a block in the condition, the while expr should include more than just
			  the last expression: find all the statements needed by searching for the node
			  with the relevant pc."
			stack := saveStack.
			savedReadCounts := tempReadCounts copy.
			pc := thenJump.
			blockBody := self statementsTo: elsePc.
			blockBodyReadCounts := tempReadCounts.
			savedReadCounts keysAndValuesDo:
				[:temp :count|
				 blockBodyReadCounts at: temp put: (blockBodyReadCounts at: temp) - count].
			tempReadCounts := savedReadCounts.
			"discard unwanted statements from block"
			blockBody size - 1 timesRepeat: [statements removeLast].
			blockArgs := thenBlock statements = constructor codeEmptyBlock statements
							ifTrue: [#()]
							ifFalse: [{ thenBlock }].
			selector := blockArgs isEmpty
							ifTrue: [sign ifTrue: [#whileFalse] ifFalse: [#whileTrue]]
							ifFalse: [sign ifTrue: [#whileFalse:] ifFalse: [#whileTrue:]].
			statements addLast:
				(constructor
					codeMessage: (constructor codeBlock: blockBody returns: false)
					selector: (constructor codeSelector: selector code: #macro)
					arguments: blockArgs).
			pc := elseStart.
			selector == #whileTrue: ifTrue:
				[self convertToDoLoop: blockBodyReadCounts]]
		ifFalse:
			["Must be a conditional..."
			elseBlock := self blockTo: thenJump.
			elseJump := exit.
			"if elseJump is backwards, it is not part of the elseExpr"
			elseJump < elsePc ifTrue:
				[pc := lastPc].
			cond := isIfNil
						ifTrue:
							[constructor
								codeMessage: ifExpr ifNilReceiver
								selector: (constructor
											codeSelector: (sign ifTrue: [#ifNotNil:] ifFalse: [#ifNil:])
											code: #macro)
								arguments: (Array with: thenBlock)]
						ifFalse:
							[(sign
								ifTrue: [{elseBlock. thenBlock}]
								ifFalse: [{thenBlock. elseBlock}]) in:
									[:args |
									(constructor
										decodeIfNilWithReceiver: ifExpr
										selector: #ifTrue:ifFalse:
										arguments: args
										tempReadCounts: tempReadCounts) ifNil:
											[constructor
												codeMessage: ifExpr
												selector: (constructor codeSelector: #ifTrue:ifFalse: code: #macro)
												arguments:	 args]]].
			stack := saveStack.
			condHasValue
				ifTrue: [stack addLast: cond]
				ifFalse: [statements addLast: cond]].
	lastJumpIfPcStack removeLast.