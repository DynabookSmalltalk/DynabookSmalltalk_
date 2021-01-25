decoding
setTransform: command 
	| transformEnc |
	transformEnc := command second.
	transform := self class decodeTransform: transformEnc