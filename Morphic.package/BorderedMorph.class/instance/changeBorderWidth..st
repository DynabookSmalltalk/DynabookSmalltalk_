menu
changeBorderWidth: evt
	| handle origin aHand newWidth oldWidth |
	aHand := evt ifNil: [self primaryHand] ifNotNil: [evt hand].
	origin := aHand position.
	oldWidth := self borderWidth.
	(handle := HandleMorph new)
		forEachPointDo:
			[:newPoint | handle removeAllMorphs.
			handle addMorph:
				(LineMorph from: origin to: newPoint color: Color black width: 1).
			newWidth := (newPoint - origin) r asInteger // 5.
			self borderWidth: newWidth]
		lastPointDo:
			[:newPoint | handle deleteBalloon.
			self halo ifNotNil: [:halo | halo addHandles].
			self rememberCommand:
				(Command new cmdWording: 'border change' translated;
					undoTarget: self selector: #borderWidth: argument: oldWidth;
					redoTarget: self selector: #borderWidth: argument: newWidth)].
	aHand attachMorph: handle.
	handle setProperty: #helpAtCenter toValue: true.
	handle showBalloon:
'Move cursor farther from
this point to increase border width.
Click when done.' translated hand: evt hand.
	handle startStepping