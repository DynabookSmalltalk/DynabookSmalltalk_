*nebraska-Morphic-Remote
encodeForRemoteCanvas
	"encode this transform into a string for use by a RemoteCanvas"
	^String streamContents: [ :str |
		str nextPutAll: 'Morphic,';
			print: offset x truncated;
			nextPut: $,;
			print: offset y truncated;
			nextPut: $,;
			print: scale asFloat;
			nextPut: $,;
			print: angle asFloat
	]