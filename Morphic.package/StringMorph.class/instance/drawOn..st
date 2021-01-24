drawing
drawOn: aCanvas

	aCanvas
		drawString: self contents
		in: self bounds
		font: self fontToUse
		color: self color.