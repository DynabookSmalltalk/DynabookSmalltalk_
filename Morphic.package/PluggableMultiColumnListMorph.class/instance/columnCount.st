accessing
columnCount
	"Even an empty column is a column."
	
	^ self getFullList size max: 1