private
versionNamesForSelectedPackage
	^ self allVersionNames select:
		(self class browseBranchedVersionsSeparately
			ifTrue: [[:each| each packageAndBranchName = selectedPackage]]
			ifFalse: [[:each| each packageName = selectedPackage]])