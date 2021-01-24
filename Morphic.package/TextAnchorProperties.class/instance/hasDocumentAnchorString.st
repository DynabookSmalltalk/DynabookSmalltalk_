menu
hasDocumentAnchorString

	^ (self anchorLayout == #document
			ifTrue: ['<on>']
			ifFalse: ['<off>'])
		, 'document' translated