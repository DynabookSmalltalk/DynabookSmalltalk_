tests
getDriverParameters
	"Return a string that describes this platform's MIDI parameters."
	"MidiPrimTester new getDriverParameters"

	| s parameterNames v |
	parameterNames := #(Installed Version HasBuffer HasDurs CanSetClock CanUseSemaphore EchoOn UseControllerCache EventsAvailable FlushDriver ClockTicksPerSec HasInputClock).

	s := WriteStream on: String new.
	s cr.
	1 to: parameterNames size do: [:i |
		v := self primMIDIParameterGet: i.
		s nextPutAll: (parameterNames at: i).
		s nextPutAll: ' = '.
		s print: v; cr].

	s nextPutAll: 'MIDI Echoing is '.
	(self canTurnOnParameter: EchoOn)
		ifTrue: [s nextPutAll: 'supported.'; cr]
		ifFalse: [s nextPutAll: 'not supported.'; cr].

	s nextPutAll: 'Controller Caching is '.
	(self canTurnOnParameter: UseControllerCache)
		ifTrue: [s nextPutAll: 'supported.'; cr]
		ifFalse: [s nextPutAll: 'not supported.'; cr].

	^ s contents
