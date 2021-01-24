release
flushAllCaches
	self allSubInstancesDo: [:ea | ea flushCache]