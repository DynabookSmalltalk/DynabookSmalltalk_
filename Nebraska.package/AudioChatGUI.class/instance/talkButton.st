initialization
talkButton

	^ChatButtonMorph new
		labelUp: 'xxx';
		labelDown: 'xxx';
		label: 'xxx';
		color: self buttonColor;
		target: self;
		actionUpSelector: #talkButtonUp;
		actionDownSelector: #talkButtonDown;
		setBalloonText: 'xxx'
