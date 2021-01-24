anchors
anchorMorph: aMorph at: aPoint type: anchorType
	
	| relPt index newText block |
	aMorph owner == self ifTrue:[self removeMorph: aMorph].
	self addMorphFront: aMorph.
	
	relPt := self transformFromWorld globalPointToLocal: aPoint.
	index := (self paragraph characterBlockAtPoint: relPt) stringIndex.
	newText := Text string: Character startOfHeader asString attribute: (TextAnchor new anchoredMorph: aMorph).
	anchorType == #inline ifTrue:[
			self paragraph replaceFrom: index to: index-1 with: newText displaying: false].
	anchorType == #document ifTrue: [
			index := index min: paragraph text size.
			index := paragraph text string lastIndexOf: Character cr startingAt: index.
			block := paragraph characterBlockForIndex: index+1.
			aMorph textAnchorProperties positionInDocument: (relPt x - bounds left) @ (relPt y - block top).
			self paragraph replaceFrom: index+1 to: index with: newText displaying: false].
	
	self fit.