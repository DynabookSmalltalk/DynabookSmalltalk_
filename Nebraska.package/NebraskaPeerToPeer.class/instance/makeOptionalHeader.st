sending
makeOptionalHeader
	"Optional header format is '(key:value;key:value)' and it must not contain spaces. This is designed to be backwards-compatible with old receivers who receive a header as anything up to a space, but only actually use an initial size integer"

	| args p t |
	args := OrderedCollection new.

	p := NebraskaListenerMorph listeningPort.
	(p notNil and: [p ~= self class eToyCommunicationsPorts first])
		ifTrue: [args add: 'port:', p asString].

	t := (Smalltalk classNamed: 'SugarLauncher') ifNotNil: [:l | l current listeningTube].
	t ifNotNil: [args add: 'tube:', t asString].

	^args isEmpty
		ifTrue: ['']
		ifFalse: [String streamContents: [:strm |
			strm nextPut: $(.
			args
				do: [:arg | strm nextPutAll: arg]
				separatedBy: [strm nextPut: $;].
			strm nextPut: $)]].
