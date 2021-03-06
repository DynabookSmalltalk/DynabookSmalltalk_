construction
addLine
	"Append a divider line to this menu. Suppress duplicate lines."

	| colorToUse |
	self hasItems ifFalse: [^ self].
	self lastSubmorph knownName = #line ifTrue: [^ self].
	
	colorToUse := self userInterfaceTheme lineColor ifNil: [Color gray: 0.9].
	self addMorphBack: (Morph new
		color: colorToUse;
		hResizing: #spaceFill;
		height: (self userInterfaceTheme lineWidth ifNil: [2]);
		borderStyle: (self userInterfaceTheme lineStyle ifNil: [BorderStyle inset]);
		borderColor: colorToUse;
		borderWidth: 1;
		name: #line; "see above"
		yourself).