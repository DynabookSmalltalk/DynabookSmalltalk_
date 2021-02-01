tabs
paneForTabs: tabList 
	"Answer a pane bearing tabs for the given list"
	| aPane |
	tabList do: [:t |
			t color: Color transparent.
			t borderWidth: 1;
				borderColor: Color black].

	aPane := Morph new
				changeTableLayout;
				color: self baseBackgroundColor;
				listDirection: #leftToRight;
				wrapDirection: #topToBottom;
				vResizing: #spaceFill;
				hResizing: #spaceFill;
				cellGap: 6;
				layoutInset: 4;
				listCentering: #center;
				addAllMorphs: tabList;
				yourself.

	aPane width: self layoutBounds width.

	^ aPane