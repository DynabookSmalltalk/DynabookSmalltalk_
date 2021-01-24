updating
updateListFilter

	| selection |
	selection := self selectionIndex = 0 "Avoid fetching #getList here."
		ifTrue: [nil]
		ifFalse: [self selection].

	list := nil.
	modelToView := Dictionary new.
	viewToModel := Dictionary new.
	
	self getList.
	
	"Try to restore the last selection."
	selection ifNotNil: [self selection: selection].