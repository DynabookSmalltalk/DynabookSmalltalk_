menu actions
installAndOpenGitBrowser 
	
	(Smalltalk hasClassNamed: #SquitBrowser)
		ifFalse: [ (UIManager default
					confirm: 'The Git infrastructure and browser is not yet installed.\\Do you want to install the Git Browser?\\(Note that this step requires an internet connection and\may take several minutes.)' withCRs translated
					title: 'Confirm Installation Request' )
			ifTrue: [ Installer
						ensureRecentMetacello;
						installGitInfrastructure.
					TheWorldMainDockingBar updateInstances ]
			ifFalse: [ ^self ] ].
	(Smalltalk classNamed: #SquitBrowser) open.
