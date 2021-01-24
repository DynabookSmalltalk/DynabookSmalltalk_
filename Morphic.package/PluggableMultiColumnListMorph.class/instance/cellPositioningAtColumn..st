layout
cellPositioningAtColumn: columnIndex
	
	^ self cellPositioningForColumns
		at: columnIndex
		ifAbsent: [
			"Repeat the alignment of the last column or choose the default."
			self cellPositioningForColumns
				ifEmpty: [#leftCenter]
				ifNotEmpty: [:alignments | alignments last]]