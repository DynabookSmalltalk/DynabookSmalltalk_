accessing
tail

	tail ifNil: [tail := OM2StreamProxy for: target tail].
	^ tail