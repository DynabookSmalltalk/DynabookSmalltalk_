geometry - local/global
point: aPoint from: aReferenceMorph

	owner ifNil: [^ aPoint].
	^ (owner transformFrom: aReferenceMorph) globalPointToLocal: aPoint.
