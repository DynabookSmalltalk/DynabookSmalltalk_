as yet unclassified
rebuild
	| r1 r2 |

	r1 := self addARow: {
		self simpleToggleButtonFor: self attribute: #acceptOnCR help: 'Send with Return?' translated.
		self inAColumn: {StringMorph new contents: 'Multi chat with:' translated; lock}.
		self textEntryFieldNamed: #ipAddress with: ''
					help: 'Click to edit participant list' translated.
	}.
	sendingPane := PluggableTextMorph
				on: self
				text: nil
				accept: #acceptTo:forMorph:.
	sendingPane hResizing: #spaceFill; vResizing: #spaceFill.
	self
		addMorphBack: sendingPane.
	r2 := self addARow: {self inAColumn: {StringMorph new contents: 'Replies' translated; lock}}.
	receivingPane := PluggableTextMorph
				on: self
				text: nil
				accept: nil.
	receivingPane hResizing: #spaceFill; vResizing: #spaceFill.
	self
		addMorphBack: receivingPane.
	receivingPane spaceFillWeight: 3.
	{r1. r2} do: [ :each |
		each
			vResizing: #shrinkWrap; minHeight: 18;
			color: Color veryLightGray.
	].
	self updateIPAddressField: targetIPAddresses.
	sendingPane acceptOnCR: (acceptOnCR ifNil: [acceptOnCR := true]).