scanning
messagesSequence
	"Answer a sequence of all the message selectors sent by this method in the order they are sent. Unlike #messages this may include duplicates. Note that both the sources and the decompiled sources might suggest different results. The returned information reflect the actual bytecode."

	^ Array streamContents: [:result |
		self messagesDo: [:selector | result nextPut: selector]]