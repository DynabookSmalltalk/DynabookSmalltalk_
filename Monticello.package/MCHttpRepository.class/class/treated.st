well-known repositories
treated
	^ MCRepositoryGroup default repositories
		detect:
			[ : each | each isTreated ]
		ifNone:
			[ MCHttpRepository
				location: MCHttpRepository treatedUrlString
				user: 'squeak'
				password: 'squeak' ]