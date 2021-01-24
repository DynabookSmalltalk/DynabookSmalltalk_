instruction decoding
return: value from: aSender 
	"For simulation.  Roll back self to aSender and return value from it.  Execute any unwind blocks on the way.  ASSUMES aSender is a sender of self"

	| newTop |
	aSender isDead ifTrue:
		[^self send: #cannotReturn: to: self with: {value}].
	newTop := aSender sender.
	(self findNextUnwindContextUpTo: newTop) ifNotNil:
		[:unwindProtectCtxt|
		 ^self send: #aboutToReturn:through: to: self with: {value. unwindProtectCtxt}].
	self releaseTo: newTop.
	newTop ifNotNil: [newTop push: value].
	^newTop