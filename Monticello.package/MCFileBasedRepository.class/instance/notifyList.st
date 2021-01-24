notifying
notifyList
	(self allFileNames includes: 'notify') ifFalse: [^ #()].
	^ self readStreamForFileNamed: 'notify' do:
		[:s |
		s upToEnd lines]