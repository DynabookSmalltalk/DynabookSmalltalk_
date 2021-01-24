well-known repositories
inbox
	^ MCRepositoryGroup default repositories
		detect:
			[ : each | each isInbox ]
		ifNone:
			[ MCHttpRepository
				location: MCHttpRepository inboxUrlString
				user: 'squeak'
				password: 'squeak' ]