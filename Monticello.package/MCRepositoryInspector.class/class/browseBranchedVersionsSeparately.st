class initialization
browseBranchedVersionsSeparately

	<preference: 'Browse branched package versions separately'
	category: 'Monticello'
	description: 'If true, versions of packages on branches will be shown in a separate section from trunk package versions'
	type: #Boolean>
	^BrowseBranchedVersionsSeparately ifNil: [true]