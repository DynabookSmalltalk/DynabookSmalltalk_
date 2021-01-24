initialization
vertices: verts color: aColor borderWidth: borderWidthInteger borderColor: anotherColor 
	super initialize.
""
	vertices := verts.
	color := aColor.
		
	closed := vertices size > 2.
	arrows := #none.

	self borderStyle
		color: anotherColor;
		width: borderWidthInteger.

	self computeBounds