initialization
createScrollBarNamed: aString 
"creates a scroll bar named as aString"
	| result |
	result := ScrollBar new model: self slotName: aString.
	result borderStyle: (BorderStyle inset width: 2).
	^ result