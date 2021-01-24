scrolling
adjustOffset
	"Layout specific. If our scroller is large enough, avoid hiding contents due to bad offset."

	| sbox adjustedOffset |
	sbox := scroller submorphBoundsForShrinkWrap.
	adjustedOffset := (sbox width <= scroller width ifTrue: [0] ifFalse: [scroller offset x]) @
		(sbox height <= scroller height ifTrue: [0] ifFalse: [scroller offset y]).
	scroller offset: adjustedOffset.