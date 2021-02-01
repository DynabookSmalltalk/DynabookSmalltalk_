initialization
initialize
	"Initialize the receiver, obeying a #nominalExtent property if I  
	have one"
	| anExtent |
	super initialize.
	""
	anExtent := self
				valueOfProperty: #nominalExtent
				ifAbsent: [((32 @ 32) * RealEstateAgent scaleFactor) truncated].
	self
		extent: (anExtent
				)