world state
restoreMorphicDisplay

	self removeProperty: #shouldDisplayWorld.

	ThumbnailMorph recursionReset.
	
	self
		extent: Display extent;
		viewBox: Display boundingBox;
		handsDo: [:h | h visible: true; showTemporaryCursor: nil];
		restoreFlapsDisplay;
		restoreMainDockingBarDisplay;
		fullRepaintNeeded.
		
	WorldState
		addDeferredUIMessage: [Cursor normal show].
