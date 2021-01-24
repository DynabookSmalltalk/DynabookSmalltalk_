optimized
layoutLeftToRight: aMorph in: newBounds 
	"An optimized left-to-right list layout"

	| inset insetExtra gap extent block posX posY centering extraPerCell amount minX minY maxX maxY n width extra last cell size height sum vFill first cellRect |
	size := properties minCellSize asPoint.
	minX := size x.
	minY := size y.
	size := properties maxCellSize asPoint.
	maxX := size x.
	maxY := size y.
	inset := properties cellInset.
	insetExtra := inset isRectangle
		ifTrue: [insetExtra := inset left + inset right @ (inset top + inset bottom)]
		ifFalse: [insetExtra := inset*2 asPoint].
	(inset isNumber and: [inset isZero]) ifTrue: [inset := nil].
	gap := properties cellGap asPoint x.
	extent := newBounds extent.
	n := 0.
	vFill := false.
	sum := 0.
	width := height := 0.
	first := last := nil.
	block := 
			[:m | | sizeX props sizeY | 
			props := m layoutProperties ifNil: [m].
			props disableTableLayout 
				ifFalse: 
					[n := n + 1.
					cell := LayoutCell new target: m.
					props hResizing == #spaceFill 
						ifTrue: 
							[cell hSpaceFill: true.
							extra := m spaceFillWeight.
							cell extraSpace: extra.
							sum := sum + extra]
						ifFalse: [cell hSpaceFill: false].
					props vResizing == #spaceFill ifTrue: [vFill := true].
					size := m minExtent + insetExtra.
					sizeX := size x.
					sizeY := size y.
					sizeX < minX ifTrue: [sizeX := minX] ifFalse: [sizeX := sizeX min: maxX].
					sizeY < minY ifTrue: [sizeY := minY] ifFalse: [sizeY := sizeY min: maxY].
					cell cellSize: sizeX.
					last ifNil: [first := cell] ifNotNil: [last nextCell: cell].
					last := cell.
					width := width + sizeX.
					sizeY > height ifTrue: [height := sizeY]]].
	properties reverseTableCells 
		ifTrue: [aMorph submorphsReverseDo: block]
		ifFalse: [aMorph submorphsDo: block].
	n > 1 ifTrue: [width := width + ((n - 1) * gap)].
	(properties hResizing == #shrinkWrap 
		and: [properties rubberBandCells or: [sum isZero]]) 
			ifTrue: [extent := width @ (extent y max: height)].
	(properties vResizing == #shrinkWrap 
		and: [properties rubberBandCells or: [vFill not]]) 
			ifTrue: [extent := (extent x max: width) @ height].
	posX := newBounds left.
	posY := newBounds top.

	"Compute extra vertical space"
	extra := extent y - height.
	extra := extra max: 0.
	extra > 0 
		ifTrue: 
			[vFill 
				ifTrue: [height := extent y]
				ifFalse: 
					[centering := properties wrapCentering.
					centering == #bottomRight ifTrue: [posY := posY + extra].
					centering == #center ifTrue: [posY := posY + (extra // 2)]]].


	"Compute extra horizontal space"
	extra := extent x - width.
	extra := extra max: 0.
	extraPerCell := 0.
	extra > 0 
		ifTrue: 
			[sum isZero 
				ifTrue: 
					["extra space but no #spaceFillers"

					centering := properties listCentering.
					centering == #bottomRight ifTrue: [posX := posX + extra].
					centering == #center ifTrue: [posX := posX + (extra // 2)]]
				ifFalse: [extraPerCell := extra asFloat / sum asFloat]].
	n := 0.
	extra := last := 0.
	cell := first.
	[cell isNil] whileFalse: 
			[n := n + 1.
			width := cell cellSize.
			(extraPerCell > 0 and: [cell hSpaceFill]) 
				ifTrue: 
					[extra := (last := extra) + (extraPerCell * cell extraSpace).
					amount := extra truncated - last truncated.
					width := width + amount].
			cellRect := (posX @ posY extent: width @ height).
			inset ifNotNil: [cellRect := cellRect insetBy: inset].
			cell target
				layoutInBounds: cellRect
				positioning: properties cellPositioning.
			posX := posX + width + gap.
			cell := cell nextCell]