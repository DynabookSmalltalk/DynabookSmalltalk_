selection
selectionIndex: viewIndex

	listMorphs do: [:listMorph | listMorph selectedRow: (viewIndex min: self listSize)].	
	super selectionIndex: viewIndex.