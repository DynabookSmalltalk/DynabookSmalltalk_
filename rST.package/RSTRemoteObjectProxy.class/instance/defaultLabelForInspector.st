user interface
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the 
	receiver. "
	| remoteLabel |
	remoteLabel _ self
				xxxSend: (Message selector: #defaultLabelForInspector).
	^ 'Remote Object: ' , remoteLabel , ' (' , remoteObjectID asString , ')'