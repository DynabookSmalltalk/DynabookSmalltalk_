initialization
openInWindowLabeled: aString inWorld: aWorld

	| window extent |

	window := (SystemWindow labelled: aString) model: nil.
	window 
		" guess at initial extent"
		bounds:  (RealEstateAgent initialFrameFor: window initialExtent: self fullBounds extent world: aWorld);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent
		+ (window extent - window layoutBounds extent).
	window extent: extent.
	aWorld addMorph: window.
	window beKeyWindow.
	aWorld startSteppingSubmorphsOf: window.
	^window