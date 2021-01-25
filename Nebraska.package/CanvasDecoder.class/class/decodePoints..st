decoding
decodePoints: aString
	^(aString findTokens: '|') asArray collect: [ :encPoint | self decodePoint: encPoint ]