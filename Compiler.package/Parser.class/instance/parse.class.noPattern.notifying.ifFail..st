public access
parse: sourceStream class: class noPattern: noPattern notifying: req ifFail: aBlock 
	| c |
	c := CompilationCue
			source: sourceStream
			class: class
			requestor: req.
	^ self 
		parseCue: c 
		noPattern: noPattern 
		ifFail: aBlock