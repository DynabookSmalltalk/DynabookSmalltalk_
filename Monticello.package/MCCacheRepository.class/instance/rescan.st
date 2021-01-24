private
rescan

	self flag: #todo. "This method seems to be unused --pre"
	self newFileNames do:
		[:ea |
		self versionReaderForFileNamed: ea do:
			[:reader |
			(self cacheForPackage: reader package)
				recordVersionInfo: reader info
				forFileNamed: ea.
			self seenFileNames add: ea]]
		displayingProgress: 'Scanning cache...'