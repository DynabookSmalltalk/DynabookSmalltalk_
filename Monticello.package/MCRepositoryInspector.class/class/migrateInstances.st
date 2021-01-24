class initialization
migrateInstances
	self allSubInstancesDo: [:inst |
		#(packageList versionList) do: [:each |
			[(inst findListMorph: each) highlightSelector: nil]
				on: Error do: [:ignore | ]]].