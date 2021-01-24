do-its
debugIt

	| receiver context helperProcess |
	self lineSelectAndEmptyCheck: [^self].

	(model respondsTo: #debugExpression:)
		ifTrue: [^ model perform: #debugExpression: with: self selection].

	receiver := (model respondsTo: #doItReceiver) 
		ifTrue: [model doItReceiver]
		ifFalse: [nil].
		
	context := (model respondsTo: #doItContext) 
		ifTrue: [model doItContext]
		ifFalse: [nil].

	(self compileSelectionFor: receiver in: context) ifNotNil: [:doItMethod |
		helperProcess := context
			ifNil: [self assert: doItMethod selector = #DoIt.
				Process forMethod: doItMethod receiver: receiver]
			ifNotNil: [self assert: doItMethod selector = #DoItIn:.
				Process forMethod: doItMethod receiver: receiver arguments: {context}].
		helperProcess debugWithTitle: 'Debug it'].