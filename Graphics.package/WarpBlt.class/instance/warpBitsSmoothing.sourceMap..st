primitives
warpBitsSmoothing: n sourceMap: sourceMap
	| deltaP12 deltaP43 pA pB deltaPAB sp fixedPtOne poker pix nSteps |
	<primitive: 'primitiveWarpBits' module: 'BitBltPlugin' error: ec>

	"Check for compressed source, destination or halftone forms"
	"Check for object movement during a surface callback, compressed source, destination or halftone forms.
	 Simply retry."
	(ec == #'object moved'
	 or: [(sourceForm isForm and: [sourceForm unhibernate])
	 or: [(destForm isForm and: [destForm unhibernate])
	 or: [halftoneForm isForm and: [halftoneForm unhibernate]]]]) ifTrue:
		[^self warpBitsSmoothing: n sourceMap: sourceMap].

	(width < 1) | (height < 1) ifTrue: [^ self].
	fixedPtOne := 16384.  "1.0 in fixed-pt representation"
	n > 1 ifTrue:
		[(destForm depth < 16 and: [colorMap == nil])
			ifTrue: ["color map is required to smooth non-RGB dest"
					^ self primitiveFailed].
		pix := Array new: n*n].

	nSteps := height-1 max: 1.
	deltaP12 := (self deltaFrom: p1x to: p2x nSteps: nSteps)
			@ (self deltaFrom: p1y to: p2y nSteps: nSteps).
	pA := (self startFrom: p1x to: p2x offset: nSteps*deltaP12 x)
		@ (self startFrom: p1y to: p2y offset: nSteps*deltaP12 y).
	deltaP43 := (self deltaFrom: p4x to: p3x nSteps: nSteps)
			@ (self deltaFrom: p4y to: p3y nSteps: nSteps).
	pB := (self startFrom: p4x to: p3x offset: nSteps*deltaP43 x)
		@ (self startFrom: p4y to: p3y offset: nSteps*deltaP43 y).

	poker := BitBlt bitPokerToForm: destForm.
	poker clipRect: self clipRect.
	nSteps := width-1 max: 1.
	destY to: destY+height-1 do:
		[:y |
		deltaPAB := (self deltaFrom: pA x to: pB x nSteps: nSteps)
				@ (self deltaFrom: pA y to: pB y nSteps: nSteps).
		sp := (self startFrom: pA x to: pB x offset: nSteps*deltaPAB x)
			@ (self startFrom: pA y to: pB y offset: nSteps*deltaPAB x).
		destX to: destX+width-1 do:
			[:x | 
			n = 1
			ifTrue:
				[poker pixelAt: x@y
						put: (sourceForm pixelValueAt: sp // fixedPtOne asPoint)]
			ifFalse:
				[0 to: n-1 do:
					[:dx | 0 to: n-1 do:
						[:dy |
						pix at: dx*n+dy+1 put:
								(sourceForm pixelValueAt: sp
									+ (deltaPAB*dx//n)
									+ (deltaP12*dy//n)
										// fixedPtOne asPoint)]].
				poker pixelAt: x@y put: (self mixPix: pix
											sourceMap: sourceMap
											destMap: colorMap)].
			sp := sp + deltaPAB].
		pA := pA + deltaP12.
		pB := pB + deltaP43]