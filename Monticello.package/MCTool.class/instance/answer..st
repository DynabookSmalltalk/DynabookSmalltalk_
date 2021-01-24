morphic ui
answer: anObject
	(modalProcess notNil and: [modalProcess ~~ Processor activeProcess])
		ifTrue: [^self inform: 'This modal dialog was interrupted, please close it'].
	modalValue := anObject.
	self close.