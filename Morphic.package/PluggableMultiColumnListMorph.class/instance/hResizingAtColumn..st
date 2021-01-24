layout
hResizingAtColumn: columnIndex
	
	^ self hResizingForColumns
		at: columnIndex
		ifAbsent: [
			"Repeat the resizing strategy of the last column or choose the default."
			self hResizingForColumns
				ifEmpty: [#spaceFill]
				ifNotEmpty: [:strategies | strategies last]]