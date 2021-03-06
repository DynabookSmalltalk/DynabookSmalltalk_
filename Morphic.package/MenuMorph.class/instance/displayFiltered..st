keyboard control
displayFiltered: evt
	| matchStr allItems matches feedbackMorph |
	matchStr := self valueOfProperty: #matchString.
	allItems := self submorphs select: [:m | m isKindOf: MenuItemMorph].
	matches :=  allItems select: [:m | | isMatch | 
		isMatch := 
			matchStr isEmpty or: [
				m contents includesSubstring: matchStr caseSensitive: false].
		m isEnabled: isMatch.
		isMatch].
	feedbackMorph := self valueOfProperty: #feedbackMorph.
	feedbackMorph ifNil: [
		feedbackMorph := TextMorph new
			color: Color darkGray;
			yourself.
		self
			addLine;
			addMorphBack: feedbackMorph lock.
		self setProperty: #feedbackMorph toValue: feedbackMorph.
		self fullBounds.  "Lay out for submorph adjacency"].
	feedbackMorph contents: '<', matchStr, '>'.
	matchStr isEmpty ifTrue: [
		feedbackMorph delete.
		self submorphs last delete.
		self removeProperty: #feedbackMorph].
	" This method is invoked with evt = nil from MenuMorph >> removeMatchString. 
	The current implementation can't select an item without an event. "
	(evt notNil and: [ matches size >= 1 ]) ifTrue: [
		self selectItem: matches first event: evt]