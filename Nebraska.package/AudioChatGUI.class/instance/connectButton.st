initialization
connectButton
	
	^SimpleButtonMorph new
		label: 'Connect';
		color: self buttonColor;
		target: self;
		actWhen: #buttonUp;
		actionSelector: #connect;
		setBalloonText: 'Press to connect to another audio chat user.'

