examples
examplePaint
	"DisplayHostWindow examplePaint inspect"
	"Should
		a) open a window
		b) fork a process to allow painting with mouse
		c) survive saving and re-opening the image
		d) close and terminate the process when clicking close box or pressing ESC or garbage collect
	This relies on the Morphic main loop repeatedly fetching events from Sensor.
	"
	| win evt pen |
	win := DisplayHostWindow extent: 400@400 depth: 32.
	win offset: 50@50; open; windowTitle: 'Paint Test'.
	pen := nil.
	[
		[win isOpen] whileTrue: [
			evt := win nextEvent.
			"check for ESC event"
			((evt at: 1) = EventTypeKeyboard and: [(evt at: 4) = EventKeyChar and: [(evt at: 3) = 27]])
				ifTrue: [win close].
			"process for mouse events"
			(evt at: 1) = EventTypeMouse ifTrue: [
				(evt at: 5) > 0	"button pressed"
					ifTrue: [
						pen ifNil: [
							pen := Pen newOnForm: win.
							pen roundNib: 5; color: Color random.
							pen place: (evt at: 3)@(evt at: 4)].
						pen goto: (evt at: 3)@(evt at: 4)]
					ifFalse: [pen := nil]].
			win forceToScreen.
		].
	] forkNamed: thisContext asString.
	^win