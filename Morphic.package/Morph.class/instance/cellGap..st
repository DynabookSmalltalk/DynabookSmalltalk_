layout-properties
cellGap: aNumber
	"Layout specific. This property specifies an extra space *between* cells in the layout."
	self assureTableProperties cellGap: aNumber.
	self layoutChanged.