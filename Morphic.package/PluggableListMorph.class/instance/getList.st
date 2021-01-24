model access - cached
getList
	"Answer the (maybe filtered) list to be displayed. Cached result, see #updateList."
	
	^ list ifNil: [
		list := #(). "To make this call safe when re-entering it while fetching the list. This can happen, for example, when the model fetches data that opens the system progress bar which then will redraw periodically."
		list := self filterableList
			ifTrue: [self getFilteredList]
			ifFalse: [self getFullList].
		self updateListMorph.
		list]