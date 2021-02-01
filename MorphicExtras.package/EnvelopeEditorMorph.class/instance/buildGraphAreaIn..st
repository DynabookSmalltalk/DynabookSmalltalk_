construction
buildGraphAreaIn: frame
	| r y |
	graphArea := RectangleMorph
		newBounds: ((frame left + 15) @ (frame top + 15)
		corner: (frame right+1) @ (frame bottom - 70))
		color: Color lightGreen lighter lighter.
	graphArea borderWidth: 1.
	self addMorph: graphArea.
	(envelope updateSelector = #pitch: and: [envelope scale <= 2.0]) ifTrue:
		["Show half-steps"
		r := graphArea innerBounds.
		0.0 to: 1.0 by: 1.0/12.0/envelope scale do:
			[:val |
			y := self yFromValue: val.
			graphArea addMorph: ((RectangleMorph
					newBounds: (r left@y extent: r width@1)
					color: Color veryLightGray)
						borderWidth: 0)]].
	(envelope updateSelector = #ratio: and: [denominator ~= 9999]) ifTrue:
		["Show denominator gridding"
		r := graphArea innerBounds.
		(0.0 to: 1.0 by: 1.0/denominator/envelope scale) do:
			[:v |
			y := self yFromValue: v.
			graphArea addMorph: ((RectangleMorph
					newBounds: (r left@y extent: r width@1)
					color: Color veryLightGray)
						borderWidth: 0)]].
