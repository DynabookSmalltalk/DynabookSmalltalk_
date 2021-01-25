tests
getPortList
	"Return a string that describes this platform's MIDI ports."
	"MidiPrimTester new getPortList"

	| s portCount dir directionString |
	s := WriteStream on: String new.
	s cr; nextPutAll: 'MIDI Ports:'; cr.
	portCount := self primMIDIGetPortCount.
	0 to: portCount - 1 do: [:i |
		s tab.
		s print: i; nextPutAll: ': '. 
		s nextPutAll: (self primMIDIGetPortName: i).
		dir := self primMIDIGetPortDirectionality: i.
		directionString := dir printString.  "default"
		dir = 1 ifTrue: [directionString := '(in)'].
		dir = 2 ifTrue: [directionString := '(out)'].
		dir = 3 ifTrue: [directionString := '(in/out)'].
		s space; nextPutAll: directionString; cr].
	^ s contents
