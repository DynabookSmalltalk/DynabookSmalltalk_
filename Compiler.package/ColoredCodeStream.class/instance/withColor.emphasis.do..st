color/style
withColor: colorSymbol emphasis: emphasisSymbol do: aBlock
	"Evaluate the given block with the given color and style text attribute"

	^ self withAttributes: {TextColor color: (Color perform: colorSymbol).
							TextEmphasis perform: emphasisSymbol}
		do: aBlock