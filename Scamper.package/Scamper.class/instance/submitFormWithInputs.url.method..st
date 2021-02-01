changing page
submitFormWithInputs: inputs  url: url  method: method
	"Submit the current form with the given arguments"

	| newUrl newSource | 
	self stopEverything.

	(method asLowercase ~= 'get' and: [ method asLowercase ~= 'post' ]) ifTrue:
		[self inform: ('unknown FORM method: {1}' translated format:{method}).
		^ false ].

	newUrl _ url asUrlRelativeTo: currentUrl.	

	newUrl schemeName ~= 'http' ifTrue:
		[self inform: 'I can only submit forms via HTTP' translated.
		^ false].

	self status: 'submitting form...' translated.

	downloadingProcess _
			[method asLowercase = 'get' 
				ifTrue: [newSource _ newUrl retrieveContentsArgs: inputs] 
				ifFalse: [newSource _ newUrl postFormArgs: inputs].
			documentQueue nextPut:  newSource.

			downloadingProcess _ nil] newProcess.
	downloadingProcess resume.
	
	self addNextToRecentDocuments.
	^ true
