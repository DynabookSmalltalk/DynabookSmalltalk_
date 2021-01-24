layout
privateFullBoundsForRedraw
	"Private. Compute the current submorph bounds *all the way down* to trigger re-draw. Implementation is based on #privateFullBounds and #submorphBounds. Avoid triggering layout computation but return bounds as is."
	
	| box |
	self hasSubmorphs ifFalse: [^ self outerBounds].
	box := self outerBounds copy.
	box := box quickMerge: (self clipSubmorphs 
						ifTrue: [self submorphBoundsForShrinkWrap intersect: self clippingBounds]
						ifFalse: [self submorphBoundsForShrinkWrap]).
	^box origin asIntegerPoint corner: box corner asIntegerPoint