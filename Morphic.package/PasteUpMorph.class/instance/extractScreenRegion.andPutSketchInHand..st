world menu
extractScreenRegion: poly andPutSketchInHand: hand
	"The user has specified a polygonal area of the Display.
	Now capture the pixels from that region, and put in the hand as a Sketch."
	| screenForm outline topLeft innerForm exterior |
	outline := poly shadowForm.
	topLeft := outline offset.
	exterior := (outline offset: 0@0) anyShapeFill reverse.
	screenForm := Form fromDisplay: (topLeft extent: outline extent).
	screenForm eraseShape: exterior.
	innerForm := screenForm trimBordersOfColor: Color transparent.
	ActiveHand showTemporaryCursor: nil.
	innerForm isAllWhite ifFalse:
		[hand attachMorph: (self drawingClass withForm: innerForm)]