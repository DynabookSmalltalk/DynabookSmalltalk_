private-IO
inBufSize

	inBuf ifNil: [^0].
	^inBufLastIndex - inBufIndex + 1