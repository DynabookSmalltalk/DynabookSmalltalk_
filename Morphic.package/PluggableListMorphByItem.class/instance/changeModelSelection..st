model access
changeModelSelection: anInteger
	"Change the model's selected item to be the one at the given index."

	setIndexSelector ifNotNil: [
		model
			perform: setIndexSelector
			with: (self getFullList at: anInteger ifAbsent: [nil])].