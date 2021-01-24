rotate scale and flex
rotationCenter
	| pt |
	pt := self transform localPointToGlobal: super rotationCenter.
	^pt - bounds origin / bounds extent asFloatPoint