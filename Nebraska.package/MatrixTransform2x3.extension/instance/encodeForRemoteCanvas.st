*nebraska-Morphic-Remote
encodeForRemoteCanvas
	"encode this transform into a string for use by a RemoteCanvas"
	^String streamContents: [ :str |
		str nextPutAll: 'Matrix,'.
		1 to: 6 do: [ :i |
			str print: (self basicAt: i).
			str nextPut: $, ].
	]