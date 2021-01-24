do-its
tallySelection
	"Treat the current selection as an expression; evaluate it and return the time took for this evaluation"
	| code result rcvr ctxt v |
	self lineSelectAndEmptyCheck: [^ self].

	(model respondsTo: #doItReceiver) 
		ifTrue: [ rcvr := model doItReceiver.
				ctxt := model doItContext]
		ifFalse: [rcvr := ctxt := nil].
	result := [ | cm |
		code := self selectionAsStream.
		cm := rcvr class evaluatorClass new 
			compiledMethodFor: code
			in: ctxt
			to: rcvr
			notifying: self
			ifFail: [morph flash. ^ self].
		Time millisecondsToRun: 
			[v := cm valueWithReceiver: rcvr arguments: (ctxt ifNil: [#()] ifNotNil: [{ctxt}]) ].
	] 
		on: OutOfScopeNotification 
		do: [ :ex | ex resume: true].
	
	UIManager default
		inform: ('<b>Expression</b>{1}<br>{2}<br><br><b>Time</b> (compile and execute)<br>{3} ms<br><br><b>Result</b><br>{4}' format: {
			rcvr ifNil: [''] ifNotNil: [' (', (rcvr printString truncateWithElipsisTo: 20), ')'].
			(code contents truncateWithElipsisTo: 200) copyReplaceAll: String cr with: '<br>'.
			result printString. 
			v printString truncateWithElipsisTo: 100}) asTextFromHtml.