filtering
nextSelectionIndexFrom: start
	"Return the next selection index that matches the current filter term."
	
	| newViewIndex oldViewIndex startIndex |	
	oldViewIndex := newViewIndex := start \\ (self listSize max: 1) + 1.
	startIndex := newViewIndex.
	
	[ (self itemAt: newViewIndex) asString withBlanksTrimmed asLowercase
		beginsWith: lastKeystrokes ] whileFalse:
			[ (newViewIndex := newViewIndex \\ (self listSize max: 1) + 1) = startIndex ifTrue:
				[ self flash. ^ 0 "Not in list." ] ].
	
	oldViewIndex = newViewIndex ifTrue: [ self flash ].
	
	^ newViewIndex