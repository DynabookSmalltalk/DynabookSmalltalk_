layout
checkCellSpacingProperty: aSymbol
	
	aSymbol == #none ifTrue: [^ self].
	
	aSymbol == #globalRect ifTrue: [^ self].
	aSymbol == #globalSquare ifTrue: [^ self].
	aSymbol == #localRect ifTrue: [^ self].
	aSymbol == #localSquare ifTrue: [^ self].
	
	Error signal: 'Invalid cell-spacing property. Use #none, #globalRect, #globalSquare, #localRect, or #localSquare.'.