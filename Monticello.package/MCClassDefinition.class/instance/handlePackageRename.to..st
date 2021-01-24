renaming
handlePackageRename: oldPackageName to: newPackageName 
	(self actualClass category beginsWith: newPackageName) ifFalse:
		[ self actualClass category:
			(self
				newCategoryNameFor: self actualClass category
				givenRenameFrom: oldPackageName
				to: newPackageName) ]