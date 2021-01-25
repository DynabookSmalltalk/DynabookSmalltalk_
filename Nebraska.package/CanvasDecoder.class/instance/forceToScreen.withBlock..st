decoding
forceToScreen: aCommand  withBlock: forceBlock
	| region |
	region := self class decodeRectangle: aCommand second.
	forceBlock value: region.