layout
myWorldChanged
	| trans |
	trans := self myTransformation.
	self changed.
	self layoutChanged.
	trans ifNotNil:[
		trans extentFromParent: self innerBounds extent.
		bounds := self bounds topLeft extent: trans extent + (self borderWidth * 2).
	].
	self changed.
