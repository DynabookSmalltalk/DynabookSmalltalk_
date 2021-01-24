accessing
visibleRowCount
	"Take the size of the first column. We treat all columns equally."

	^ self getList
		ifEmpty: [0]
		ifNotEmpty: [:columns | columns first size]