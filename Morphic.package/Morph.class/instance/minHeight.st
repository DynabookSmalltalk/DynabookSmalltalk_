layout
minHeight
	"Layout specific. If you don't use a layout policy but claim to be #shrinkWrap on the vertical axis, use #minHeight to answer that shrink-wrapped height. See MenuItemMorph."

	^ self
		valueOfProperty: #minHeight
		ifAbsent: [1]