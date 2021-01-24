ui-support
browseMethodRevisionsService
	^ ServiceAction
		id: #browseMcMethodRevisions
		text: 'browse revisions'
		button: 'mc'
		description: 'Browse revisions of this method from the first-listed HTTP repository of this package.'
		action:
			[ : aBrowserRequestor | aBrowserRequestor browseMcMethodRevisions ]
		condition:
			[ : aBrowserRequestor | true ]