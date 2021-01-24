printing
joinOn: stream separatedBy: aSeparator

	self
		do: [:ea | stream nextPutAll: ea asString]
		separatedBy: [stream nextPutAll: aSeparator asString].