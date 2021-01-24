event handling
mouseLeaveDragging: anEvent
	"Dragging means changing the list's multi-selection state. Thus, there is no support for drag-and-drop of elements within a selection."
	
	self hoverRow: nil.
	self resetPotentialDropRow.