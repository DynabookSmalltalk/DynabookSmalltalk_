private
basicStoreVersion: aVersion
	(aVersion isCacheable not or: [self allFileNames includes: aVersion fileName])
		ifFalse: [super basicStoreVersion: aVersion]
