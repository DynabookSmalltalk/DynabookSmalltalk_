accessing
cameraScale: aNumber

	target ifNil: [^self].
	target changeScaleTo: aNumber