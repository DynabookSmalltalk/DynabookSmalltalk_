stepping and presenter
step

	super step.
	offColor ifNil: [offColor := self onColor mixed: 0.5 with: Color black].
	socketOwner objectsInQueue = 0 ifTrue: [
		color = offColor ifFalse: [super color: offColor].
	] ifFalse: [
		super color: (color = onColor ifTrue: [offColor] ifFalse: [onColor]).
	].
