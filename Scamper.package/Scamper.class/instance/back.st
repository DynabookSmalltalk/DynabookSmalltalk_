menus
back
	"The user hit the back button -- go to the previous document"

	currentUrlIndex > 1 ifTrue:
		[currentUrlIndex _ currentUrlIndex - 1.
		currentUrlIndex <= recentDocuments size ifTrue:
			[self displayDocument: (recentDocuments at: currentUrlIndex)]]

"this method is added to Scamper: Aibek 4/18/99"