layout
minHeight

	| result |
	textStyle ifNil: [^ 16].

	result := (textStyle lineGrid + 2) + (self borderWidth*2).
	margins ifNil: [^ result].
	
	^ margins isRectangle
		ifTrue: [result + margins top + margins bottom]
		ifFalse: [margins isPoint
			ifTrue: [result + margins y + margins y]
			ifFalse: [result + (2*margins)]]