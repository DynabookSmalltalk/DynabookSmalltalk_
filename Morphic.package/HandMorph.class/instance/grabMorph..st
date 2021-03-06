meta-actions
grabMorph: aMorph
	"Grab the given morph (i.e., add it to this hand and remove it from its current owner) without changing its position. This is used to pick up a morph under the hand's current position, versus attachMorph: which is used to pick up a morph that may not be near this hand."
	| grabbed |
	self releaseMouseFocus. "Break focus"
	self showTemporaryCursor: nil.
	grabbed := aMorph aboutToBeGrabbedBy: self.
	grabbed ifNil:[^self].
	grabbed := grabbed topRendererOrSelf.
	^self grabMorph: grabbed from: grabbed owner