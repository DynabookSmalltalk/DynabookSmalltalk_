public access
parse: sourceStreamOrString class: behavior

	^ self parse: sourceStreamOrString readStream class: behavior
		noPattern: false notifying: nil ifFail: [^nil]