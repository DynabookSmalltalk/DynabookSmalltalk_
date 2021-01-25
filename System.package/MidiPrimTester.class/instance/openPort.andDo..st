private
openPort: portNum andDo: aBlock
	"Open the given MIDI port, evaluate the block, and close the port again. Answer the value of the block."

	| result |
	self primMIDIClosePort: portNum.
	self primMIDIOpenPort: portNum readSemaIndex: 0 interfaceClockRate: 1000000.
	result := aBlock value.
	self primMIDIClosePort: portNum.
	^ result
