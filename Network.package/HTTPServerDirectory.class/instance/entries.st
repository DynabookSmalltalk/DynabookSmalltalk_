file directory
entries 
	| answer ftpEntries |
	answer := HTTPSocket httpGetDocument: self dirListUrl.
	answer isString
		ifTrue: [^self error: 'Listing failed: ' , answer]
		ifFalse: [answer := answer content].
	answer first = $<
		ifTrue: [self error: 'Listing failed: ' , answer].
	ftpEntries := answer lines.
	^ ftpEntries 
		collect:[:ftpEntry | self class parseFTPEntry: ftpEntry]
		thenSelect: [:entry | entry notNil]