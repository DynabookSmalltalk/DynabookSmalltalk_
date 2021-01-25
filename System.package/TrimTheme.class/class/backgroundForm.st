instance creation
backgroundForm

	| ref |
	ref := self gray39.

	^ (SqueakTheme linenblue asFormOfDepth: 32) collectColors: [:c | 
		Color
			h:ref hue
			s: ref saturation
			v: c brightness - 0.12
			alpha: c alpha]