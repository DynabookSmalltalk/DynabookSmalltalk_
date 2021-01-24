updating
updateListSelection: modelIndex
	"Model changed the selection. Invalidate the filtered list if the selection index cannot be found."

	| viewIndex |
	modelIndex = 0 ifTrue: [
		^ self selectionIndex: 0].

	"The the model is inconsistent. Cannot fix here."
	modelIndex > self fullListSize ifTrue: [
		^ self selectionIndex: 0].
		
	"Lookup the view index."
	viewIndex := self viewIndexFor: modelIndex.

	"The filter is preventing us from selecting the item we want - remove it."
	viewIndex = 0 ifTrue: [
		self removeFilter.
		viewIndex := modelIndex].

	self selectionIndex: viewIndex.