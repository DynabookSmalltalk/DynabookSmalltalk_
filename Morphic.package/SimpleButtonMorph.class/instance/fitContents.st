layout
fitContents
	| aMorph aCenter |
	aCenter := self center.
	self hasSubmorphs ifFalse: [^self].
	aMorph := self firstSubmorph.
	self extent: aMorph extent + (self borderWidth + 6).
	self center: aCenter.
	aMorph position: aCenter - (aMorph extent // 2)