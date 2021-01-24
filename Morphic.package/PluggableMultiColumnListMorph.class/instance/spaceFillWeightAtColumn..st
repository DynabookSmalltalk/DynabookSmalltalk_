layout
spaceFillWeightAtColumn: columnIndex
	
	^ self spaceFillWeightForColumns
		at: columnIndex
		ifAbsent: [
			"Repeat the weight of the last column or choose the default."
			self spaceFillWeightForColumns
				ifEmpty: [1]
				ifNotEmpty: [:weights | weights last]]