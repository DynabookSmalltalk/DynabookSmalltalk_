drawing
display: item atRow: row on: canvas
	"display the given item at row row"

	| drawBounds emphasized rowColor itemAsText alignment |
	itemAsText := item asStringOrText.
	alignment := self cellPositioning.
	
	"If it is a text, we will only use the first character's emphasis."
	emphasized := itemAsText isText 
		ifTrue: [font emphasized: (itemAsText emphasisAt: 1)] 
		ifFalse: [font].
	
	rowColor := itemAsText isText
		ifTrue: [itemAsText colorAt: 1 ifNone: [self colorForRow: row]]
		ifFalse: [self colorForRow: row].
	
	drawBounds := self drawBoundsForRow: row.
	
	alignment ~= #leftCenter ifTrue: [
		| itemWidth |
		itemWidth := self widthToDisplayItem: item. "includes left/right margins"
		alignment == #center ifTrue: [
			drawBounds := (self center x - (itemWidth / 2) floor) @ drawBounds top corner: (self center x + (itemWidth / 2) ceiling) @ drawBounds bottom].
		alignment == #rightCenter ifTrue: [
			drawBounds := (self right - itemWidth) @ drawBounds top corner: self right @ drawBounds bottom]].

	"Draw icon if existing. Adjust draw bounds in that case."
	drawBounds := drawBounds translateBy: (self cellInset left @ 0).
	(self icon: row) ifNotNil: [ :icon || top |
		top := drawBounds top + ((drawBounds height - self iconExtent y) // 2).
		canvas translucentImage: icon at: drawBounds left @ top.
		drawBounds := drawBounds left: drawBounds left + self iconExtent x + 2 ].
		
	"We will only draw strings here."
	drawBounds := drawBounds translateBy: (0 @ self cellInset top).
	canvas
		drawString: itemAsText asString
		in: drawBounds
		font: emphasized
		color: rowColor.

	"Draw filter matches if any."
	self
		displayFilterOn: canvas
		for: row
		in: drawBounds
		font: emphasized.