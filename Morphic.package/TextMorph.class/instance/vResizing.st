layout-properties
vResizing

	self layoutProperties ifNotNil: [:props |
		^ props vResizing].
	
	(self isAutoFit and: [self isWrapped])
		ifTrue: [^ #shrinkWrap]. 
	(self isAutoFit and: [self isWrapped not])
		ifTrue: [^ #shrinkWrap].
	(self isAutoFit not and: [self isWrapped])
		ifTrue: [^ #rigid]. "or #spaceFill"
	(self isAutoFit not and: [self isWrapped not])
		ifTrue: [^ #rigid]. "or #spaceFill"