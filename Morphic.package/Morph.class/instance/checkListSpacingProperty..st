layout
checkListSpacingProperty: aSymbol
	
	aSymbol == #none ifTrue: [^ self].
	aSymbol == #equal ifTrue: [^ self].
	
	Error signal: 'Invalid value for list-spacing property. Use #none or #equal.'.