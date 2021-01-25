private-events
queueEvent: evt
	"Queue the given event in the event queue (if any).
	Note that the event buffer must be copied since it
	will be reused later on."
	eventQueue ifNil: [^self].	"queue gets created by client"
	eventQueue nextPut: evt shallowCopy.
