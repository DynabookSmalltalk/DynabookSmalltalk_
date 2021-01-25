comparing
= anObject 
	self class == anObject class
		ifFalse: [^ false].
	^ brokerID = anObject brokerID
		and: [objectID = anObject objectID]