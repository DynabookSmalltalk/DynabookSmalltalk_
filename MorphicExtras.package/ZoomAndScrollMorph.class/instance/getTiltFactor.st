accessing
getTiltFactor

	^panAndTiltFactor ifNil: [panAndTiltFactor := 0.5].
	
