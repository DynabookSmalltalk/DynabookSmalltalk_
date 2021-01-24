layout-properties
wrapDirection

	self layoutProperties ifNotNil: [:props |
		^ props wrapDirection].
	
	^ self vResizing == #shrinkWrap
		ifTrue: [#topToBottom]
		ifFalse: [#none]