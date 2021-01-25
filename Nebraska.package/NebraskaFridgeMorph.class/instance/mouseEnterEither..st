as yet unclassified
mouseEnterEither: evt

	evt hand hasSubmorphs ifFalse: [
		^self addMouseActionIndicatorsWidth: 10 color: (Color blue alpha: 0.3).
	].
	(evt hand firstSubmorph isKindOf: NebraskaSenderMorph) ifTrue: [
		^self addMouseActionIndicatorsWidth: 10 color: (Color magenta alpha: 0.3).
	].
	self addMouseActionIndicatorsWidth: 10 color: (Color green alpha: 0.3).

