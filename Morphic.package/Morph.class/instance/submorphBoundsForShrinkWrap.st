layout
submorphBoundsForShrinkWrap
	"Private. Compute the submorph bounds of the receiver to shrink-wrap around. Note that we are not interested in my submorphs' fullBounds. For full-bound wrapping, use #shrinkWrap all the way down."
	
	| box |
	self submorphsDo: [:m |
		m visible ifTrue: [
			box 
				ifNil:[box := m bounds copy]
				ifNotNil:[box := box quickMerge: m bounds]]].
	box ifNil:[^ self layoutBounds]. "e.g., having submorphs but not visible"
	^ box origin asIntegerPoint corner: box corner asIntegerPoint