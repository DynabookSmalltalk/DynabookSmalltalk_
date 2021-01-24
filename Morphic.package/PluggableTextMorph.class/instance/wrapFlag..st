accessing
wrapFlag: aBoolean

	textMorph ifNil: [self setText: ''].
	
	aBoolean
		ifTrue: [
			textMorph hResizing: #spaceFill.
			self hideHScrollBarIndefinitely]
		ifFalse: [
			textMorph hResizing: #shrinkWrap.
			self showHScrollBarOnlyWhenNeeded].

	self layoutChanged.