updating
updateList: modelList
	"Keeps the current filter as it is."
	
	fullList := modelList.
	self resetPotentialDropRow.
	self updateListFilter.