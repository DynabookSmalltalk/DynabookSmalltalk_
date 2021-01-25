as yet unclassified
makeListeningToggle: withEars

	| background c capExtent bgExtent earExtent earDeltaX earDeltaY botCent factor parts |

	factor := 2.
	bgExtent := (50@25) * factor.
	capExtent := (30@30) * factor.
	earExtent := (15@15) * factor.
	earDeltaX := capExtent x // 2.
	earDeltaY := capExtent y // 2.
	background := Form extent: bgExtent depth: 8.
	botCent := background boundingBox bottomCenter.
	c := background getCanvas.
	"c fillColor: Color white."
	parts := {
		(botCent - (capExtent // 2)) extent: capExtent.
	}.
	withEars ifTrue: [
		parts := parts , {
			(botCent - (earDeltaX @ earDeltaY) - (earExtent // 2)) extent: earExtent.
			(botCent - (earDeltaX negated @ earDeltaY) - (earExtent // 2)) extent: earExtent.
		} 
	].
	parts do: [ :each |
		c
			fillOval: each
			color: Color black 
			borderWidth: 0 
			borderColor: Color black.
	].
	^background

"=====
	f2 := Form extent: 30@15 depth: 8.
	background displayInterpolatedOn: f2.
	f2 replaceColor: Color white withColor: Color transparent.
	^f2
====="


	