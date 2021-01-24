collapse/expand
beReplacementFor: aMorph
	"Encapsulate aMorph with the CollapsedMorph and display the latter"

	| itsWorld |
	(itsWorld := aMorph world) ifNil: [^self].
	self beReplacementFor: aMorph in: itsWorld.