event handling
keyboardFocusChange: aBoolean 
	"Clear the hover effect and maybe the current list filter if we lose keyboard focus."
	
	aBoolean ifFalse:
		[self hoverRow: nil.
		self clearFilterAutomatically ifTrue:
			[self removeFilter]].
		
	super keyboardFocusChange: aBoolean.