layout-properties
disableLayout: aBool
	"Layout specific. Disable laying out the receiver in a layout"

	self fullBounds; layoutChanged.
	self assureLayoutProperties disableLayout: aBool.
	self fullBounds; layoutChanged; changed.