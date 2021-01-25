comparing
= anObject

	^self class == anObject class
		and: [ anObject low = low
		and: [ anObject hi = hi ] ]