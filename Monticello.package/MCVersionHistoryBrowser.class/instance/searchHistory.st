morphic ui
searchHistory
	(UIManager default
		edit: (String streamContents:
			[:s|
			self selectedInfo topologicalAncestors
				do: [:versionInfo | s nextPutAll: versionInfo summary]
				separatedBy: [s cr; cr]])
		label: 'Version History: ', self selectedInfo versionName)
			extent: (0.5@0.9) * Display height