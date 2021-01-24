accessing - features
findFeatures
	
	^ Array streamContents: [:features |
		self findFeaturesDo: [:feature | features nextPut: feature]]