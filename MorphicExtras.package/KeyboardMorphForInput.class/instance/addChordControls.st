initialization
addChordControls
	| switch chordRow |
      chordRow := AlignmentMorph newRow.
      chordRow color: color; borderWidth: 0; layoutInset: 0.
	chordRow hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'maj' translated;
				actionSelector: #chords:onOff:; arguments: #(maj)).
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'min' translated;
				actionSelector: #chords:onOff:; arguments: #(min)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'dim' translated;
				actionSelector: #chords:onOff:; arguments: #(dim)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'maj7' translated;
				actionSelector: #chords:onOff:; arguments: #(maj7)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'min7' translated;
				actionSelector: #chords:onOff:; arguments: #(min7)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'dom7' translated;
				actionSelector: #chords:onOff:; arguments: #(dom7)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'sus2' translated;
				actionSelector: #chords:onOff:; arguments: #(sus2)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'sus4' translated;
				actionSelector: #chords:onOff:; arguments: #(sus4)). 
	switch := SimpleSwitchMorph new target: self; borderWidth: 2;
		offColor: color; onColor: (Color r: 1.0 g: 0.6 b: 0.6); setSwitchState: false.
	chordRow addMorphBack: (switch label: 'aug' translated;
				actionSelector: #chords:onOff:; arguments: #(aug)). 
	^chordRow
