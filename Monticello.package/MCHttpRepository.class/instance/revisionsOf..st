accessing
revisionsOf: aMCDefinition 
	| reply |
	reply := self
		httpGet: 'history'
		for: aMCDefinition.
	^ reply isString
		ifTrue:
			[ Warning signal: 'Revisions request failed.  Server ''reply'' in debugger.'.
			Array empty ]
		ifFalse: [ (ReferenceStream on: reply) next ]