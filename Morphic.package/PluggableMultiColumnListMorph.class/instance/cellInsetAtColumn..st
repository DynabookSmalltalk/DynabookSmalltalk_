layout
cellInsetAtColumn: columnIndex
	
	^ self cellInsetForColumns
		at: columnIndex
		ifAbsent: [
			"Repeat the inset of the last column or choose the default."
			self cellInsetForColumns
				ifEmpty: [3@0]
				ifNotEmpty: [:paddings | paddings last]]