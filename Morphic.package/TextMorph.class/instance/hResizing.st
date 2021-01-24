layout-properties
hResizing

	self layoutProperties ifNotNil: [:props |
		^ props hResizing].
	
	(self isAutoFit and: [self isWrapped])
		ifTrue: [^ #rigid]. "or #spaceFill"
	(self isAutoFit and: [self isWrapped not])
		ifTrue: [^ #shrinkWrap].
	(self isAutoFit not and: [self isWrapped])
		ifTrue: [^ #rigid]. "or #spaceFill"
	(self isAutoFit not and: [self isWrapped not])
		ifTrue: [^ #rigid]. "or #spaceFill"