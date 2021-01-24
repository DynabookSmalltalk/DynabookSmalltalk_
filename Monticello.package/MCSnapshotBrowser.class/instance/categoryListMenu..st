menus
categoryListMenu: aMenu 
	categorySelection
		ifNotNil: [aMenu
				add: (categorySelection = '*Extensions'
						ifTrue: ['load all extension methods' translated]
						ifFalse: ['load class category {1}' translated format: {categorySelection}])
				action: #loadCategorySelection].
	^ aMenu