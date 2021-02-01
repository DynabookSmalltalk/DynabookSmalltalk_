changing page
startDownloadingStateIn: aDocument  url: aUrl
	"download the state for the given document in a background thread.  signal the foreground when the data has arrived"
	downloadingProcess _ [	
		aDocument allSubentitiesDo: [ :e |
			e downloadState: aUrl ].
		documentQueue nextPut: #stateDownloaded.
		downloadingProcess _ nil. ] newProcess.
	downloadingProcess resume.