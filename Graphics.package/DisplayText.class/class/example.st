examples
example
	"Continually prints two lines of text wherever you point with the cursor.  Terminate by pressing any button on the
	mouse."
	| tx |
	tx := 'this is a line of characters and
this is the second line.' asDisplayText.
	tx foregroundColor: Color black backgroundColor: Color transparent.
	tx := tx alignedTo: #center.
	[Sensor anyButtonPressed]
		whileFalse:
			[tx displayOn: Display at: Sensor cursorPoint]

	"DisplayText example."