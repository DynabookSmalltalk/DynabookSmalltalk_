comparing
= anObject 
	self == anObject ifTrue: [^ true].
	^anObject class == self class
		and:
			[(runs hasEqualElements: anObject runs)
			 and: [values hasEqualElements: anObject values]]