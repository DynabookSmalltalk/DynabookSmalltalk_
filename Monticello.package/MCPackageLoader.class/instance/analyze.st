private
analyze
	| sorter |
	sorter := self sorterForItems: additions.
	additions := sorter orderedItems.
	requirements := sorter externalRequirements.
	unloadableDefinitions := sorter itemsWithMissingRequirements sorted.
	
	self forgetSuperfluousMethodRemovals.
	sorter := self sorterForItems: removals.
	removals := sorter orderedItems reversed.