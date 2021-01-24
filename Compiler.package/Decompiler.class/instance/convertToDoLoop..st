private
convertToDoLoop: blockBodyTempCounts
	"If statements contains the pattern
		var := startExpr.
		[var <= limit] whileTrue: [...statements... var := var + incConst]
	or
		var := startExpr.
		limit := limitExpr.
		[var <= limit] whileTrue: [...statements... var := var + incConst]
	then replace this by
		startExpr to: limit by: incConst do: [:var | ...statements...]
	 and answer true."
	| whileStmt incrStmt initStmt limitStmt toDoStmt |
	whileStmt := statements last.
	incrStmt := whileStmt arguments first statements last.
	incrStmt isAssignmentNode ifFalse:
		[^false].
	(self startAndLimitFor: incrStmt variable from: stack into:
							[:startExpr :limitExpr| initStmt := startExpr. limitStmt := limitExpr])
		ifTrue:
			[| limitInStatements |
			 limitInStatements := limitStmt isNil
								    and: [statements size > 1
								    and: [self startAndLimitFor: incrStmt variable from: { stack last. (statements last: 2) first } into:
												[:startExpr :limitExpr| limitStmt := limitExpr]]].
			(toDoStmt := statements last toDoFromWhileWithCounts: blockBodyTempCounts init: initStmt limit: limitStmt) ifNil:
				[^false].
			 limitInStatements
				ifTrue:
					[stack
						removeLast;
						addLast: toDoStmt.
					 statements removeLast: 2]
				ifFalse:
					[stack
						removeLast: (limitStmt ifNil: [1] ifNotNil: [2]);
						addLast: toDoStmt.
					 statements removeLast]]
		ifFalse:
			[(self startAndLimitFor: incrStmt variable from: statements allButLast into:
							[:startExpr :limitExpr| initStmt := startExpr. limitStmt := limitExpr]) ifFalse:
				[^false].
			 (toDoStmt := statements last toDoFromWhileWithCounts: blockBodyTempCounts init: initStmt limit: limitStmt) ifNil:
				[^false].
			 statements
				removeLast: (limitStmt ifNil: [2] ifNotNil: [3]);
				addLast: toDoStmt].
	self markTemp: initStmt variable asOutOfScope: -1. "Flag arg as out of scope"
	initStmt variable beBlockArg.
	limitStmt ifNotNil:
		[self markTemp: limitStmt variable asOutOfScope: -2.
		 toDoStmt arguments at: 1 put: limitStmt value]. "Flag limit as hidden"
	^true