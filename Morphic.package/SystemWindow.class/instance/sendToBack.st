menu
sendToBack
	| aWorld nextWindow |
	aWorld := self world.
	nextWindow := aWorld submorphs 
				detect: [:m | (m isSystemWindow) and: [m ~~ self]]
				ifNone: [^self].
	nextWindow beKeyWindow.
	aWorld addMorphNearBack: self