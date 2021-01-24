updating
updateColumns
	"The number of columns must match the number of list morphs."
	
	| columnsChanged |
	columnsChanged := self columnCount ~= listMorphs size.
	
	[self columnCount < listMorphs size]
		whileTrue: [
			listMorphs removeLast delete].
	
	[self columnCount > listMorphs size]
		whileTrue: [
			listMorphs addLast: self createListMorph.
			self scroller addMorphBack: listMorphs last].
	
	listMorphs doWithIndex: [:listMorph :columnIndex |
		listMorph
			columnIndex: columnIndex;
			color: self textColor;
			cellPositioning: (self cellPositioningAtColumn: columnIndex);
			cellInset: (self cellInsetAtColumn: columnIndex);
			hResizing: (self hResizingAtColumn: columnIndex);
			spaceFillWeight: (self spaceFillWeightAtColumn: columnIndex)].
		
	columnsChanged ifTrue: [self setListParameters].