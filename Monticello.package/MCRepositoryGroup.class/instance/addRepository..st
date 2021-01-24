update
addRepository: aRepository
	((repositories includes: aRepository) or: [aRepository == MCCacheRepository default])
		ifFalse: [repositories add: aRepository.
				self class default addRepository: aRepository].
	self changed: #repositories