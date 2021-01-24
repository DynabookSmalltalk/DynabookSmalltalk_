drawing
displayFilterOn: canvas for: row in: drawBounds font: font
	"Draw filter matches if any."
	
	| fillStyle fillHeight |
	self showFilter ifFalse: [^ self].
	
	fillHeight := font height.
	fillStyle := self filterColor isColor
		ifTrue: [SolidFillStyle color: self filterColor]
		ifFalse: [self filterColor].
	fillStyle isGradientFill ifTrue: [
		fillStyle origin: drawBounds topLeft.
		fillStyle direction: 0@ fillHeight].
	
	(self filterOffsets: row) do: [:offset |
		| highlightRectangle |
		highlightRectangle := ((drawBounds left + offset first first) @ drawBounds top
			corner: (drawBounds left + offset first last) @ (drawBounds top + fillHeight)).
		canvas
			frameAndFillRoundRect: (highlightRectangle outsetBy: 1@0)
			radius: (3 * RealEstateAgent scaleFactor) truncated
			fillStyle: fillStyle
			borderWidth: (1 * RealEstateAgent scaleFactor) truncated
			borderColor: fillStyle asColor twiceDarker.
		canvas
			drawString: offset second
			in: highlightRectangle
			font: font
			color: self filterTextColor].