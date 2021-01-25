as yet unclassified
rebuild
	| r1 r2 |

	r1 := self addARow: {
		self simpleToggleButtonFor: self attribute: #acceptOnCR help: 'Send with Return?' translated.
		self inAColumn: {StringMorph new contents: 'Your message to:' translated; font: Preferences standardMenuFont; lock}.
		self textEntryFieldNamed: #ipAddress with: ''
					help: 'IP address for chat partner' translated.
	}.
	recipientForm ifNotNil: [
		r1 addMorphBack: recipientForm asMorph lock
	].
	sendingPane := PluggableTextMorph
				on: self
				text: nil
				accept: #acceptTo:forMorph:.
	sendingPane hResizing: #spaceFill; vResizing: #spaceFill.
	sendingPane font: Preferences standardMenuFont.
	self
		addMorphBack: sendingPane.
	r2 := self addARow: {self inAColumn: {StringMorph new contents: 'Replies' translated; font: Preferences standardMenuFont; lock}}.
	receivingPane := PluggableTextMorph
				on: self
				text: nil
				accept: nil.
	receivingPane font: Preferences standardMenuFont.
	receivingPane hResizing: #spaceFill; vResizing: #spaceFill.
	self
		addMorphBack: receivingPane.
	receivingPane spaceFillWeight: 3.
	{r1. r2} do: [ :each |
		each
			vResizing: #shrinkWrap; minHeight: 18;
			color: Color veryLightGray.
	].
	sendingPane acceptOnCR: (acceptOnCR ifNil: [acceptOnCR := true])