initialization
destroy
	self stopListening.
	clients do:[:each| each destroy].
	self breakDependents.