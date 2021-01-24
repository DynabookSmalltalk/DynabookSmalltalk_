repository-api
allPackageNames
	^ repositories
		inject: Set new
		into:
			[ : set : each | set
				 addAll: each allPackageNames ;
				 yourself ]