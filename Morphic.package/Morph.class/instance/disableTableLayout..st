layout-properties
disableTableLayout: aBool
	"Layout specific. Disable laying out the receiver in table layout"
	
	self fullBounds; layoutChanged.
	self assureLayoutProperties disableTableLayout: aBool.
	self fullBounds; layoutChanged; changed.