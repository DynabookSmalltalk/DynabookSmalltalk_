accessing
originOf: aMCDefinition 
	| reply |
	reply := self
		httpGet: 'origin'
		for: aMCDefinition.
	^ reply isString
		ifTrue:
			[ Warning signal: 'Origin request failed.  Server ''reply'' in debugger.'.
			Array empty ]
		ifFalse: [ (ReferenceStream on: reply) next ]