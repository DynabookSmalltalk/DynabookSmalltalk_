private
lcsFor: xFilteredLines and: yFilteredLines
	"I find one of the longest common subsequences of my arguments. I assume that none of my arguments are empty. I return nil, or an Array which represents a list. The first two elements are the matching ''line'' numbers, the third (and last) is the next node in the list, or nil, if there are no more elements. The list contains the longest common subsequence. I'm a modified version of the Greedy LCS/SES Algorithm from the 6th page of 'An O(ND) Difference Algorithm and Its Variations (1986)' by Eugene W. Myers."

	| n m v lcss max index lcs x y |
	n := xFilteredLines size.
	m := yFilteredLines size.
	max := m + n.
	v := Array new: 2 * max + 1.
	lcss := Array new: 2 * max + 1.
	"Unrolled first iteration (d = 0, k = 0)"
	index := max + 2.
	y := x := v at: index put: 0.	
	lcs := lcss at: index.
	[ x < n and: [ y < m and: [ (xFilteredLines at: x + 1) = (yFilteredLines at: y + 1) ] ] ]
		whileTrue: [ lcs := { x := x + 1. y := y + 1. lcs } ].
	x >= n ifTrue: [ y >= m ifTrue: [ ^lcs ] ].
	v at: max + 1 put: x.
	lcss at: max + 1 put: lcs.
	1 to: max do: [ :d |
		"Unrolled lowest diagonal checks (k = -d)."
		index := max - d + 2.
		x := v at: index.
		y := x + d.
		lcs := lcss at: index.
		[ x < n and: [ y < m and: [ (xFilteredLines at: x + 1) = (yFilteredLines at: y + 1) ] ] ]
			whileTrue: [ lcs := { x := x + 1. y := y + 1. lcs } ].
		x >= n ifTrue: [ y >= m ifTrue: [ ^lcs ] ].
		v at: max - d + 1 put: x.
		lcss at: max - d + 1 put: lcs.
		"Inner diagonals. (k in [2-d..d-2])"
		2 - d to: d - 2 by: 2 do: [ :k |
			index := max + k.
			(v at: index) < (v at: index + 2)
				ifTrue: [ x := v at: (index := index + 2) ]
				ifFalse: [ x := (v at: index) + 1 ].
			y := x - k.
			lcs := lcss at: index.
			[ x < n and: [ y < m and: [ (xFilteredLines at: x + 1) = (yFilteredLines at: y + 1) ] ] ]
				whileTrue: [ lcs := { x := x + 1. y := y + 1. lcs } ].
			x >= n ifTrue: [ y >= m ifTrue: [ ^lcs ] ].
			v at: max + k + 1 put: x.
			lcss at: max + k + 1 put: lcs ].
		"Unrolled highest diagonal checks (k = d)."
		index := max + d.
		x := (v at: index) + 1.
		y := x - d.
		lcs := lcss at: index.
		[ x < n and: [ y < m and: [ (xFilteredLines at: x + 1) = (yFilteredLines at: y + 1) ] ] ]
			whileTrue: [ lcs := { x := x + 1. y := y + 1. lcs } ].
		x >= n ifTrue: [ y >= m ifTrue: [ ^lcs ] ].
		v at: max + d + 1 put: x.
		lcss at: max + d + 1 put: lcs ].
	self error "We should never reach this point."