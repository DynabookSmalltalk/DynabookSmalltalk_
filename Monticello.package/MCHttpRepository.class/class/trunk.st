well-known repositories
trunk
	^ MCRepositoryGroup default repositories
		detect:
			[ : each | each isTrunk ]
		ifNone:
			[ MCHttpRepository
				location: MCHttpRepository trunkUrlString
				user: 'squeak'
				password: 'squeak' ]