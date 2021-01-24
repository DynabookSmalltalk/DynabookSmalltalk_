menu messages
browseItHere
	"Retarget the receiver's window to look at the selected class, if appropriate."

	self wordSelectAndEmptyCheck: [^ morph flash].

	((model isKindOf: Browser) and: [model couldBrowseAnyClass])
		ifFalse: [^ morph flash].
	model okToChange
		ifFalse: [^ morph flash].
			
	self selectedSymbol ifNotNil: [:symbol |
		(model environment classNamed: symbol) ifNotNil: [:class |
			^ model setClass: class]].
	
	morph flash