tests
playScale: mSecsPerNote onPort: portNum
	"MidiPrimTester new playScale: 130 onPort: 0"

	| noteOn noteOff |
	noteOn := #[144 0 100].
	noteOff := #[144 0 0].
	self openPort: portNum andDo: [
		#(60 62 64 65 67 69 71 72 74 72 71 69 67 65 64 62 60) do: [:midiKey | 
			noteOn at: 2 put: midiKey.
			noteOff at: 2 put: midiKey.
			self primMIDIWritePort: portNum from: noteOn at: 0.
			(Delay forMilliseconds: mSecsPerNote - 10) wait.
			self primMIDIWritePort: portNum from: noteOff at: 0.
			(Delay forMilliseconds: 10) wait]].
