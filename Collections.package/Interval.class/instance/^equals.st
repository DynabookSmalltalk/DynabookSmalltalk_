comparing
= anObject
	^ self == anObject
		or: [anObject isInterval
			ifFalse: [super = anObject]
			ifTrue: 
				[start = anObject first
				 and: [step = anObject increment
				 and: [self last = anObject last]]]]