private
basicStoreVersion: aMCVersionOrConfiguration 
	self
		writeStreamForFileNamed: aMCVersionOrConfiguration fileName
		do: [ : s | aMCVersionOrConfiguration fileOutOn: s ].
	aMCVersionOrConfiguration isCacheable ifTrue:
		[ cache ifNil: [ cache := Dictionary new ].
		self resizeCache: cache.
		cache
			at: aMCVersionOrConfiguration fileName
			put: aMCVersionOrConfiguration ]