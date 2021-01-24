actions
handlePackageRename: oldPackageName to: newPackageName 
	categories do:
		[ : each | (each beginsWith: newPackageName) ifFalse:
			[ | newCategoryName |
			newCategoryName := self
				newCategoryNameFor: each
				givenRenameFrom: oldPackageName
				to: newPackageName.
			(SystemOrganizer default categories includes: newCategoryName) ifTrue: [ SystemOrganizer default removeCategory: newCategoryName ].
			SystemOrganizer default
				renameCategory: each
				toBe: newCategoryName ] ]