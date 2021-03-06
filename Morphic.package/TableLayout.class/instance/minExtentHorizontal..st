optimized
minExtentHorizontal: aMorph 
	"Return the minimal size aMorph's children would require given the new bounds"

	| insetExtra gap minX minY maxX maxY n size width height |
	size := properties minCellSize asPoint.
	minX := size x.
	minY := size y.
	size := properties maxCellSize asPoint.
	maxX := size x.
	maxY := size y.
	insetExtra := properties cellInset.
	insetExtra isRectangle
		ifTrue: [insetExtra := insetExtra left + insetExtra right @ (insetExtra top + insetExtra bottom)]
		ifFalse: [insetExtra := insetExtra*2 asPoint].
	gap := properties cellGap asPoint.
	n := 0.
	width := height := 0.
	aMorph submorphsDo: 
			[:m | | sizeX sizeY | 
			m disableTableLayout 
				ifFalse: 
					[n := n + 1.
					size := m minExtent + insetExtra.
					sizeX := size x.
					sizeY := size y.
					sizeX < minX 
						ifTrue: [sizeX := minX]
						ifFalse: [sizeX := sizeX min: maxX].
					sizeY < minY 
						ifTrue: [sizeY := minY]
						ifFalse: [sizeY := sizeY min: maxY].
					width := width + sizeX.
					sizeY > height ifTrue: [height := sizeY]]].
	n > 1 ifTrue: [width := width + ((n - 1) * gap x)].
	^minExtentCache := width @ height