*System-Files-error handling
defaultAction
	| selection |
	selection := UIManager default
		chooseFrom: #('delete version in target directory' 'cancel' )
		title: fileName , ' already exists'.
	^ selection = 1.