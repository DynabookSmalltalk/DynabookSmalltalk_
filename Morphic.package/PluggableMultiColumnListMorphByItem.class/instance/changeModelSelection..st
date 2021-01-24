model access
changeModelSelection: modelIndex
	"Change the model's selected item to be the one at the given index."

	setIndexSelector ifNotNil: [
		model
			perform: setIndexSelector
			with: (modelIndex = 0 ifTrue: [#()] ifFalse: [self getFullList collect: [:column | column at: modelIndex]])].