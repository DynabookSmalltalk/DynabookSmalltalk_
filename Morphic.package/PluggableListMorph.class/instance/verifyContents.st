updating
verifyContents
	"Verify the contents of the receiver, reconstituting if necessary.  Called whenever window is reactivated, to react to possible structural changes.  Also called periodically in morphic if the smartUpdating preference is true"

	| currentList modelList modelIndex |
	self flag: #performance. "mt: We do have changed/update. Why can't the tools communicate through an appropriate notifier such as the SystemChangeNotifier?"

	"1) Is the list still up to date?"
	currentList := fullList. fullList := nil.
	modelList := self getFullList.
	modelList = currentList
		ifFalse: [self updateList: modelList].
	
	"2) Is the selection still up to date?"
	modelIndex := self getCurrentSelectionIndex.
	(self modelIndexFor: self selectionIndex) = modelIndex
		ifFalse: [self updateListSelection: modelIndex].