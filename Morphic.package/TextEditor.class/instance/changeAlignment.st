menu messages
changeAlignment
	| options reply |
	options := self existingIndentation
		caseOf:
			{[0]-> [ #('leftFlush' 'indented' 'centered' 'justified' 'rightFlush') ].
			[1] -> [ #('leftFlush' 'indented more' 'centered' 'justified' 'rightFlush') ]}
		otherwise: [ #('leftFlush' 'indented less' 'indented more' 'centered' 'justified' 'rightFlush') ].
	reply := UIManager default chooseFrom: options values: options.
	reply ifNil: [ ^ self ].
	self setAlignment: reply.
	paragraph composeAll.
	self recomputeSelection.
	^ true