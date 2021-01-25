*nebraska-file in/out
encodedForRemoteCanvas

	^String streamContents: [ :stream |
		stream
			nextPutAll: self familyName;
			space;
			print: self pointSize;
			space;
			print: self emphasis ]