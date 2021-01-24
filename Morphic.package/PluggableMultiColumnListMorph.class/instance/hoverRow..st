accessing
hoverRow: viewIndex

	hoverRow = viewIndex ifTrue: [^ self].
	listMorphs do: [:listMorph |
		listMorph rowChanged: hoverRow with: viewIndex].
	super hoverRow: viewIndex.