private-IO
processIO
	"do some as much network IO as possible"

	socketWriterProcess ifNil: [^self].
	self processOutput.
	self processInput.