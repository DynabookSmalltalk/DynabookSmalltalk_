do-its
evaluateSelectionAndDo: aBlock
	"Treat the current selection as an expression; evaluate it and invoke aBlock with the result."

	| result rcvr ctxt selectionInterval |
	self lineSelectAndEmptyCheck: [^ nil].

	(model respondsTo: #evaluateExpression:) ifTrue: [
		^ aBlock value: (model perform: #evaluateExpression: with: self selection)].

	(model respondsTo: #doItReceiver) 
		ifTrue: [ rcvr := model doItReceiver.
				ctxt := model doItContext]
		ifFalse: [rcvr := ctxt := nil].

	selectionInterval := self selectionInterval.
	result := [
		rcvr class evaluatorClass new 
			evaluate: self selectionAsStream
			in: ctxt
			to: rcvr
			environment: (model environment ifNil: [Smalltalk globals])
			notifying: self
			ifFail: [morph flash. ^ nil]
			logged: true.
	] 
		on: OutOfScopeNotification 
		do: [ :ex | ex resume: true].
	"The parser might change the current selection for interactive error correction."
	self selectInterval: selectionInterval.
	
	(model respondsTo: #expressionEvaluated:result:) ifTrue: [
		model perform: #expressionEvaluated:result: with: self selection with: result].
		
	^aBlock value: result