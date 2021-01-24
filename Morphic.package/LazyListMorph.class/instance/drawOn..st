drawing
drawOn: aCanvas

	| topRow bottomRow |
	self backgroundColor ifNotNil: [:color |
		aCanvas fillRectangle: (self topLeft corner: self right @ ((self owner ifNil: [self]) bottom)) color: color].

	self getListSize = 0 ifTrue: [ ^self ].
	
	self drawPreSelectionOn: aCanvas.
	
	topRow := self topVisibleRowForCanvas: aCanvas.
	bottomRow := self bottomVisibleRowForCanvas: aCanvas.

	"Draw multi-selection."
	self listSource hasMultiSelection ifTrue: [
		topRow to: bottomRow do: [ :row |
			(self listSource itemSelectedAmongMultiple: row) ifTrue: [
				self drawBackgroundForMulti: row on: aCanvas ] ] ].
	self drawSelectionOn: aCanvas.

	"Draw hovered row if preference enabled."
	PluggableListMorph highlightHoveredRow ifTrue: [
		self listSource hoverRow > 0 ifTrue: [
			self highlightHoverRow: listSource hoverRow on: aCanvas ] ].

	"Draw all visible rows."
	topRow to: bottomRow do: [ :row |
		self display: (self item: row) atRow: row on: aCanvas ].

	"Finally, highlight drop row for drag/drop operations.."
	self listSource potentialDropRow > 0 ifTrue: [
		self highlightPotentialDropRow: self listSource potentialDropRow on: aCanvas ].