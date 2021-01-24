geometry
moveSliderTo: newPosition
	"Sliently move the slider (or thumb) to not trigger any #layoutChanged events."
	
	| delta |
	self flag: #codeDuplication. "mt: We need a better way to silently do position changes. See Morph >> #position:."
	
	delta := (newPosition - slider position) rounded.
	delta = (0@0) ifTrue: [^ self].
	
	slider privateFullMoveBy: delta.
	self changed.
	