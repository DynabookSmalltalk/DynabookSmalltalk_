private
mcModel
	"Find my WorkingCopy, use the first mcModel-capable repository in its reposigoryGroup."
	self repositoryGroup ifNotNil:
		[ : group | group repositoriesDo:
			[ : each | each mcModel ifNotNil:
				[ : mcModel | ^ mcModel ] ] ].
	^ nil