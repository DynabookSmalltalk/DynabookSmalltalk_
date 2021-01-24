accessing
any: numberOfElements as: aClass

	self canBeEnumerated
		ifTrue: [^ super any: numberOfElements as: aClass]
		ifFalse: [self shouldNotImplement]