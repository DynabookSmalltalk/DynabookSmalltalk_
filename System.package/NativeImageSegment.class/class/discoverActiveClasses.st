testing
discoverActiveClasses   "NativeImageSegment discoverActiveClasses" 
	"Run this method, do a few things, maybe save and resume the image.
	This will leave unused classes with MDFaults.
	You MUST follow this soon by activeClasses, or by swapOutInactiveClasses."

	"NOTE:  discoverActiveClasses uses Squeak's ability to detect and recover from faults due to a nil method dictionary.  It staches the method dict in with the organization during the time when discovery is in progress (Gag me with a spoon).  This is why the faults need to be cleared promptly before resuming normal work with the system.  It is also important that classes *do not* refer directly to their method dictionary, but only via the accessor message."
	
	Smalltalk allClasses do:
		[:c | | ok | ok := true.
		#(Array Object Class Message MethodDictionary) do:
			[:n | ((Smalltalk at: n) == c or:
				[(Smalltalk at: n) inheritsFrom: c]) ifTrue: [ok := false]].
		ok ifTrue: [c induceMDFault]].
"
	NativeImageSegment discoverActiveClasses.
		-- do something typical --
	PopUpMenu notify: NativeImageSegment activeClasses size printString , ' classes were active out of ' ,
			Smalltalk allClasses size printString.
"