accessing
font: newFont

	font := (newFont ifNil: [ TextStyle default defaultFont ]).
	listFilterOffsets := nil.
	
	self layoutChanged.
	self changed.