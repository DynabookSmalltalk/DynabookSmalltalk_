(PackageInfo named: 'Morphic') postscript: 'PluggableListMorph allSubInstancesDo: [:m |
	m scroller layoutPolicy: TableLayout new.
	m listMorph
		cellPositioning: #leftCenter;
		cellInset: 3@0;
		vResizing: #shrinkWrap;
		removeProperty: #errorOnDraw. "Just in case."
	m updateList.
	m hScrollBarPolicy: #never].
'!
