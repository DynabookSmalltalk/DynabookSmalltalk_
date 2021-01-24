layout
checkResizingProperty: aSymbol

	aSymbol == #rigid ifTrue: [^ self].
	aSymbol == #shrinkWrap ifTrue: [^ self].
	aSymbol == #spaceFill ifTrue: [^ self].
	
	Error signal: 'Invalid value for resizing property. Use #rigid, #shrinkWrap, or #spaceFill.'.