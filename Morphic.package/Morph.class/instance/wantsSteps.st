stepping and presenter
wantsSteps
	"Return true if the receiver overrides the default Morph step method."
	"Details: Find first class in superclass chain that implements #step and return true if it isn't class Morph."

	| c |
	self isPartsDonor ifTrue: [^ false].
	(self == self topRendererOrSelf) ifTrue: [self player wantsSteps ifTrue: [^ true]].
	c := self class.
	[c includesSelector: #step] whileFalse: [c := c superclass].
	^ c ~= Morph