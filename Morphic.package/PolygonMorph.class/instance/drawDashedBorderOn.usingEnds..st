drawing
drawDashedBorderOn: aCanvas usingEnds: anArray 
	"Display my border on the canvas. NOTE: mostly copied from  
	drawBorderOn:"
	| bevel topLeftColor bottomRightColor bigClipRect lineColor segmentOffset |
	(self borderColor isNil
			or: [self borderColor isColor
					and: [self borderColor isTransparent]])
		ifTrue: [^ self].
	lineColor := self borderColor.
	bevel := false.
	"Border colors for bevelled effects depend on CW ordering of  
	vertices"
	self borderStyle style == #raised
		ifTrue: [topLeftColor := self color lighter.
			bottomRightColor := self color darker.
			bevel := true].
	self borderStyle style == #inset
		ifTrue: [topLeftColor := owner colorForInsets darker.
			bottomRightColor := owner colorForInsets lighter.
			bevel := true].
	bigClipRect := aCanvas clipRect expandBy: self borderWidth + 1 // 2.
	segmentOffset := self borderDashOffset.
	self
		lineSegmentsDo: [:p1 :p2 | | p1i p2i | 
			p1i := p1 asIntegerPoint.
			p2i := p2 asIntegerPoint.
			self hasArrows
				ifTrue: ["Shorten line ends so as not to interfere with tip  
					of arrow."
					((arrows == #back
								or: [arrows == #both])
							and: [p1 = vertices first])
						ifTrue: [p1i := anArray first asIntegerPoint].
					((arrows == #forward
								or: [arrows == #both])
							and: [p2 = vertices last])
						ifTrue: [p2i := anArray last asIntegerPoint]].
			(closed
					or: ["bigClipRect intersects: (p1i rect: p2i)  
						optimized:"
						((p1i min: p2i)
							max: bigClipRect origin)
							<= ((p1i max: p2i)
									min: bigClipRect corner)])
				ifTrue: [bevel
						ifTrue: [lineColor := (p1i quadrantOf: p2i)
											> 2
										ifTrue: [topLeftColor]
										ifFalse: [bottomRightColor]].
					segmentOffset := aCanvas
								line: p1i
								to: p2i
								width: self borderWidth
								color: lineColor
								dashLength: self borderDashSpec first
								secondColor: self borderDashSpec third
								secondDashLength: self borderDashSpec second
								startingOffset: segmentOffset]]