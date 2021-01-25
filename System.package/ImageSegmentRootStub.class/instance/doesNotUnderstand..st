fetch from disk
doesNotUnderstand: aMessage 
	 | segmentName |
"Any normal message sent to this object is really intended for another object that is in a non-resident imageSegment.  Reinstall the segment and resend the message."

	segmentName := imageSegment segmentName.
	imageSegment install.
	LoggingFaults ifTrue:		"Save the stack printout to show who caused the fault"
		[FaultLogs at: Time millisecondClockValue printString
			put: (String streamContents:
				[:strm | 
				strm nextPutAll: segmentName; cr.
				strm print: self class; space; print: aMessage selector; cr.
				(thisContext sender stackOfSize: 30)
					do: [:item | strm print: item; cr]])].

	"NOTE:  The following should really be (aMessage sentTo: self)
		in order to recover properly from a fault in a super-send,
		however, the lookupClass might be bogus in this case, and it's
		almost unthinkable that the first fault would be a super send."
	^ self perform: aMessage selector withArguments: aMessage arguments