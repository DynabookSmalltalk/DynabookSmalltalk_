*nebraska-Morphic-Remote
encodeForRemoteCanvas
	^String streamContents: [ :str |
		str
			nextPutAll: 'Composite,';
			nextPutAll: '(';
			nextPutAll: globalTransform encodeForRemoteCanvas;
			nextPutAll: ')(';
			nextPutAll: localTransform encodeForRemoteCanvas;
			nextPutAll: ')' ]