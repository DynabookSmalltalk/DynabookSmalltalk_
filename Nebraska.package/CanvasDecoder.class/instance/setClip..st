decoding
setClip: command 
	| clipRectEnc |
	clipRectEnc := command second.
	clipRect := self class decodeRectangle: clipRectEnc