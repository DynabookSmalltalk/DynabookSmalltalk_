private-files
filterFileNames: aCollection forVersionNamed: aMCVersionName 
	^ aCollection select:
		[ : ea | aMCVersionName = ea ]