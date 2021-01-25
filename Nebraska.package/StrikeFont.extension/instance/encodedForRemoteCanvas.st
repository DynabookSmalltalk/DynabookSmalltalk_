*nebraska-file in/out
encodedForRemoteCanvas

	^String streamContents: [ :stream |
		stream
			nextPutAll: self familyName;
			space;
			nextPutAll: self name;
			space;
			print: self height;
			space;
			print: self emphasis ]