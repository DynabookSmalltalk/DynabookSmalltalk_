layout
minWidth
	"Layout specific. If you don't use a layout policy but claim to be #shrinkWrap on the horizontal axis, use #minWidth to answer that shrink-wrapped width."

	^ self
		valueOfProperty: #minWidth
		ifAbsent: [1]