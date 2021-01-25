tests
playNoteOnPort: portNum
	"MidiPrimTester new playNoteOnPort: 0"

	| noteOn noteOff bytesWritten |
	noteOn := #[144 60 100].
	noteOff := #[144 60 0].
	self openPort: portNum andDo: [
		bytesWritten := self primMIDIWritePort: portNum from: noteOn at: 0.
		(Delay forMilliseconds: 500) wait.
		bytesWritten := bytesWritten + (self primMIDIWritePort: portNum from: noteOff at: 0)].

	bytesWritten = 6 ifFalse: [self error: 'not all bytes were sent'].
