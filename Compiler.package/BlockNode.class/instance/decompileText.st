printing
decompileText
	"Answer a text description of the parse tree whose root is the receiver."

	^ ColoredCodeStream contents: [:strm | self printOn: strm indent: 0]
