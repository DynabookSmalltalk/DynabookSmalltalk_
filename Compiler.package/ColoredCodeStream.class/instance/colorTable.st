color/style
colorTable
	"Answer the table to use to determine colors"

	^ colorTable ifNil: [colorTable := ST80ColorTable]