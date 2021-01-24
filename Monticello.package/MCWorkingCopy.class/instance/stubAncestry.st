operations
stubAncestry
	"Stub all but the most recent 10 of my ancestry tree to save memory with a proxy which can be transparently accessed later, if necessary."
	self ancestors ifEmpty: [ ^ self ].
	repositoryGroup ifNotNil:
		[ | tenAgo count |
		count := 0.
		ancestry ancestorsDoWhileTrue:
			[ : each | tenAgo := each.
			(count := count + 1) < 10 ].
		tenAgo
			stubAncestryFor: self
			using: repositoryGroup ]