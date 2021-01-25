receiving
doAwaitData

	[
		socket := connectionQueue getConnectionOrNilLenient.
		socket ifNil: [
			(Delay forMilliseconds: 50) wait
		] ifNotNil: [
			self class new receiveDataOn: socket for: communicatorMorph
		]
	] repeat
