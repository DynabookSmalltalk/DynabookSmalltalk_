ui-support
browseClassRevisionsService
	^ ServiceAction
		id: #browseMcClassRevisions
		text: 'browse revisions'
		button: 'mc'
		description: 'Browse revisions of this class definition from the first-listed HTTP repository of this package.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseMcClassRevisions ]
		condition:
			[ : aBrowserRequestor | true ]