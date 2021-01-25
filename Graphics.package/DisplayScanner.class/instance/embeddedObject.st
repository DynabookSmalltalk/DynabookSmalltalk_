stop conditions
embeddedObject

	"We have to set the last displayed index to a value smaller than last index
	in order to prevent the text anchor placeholder character to be printed. For
	details see end of DisplayScanner>>#displayLine:offset:leftInRun:"
	lastDisplayableIndex := lastIndex - 1.
	^ super embeddedObject