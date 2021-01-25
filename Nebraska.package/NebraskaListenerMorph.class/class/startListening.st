as yet unclassified
startListening

	self stopListening.
	GlobalListener := NebraskaPeerToPeer new awaitDataFor: self.
	self bumpUpdateCounter.

