private-initialization
initialize: aSocket
	socket := aSocket.
	inBuf := String new: 1000.
	inBufIndex := 1.
	inBufLastIndex := 0.

	outBuf := nil.

	inObjects := OrderedCollection new.
	outObjects := OrderedCollection new.
