menu
addTextAnchorMenuItems: topMenu hand: aHand for: aMorph

	| layoutTypeMenu anchorMenu morphAlignmentMenu lineAlignmentMenu |
	layoutTypeMenu := MenuMorph new defaultTarget: self.
	layoutTypeMenu 
		addUpdating: #hasInlineAnchorString 
		target: self
		selector: #toggleInlineAnchorIn:
		argumentList: {aMorph}.
	layoutTypeMenu 
		addUpdating: #hasDocumentAnchorString 
		target: self
		selector: #toggleDocumentAnchorIn:
		argumentList: {aMorph}.
		
	morphAlignmentMenu := MenuMorph new defaultTarget: self.
	#(morphAlignmentIsBottomString #bottom 
	morphAlignmentIsBaselineString #baseline 
	morphAlignmentIsCenterString #center  
	morphAlignmentIsTopString #top) pairsDo: [:labelGetter :alignment |
		morphAlignmentMenu 
			addUpdating: labelGetter 
			target: self
			selector: #changeMorphAlignmentFor:to:
			argumentList: {aMorph . alignment}].
	
	lineAlignmentMenu := MenuMorph new defaultTarget: self.
	#(lineAlignmentIsBottomString #bottom 
	lineAlignmentIsBaselineString #baseline 
	lineAlignmentIsCenterString #center  
	lineAlignmentIsTopString #top) pairsDo: [:labelGetter :alignment |
		lineAlignmentMenu 
			addUpdating: labelGetter 
			target: self
			selector: #changeLineAlignmentFor:to:
			argumentList: {aMorph . alignment}].
		
	anchorMenu := MenuMorph new defaultTarget: self.
	anchorMenu add: 'layout type' translated subMenu: layoutTypeMenu.
	anchorMenu add: 'morph vertical alignment' translated subMenu: morphAlignmentMenu.
	anchorMenu add: 'line vertical alignment' translated subMenu: lineAlignmentMenu.
		
	topMenu ifNotNil: [topMenu add: 'text anchor' translated subMenu: anchorMenu].
	^ anchorMenu