list morph callbacks
fullListSize
	"return the current number of items in the displayed list"
	
	^ self getFullList
		ifEmpty: [0]
		ifNotEmpty: [:columns | columns first size]