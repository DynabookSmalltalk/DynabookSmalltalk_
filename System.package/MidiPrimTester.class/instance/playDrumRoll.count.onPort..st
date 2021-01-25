tests
playDrumRoll: mSecsBetweenNotes count: tapCount onPort: portNum
	"MidiPrimTester new playDrumRoll: 75 count: 64 onPort: 0"
	"Play middle-C tapCount times with the given space between notes. This example works best with a short percussive voice, like a drum."
	"Details: This test can be used to investigate the real-time performance of your system. On a 110 MHz PowerPC Mac, this method can genererate very fast and smooth drum rolls up to about 100 beats/sec (10 mSecs between notes). However, many factors can prevent one from seeing this level of performance including a slow CPU, lack of a level-2 cache, networking or other background processes stealing chunks of processor time from Squeak, or a sluggish MIDI synthesizer."
	"Details: By default, this method does an incremental GC on every note. While not really needed for this example, it illustrates a useful technique for real-time processing in Squeak: do an incremental GC when you know you have a few milliseconds of idle time to avoid triggering one during a time-critical task. In this case, we're also using the GC time to provide a small delay between the note-on and note-off events. If the GC time is too short, as it could be on a fast machine, the note may not sound at all unless you add a few milliseconds of additional delay!"
	"Note: This example works best if the VM's millisecond clock has 1 millisecond resolution."

	| gcDuringNote noteOn noteOff endTime waitTime |
	gcDuringNote := true.
	"these events use running status, so the command byte is omitted"
	noteOn := #[ 60 100 ].
	noteOff := #[ 60 0 ].
	self primMIDIOpenPort: portNum readSemaIndex: 0 interfaceClockRate: 1000000.

	"send an initial event with command byte to initiate running status"
	self primMIDIWritePort: portNum from: #[144 60 0] at: 0.

	1 to: tapCount do: [:i |
		endTime := Time millisecondClockValue + mSecsBetweenNotes.
		self primMIDIWritePort: portNum from: noteOn at: 0.
		gcDuringNote
			ifTrue: [
				"do quick GC; takes a few milliseconds and provides the note-down time"
				"Note: if GC is too fast on your machine, you need to add a few mSecs delay!"
				Smalltalk garbageCollectMost]
			ifFalse: [(Delay forMilliseconds: 3) wait].

		self primMIDIWritePort: portNum from: noteOff at: 0.
		waitTime := endTime - Time millisecondClockValue.
		waitTime > 0 ifTrue: [(Delay forMilliseconds: waitTime) wait]].

	self primMIDIClosePort: portNum.
