actions
reorderCategories: allCategories original: oldCategories
	| first locallyAddedCategories |
	first := allCategories detect: [:ea | categories includes: ea]
		ifNone: [^ allCategories, categories].
	locallyAddedCategories := (oldCategories copyWithoutAll: categories) select: [:cat |
		(SystemOrganization listAtCategoryNamed: cat) notEmpty].
	^ 	((allCategories copyUpTo: first) copyWithoutAll: oldCategories, categories),
		categories,
		locallyAddedCategories,
		((allCategories copyAfter: first) copyWithoutAll: oldCategories, categories)
