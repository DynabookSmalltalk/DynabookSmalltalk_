renaming
newCategoryNameFor: categoryName givenRenameFrom: oldPackageName to: newPackageName 
	^ oldPackageName size < categoryName size
		ifTrue:
			[ newPackageName ,
				(categoryName
					copyFrom: oldPackageName size + 1
					to: categoryName size) ]
		ifFalse: [ newPackageName ]