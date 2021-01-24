accessing
rowCount
	
	^ self getFullList
		ifEmpty: [0]
		ifNotEmpty: [:columns | columns first size]