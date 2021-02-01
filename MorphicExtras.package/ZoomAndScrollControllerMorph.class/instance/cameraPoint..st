accessing
cameraPoint: aPoint

	target ifNil: [^self].
	target cameraPoint: aPoint