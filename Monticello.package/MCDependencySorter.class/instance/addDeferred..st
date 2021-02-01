private
addDeferred: anItem
	"Add an item to the derred list. Deferred items will be appended to #orderedItems after all nondeferred items. See #wantsToBeOutermost."

	^ deferred add: anItem