color/style
withStyleFor: elementType do: aBlock
	"Evaluate aBlock with appropriate emphasis and color for the given elementType"

	| colorAndStyle |
	colorAndStyle := self colorTable at: elementType.
	^ self withColor: colorAndStyle first emphasis: colorAndStyle second do: aBlock