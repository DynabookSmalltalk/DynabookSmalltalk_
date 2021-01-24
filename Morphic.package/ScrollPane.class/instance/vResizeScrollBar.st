layout - resizing
vResizeScrollBar

	| w topLeft border |
	self vScrollBarPolicy == #never ifTrue: [^self].
	
	w := self scrollBarThickness.
	border := self borderWidth.
	topLeft := scrollBarOnLeft 
		ifTrue: [retractableScrollBar 
			ifTrue: [bounds topLeft - ((w - border) @ 0)]
			ifFalse: [bounds topLeft]]
		ifFalse: [retractableScrollBar 
			ifTrue: [bounds topRight - (border @ 0)]
			ifFalse: [bounds topRight - (w @ 0)]].
			
	scrollBar bounds: (topLeft extent: w @ self vScrollBarHeight)
	
