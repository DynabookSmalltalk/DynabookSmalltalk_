private-I/O
processEvent: evt 
	"Process a single event. This method is run at high priority."
	| type buttons window |
	type := evt at: 1.

	"Only process main window events, forward others to host window proxies"
	window := evt at: 8.
	(window isNil or: [window isZero]) ifTrue: 
		[window := 1. 
		evt at: 8 put: window].
	window = 1 ifFalse: [
		^Smalltalk at: #HostWindowProxy ifPresent: [:w | w processEvent: evt]].

	"Tackle mouse events and mouse wheel events first"
	(type = EventTypeMouse or: [type = EventTypeMouseWheel])
		ifTrue: [buttons := (ButtonDecodeTable at: (evt at: 5) + 1). 
				evt at: 5 put: (Smalltalk platformName = 'Mac OS'
							ifTrue: [ buttons ]
							ifFalse: [ self mapButtons: buttons modifiers: (evt at: 6) ]).
				self queueEvent: evt.
				type = EventTypeMouse ifTrue: [self processMouseEvent: evt].
				type = EventTypeMouseWheel ifTrue: [self processMouseWheelEvent: evt].				
				^self].
	
	"Store the event in the queue if there's any"
	type = EventTypeKeyboard
		ifTrue: [ "Check if the event is a user interrupt"
			((evt at: 4) = EventKeyChar
				and: [((evt at: 3)
						bitOr: (((evt at: 5)
							bitAnd: 8)
							bitShift: 8))
							= interruptKey])
					ifTrue: ["interrupt key is meta - not reported as event"
							^ interruptSemaphore signal].
			"Decode keys for characters (i.e., duplicate or swap, ctrl <-> alt/cmd)."
			(evt at: 4) = EventKeyChar
				ifTrue: [ | unicode ascii |
					"Copy lookup key first in case of key swap."
					unicode := {evt at: 6. evt at: 5}.
					ascii := {evt at: 3. evt at: 5}.
					KeyDecodeTable "Unicode character first"
						at: unicode
						ifPresent: [:a | evt at: 6 put: a first;
								 at: 5 put: a second]. 
					KeyDecodeTable "ASCII character second"
						at: ascii
						ifPresent: [:a | evt at: 3 put: a first;
								 at: 5 put: a second]]. 
			self queueEvent: evt. 
			self processKeyboardEvent: evt . 
			^self ].
				
	"Handle all events other than Keyboard or Mouse."
	self queueEvent: evt.
	