printing
longPrintOn: aStream indent: tabs
	"List of all the byte codes in a method with a short description of each"
	(InstructionPrinter on: self) indent: tabs; printInstructionsOn: aStream