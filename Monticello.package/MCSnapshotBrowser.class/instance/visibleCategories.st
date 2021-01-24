listing
visibleCategories

	| visibleCategories |
	visibleCategories := Set new.
	self packageOrganizations do: [ :each | visibleCategories addAll: each categories ].
	self packageClasses do: [ :each | visibleCategories add: each category ].
	self hasExtensions ifTrue: [ visibleCategories add: self extensionsCategory ].
	^visibleCategories sorted: [:each | each ifNil: ['~(put nils to the end)']] ascending