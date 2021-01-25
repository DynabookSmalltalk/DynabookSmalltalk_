tests
getInputForSeconds: seconds onPort: portNum
	"Collect MIDI input from the given port for the given number of seconds, and answer a string describing the data read."
	"MidiPrimTester new getInputForSeconds: 5 onPort: 0"

	| s bufList midiStartTime |
	"collect the data"
	self openPort: portNum andDo: [ | endTime buf n |
		buf := ByteArray new: 1000.
		bufList := OrderedCollection new.
		midiStartTime := self primMIDIGetClock.
		endTime := Time millisecondClockValue + (seconds * 1000).
		[Time millisecondClockValue < endTime] whileTrue: [
			n := self primMIDIReadPort: portNum into: buf.
			n > 0 ifTrue: [bufList add: (buf copyFrom: 1 to: n)].
			(Delay forMilliseconds: 5) wait]].

	"format the data into a string"
	s := WriteStream on: String new.
	s cr.
	bufList do: [:b | | t |
		t := (self bufferTimeStampFrom: b) - midiStartTime.
		s print: t.
		s nextPutAll: ': '.
		5 to: b size do: [:i | s print: (b at: i); space].
		s cr].
	^ s contents
