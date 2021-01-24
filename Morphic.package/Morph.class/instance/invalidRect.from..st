change reporting
invalidRect: aRectangle from: aMorph
	| damageRect |
	self visible ifFalse: [ ^self ].
	aRectangle hasPositiveExtent ifFalse: [ ^self ].
	damageRect := aRectangle.
	aMorph == self ifFalse:[
		"Clip to receiver's clipping bounds if the damage came from a child"
		self clipSubmorphs 
			ifTrue:[damageRect := aRectangle intersect: self clippingBounds]].
	owner ifNotNil: [owner invalidRect: damageRect from: self].