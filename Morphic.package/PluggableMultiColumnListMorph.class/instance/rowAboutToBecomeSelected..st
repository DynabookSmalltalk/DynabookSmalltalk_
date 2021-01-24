selection
rowAboutToBecomeSelected: anInteger

	listMorphs do: [:listMorph | listMorph preSelectedRow: anInteger].
	super rowAboutToBecomeSelected: anInteger.