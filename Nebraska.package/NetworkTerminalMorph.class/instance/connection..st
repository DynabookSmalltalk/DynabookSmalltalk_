initialization
connection: aConnection

	connection := aConnection.
	decoder := CanvasDecoder connection: aConnection.
	eventEncoder := MorphicEventEncoder on: aConnection.