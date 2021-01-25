as yet unclassified
killOldServers

	NebraskaServerMorph allInstances do: [ :each |
		each delete.
	].
	NebraskaServer allInstances do: [ :each |
		each stopListening.
		DependentsFields removeKey: each ifAbsent: [].
	].
