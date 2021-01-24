update
demoteRepository: aMCRepository 
	"If aMCRepository is part of this Group, demote it to the bottom of the list so that other repositories will be checked first."
	| removed |
	removed := repositories
		remove: aMCRepository
		ifAbsent: [  ].
	removed ifNotNil:
		[ repositories addLast: aMCRepository.
		self changed: #repositories ]