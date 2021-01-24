classifying
classifyAllUnclassified

	| organizers |
	organizers := self subject withAllSuperclasses collect: [:ea | ea organization].
	(self listAtCategoryNamed: ClassOrganizer default) do: [:sel | | found |
		found := (organizers collect: [ :org | org categoryOfElement: sel])
			detect: [:ea | ea ~= ClassOrganizer default and: [ ea ~= nil]]
			ifNone: [].
		found ifNotNil: [self classify: sel under: found]].
