events
processEvent: evt
	"evt is a raw event buffer from VM. Pass it on to the appropiate proxy."
	self registry keys do: [:proxy |
		(proxy wantsEvent: evt) ifTrue: [proxy processEvent: evt]].
