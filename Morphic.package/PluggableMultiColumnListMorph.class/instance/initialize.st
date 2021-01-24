initialization
initialize

	listMorphs := #().
	super initialize.

	self scroller
		listDirection: #leftToRight;
		cellPositioning: #topLeft.
		
	listMorphs := OrderedCollection with: listMorph.