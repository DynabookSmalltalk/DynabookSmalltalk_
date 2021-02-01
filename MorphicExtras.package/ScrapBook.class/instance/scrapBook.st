scraps
scrapBook
	| header aButton label |
	^ book ifNil: [
		book := BookMorph new pageSize: 300@300; setNameTo: 'scraps' translated.
		book addCornerGrips.
		book color: Color yellow muchLighter.
		book borderColor: Color darkGray; borderWidth: 2.
		book removeEverything; showPageControls; insertPage.

		header := AlignmentMorph newRow wrapCentering: #center; cellPositioning: #leftCenter.
		header setProperty: #header toValue: true.
		header addMorph: (aButton := ThreePhaseButtonMorph labelSymbol: #'Halo-Collapse').
		aButton target: book;
			actionSelector: #delete;
			setBalloonText: 'Close the trashcan.\(to view again later, click on any trashcan).' withCRs translated.
		header addMorphBack: AlignmentMorph newVariableTransparentSpacer beSticky.
		header addMorphBack: 	(label := UpdatingStringMorph new target: self) beSticky.
		label getSelector: #trashTitle; useStringFormat; step.
		header addMorphBack: AlignmentMorph newVariableTransparentSpacer beSticky.
		header addMorphBack: (aButton := ThreePhaseButtonMorph labelSymbol: #'Halo-Dismiss').
		aButton target: self;
			actionSelector: #maybeEmptyTrash;
			setBalloonText: 'Click here to empty the trash.' translated.
		book currentPage
			layoutPolicy: TableLayout new;
			addMorph: (TextMorph new
				contents: 'Objects you drag into the trash will automatically be saved here, one object per page, in case you need them later.  To disable this feature set the "preserveTrash" Preference to false.\\You can individually expunge objects by hitting the "-" control (behind "..."). You can empty out all the objects in the trash can by hitting the "X" button at top right.' withCRs translated;
				hResizing: #spaceFill).

		book addMorphFront: header.
		book setProperty: #scraps toValue: true].