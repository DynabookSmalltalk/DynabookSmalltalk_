event handling
mouseMove: anEvent 
	
	| delta |
	self target ifNil: [^ self].
	self target fastFramingOn 
		ifTrue: [delta := self target doFastWindowReframe: self ptName] 
		ifFalse: [
			delta := self referencePoint ifNil: [0@0] ifNotNil: [anEvent position - self referencePoint].
			self referencePoint: anEvent position.
			self apply: delta.
			self bounds: (self bounds origin + delta extent: self bounds extent)].