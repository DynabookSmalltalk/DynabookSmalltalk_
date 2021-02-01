initialization
onScorePlayer: aScorePlayer title: scoreName
	| divider col r |
	scorePlayer := aScorePlayer.
	scorePlayer ifNotNil:
		[scorePlayer  reset.
		instrumentSelector := Array new: scorePlayer score tracks size].

	self removeAllMorphs.
	self addMorphBack: self makeControls.
	scorePlayer ifNil: [^ self].

	r := self makeRow
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
	r addMorphBack: self rateControl;
		addMorphBack: (Morph newBounds: (0@0 extent: 20@0) color: Color transparent);
		addMorphBack: self volumeControl.
	self addMorphBack: r.
	self addMorphBack: self scrollControl.

	col := AlignmentMorph newColumn color: color; layoutInset: 0.
	self addMorphBack: col.
	1 to: scorePlayer trackCount do: [:trackIndex |
		divider := AlignmentMorph new
			extent: 10@1;
			layoutInset: 0;
			borderStyle: (BorderStyle raised width: 1);
			color: color;
			hResizing: #spaceFill;
			vResizing: #rigid.
		col addMorphBack: divider.
		col addMorphBack: (self trackControlsFor: trackIndex)].

	LastMIDIPort ifNotNil: [
		"use the most recently set MIDI port"
		scorePlayer openMIDIPort: LastMIDIPort].
