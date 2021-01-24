renaming
handlePackageRename: oldPackageName to: newPackageName 
	"If I'm an extension or override method, rename the category to be prefixed with newPackageName."
	((self isExtensionMethod or: [ self isOverrideMethod ]) and: [ (self category allButFirst beginsWith: newPackageName asLowercase) not ]) ifTrue:
		[ self actualClass organization
			renameCategory: self category
			toBe:
				'*' ,
					(self
						newCategoryNameFor: self category allButFirst
						givenRenameFrom: oldPackageName
						to: newPackageName) asLowercase ]