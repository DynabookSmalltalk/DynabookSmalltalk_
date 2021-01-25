initialization
playButton

	^SimpleButtonMorph new
		label: 'Play';
		color: self buttonColor;
		target: self;
		actWhen: #buttonUp;
		actionSelector: #playNextMessage;
		setBalloonText: 'Play the next new message.'

