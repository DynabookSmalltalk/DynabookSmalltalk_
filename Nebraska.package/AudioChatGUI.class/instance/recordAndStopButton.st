initialization
recordAndStopButton

	^ChatButtonMorph new
		labelUp: 'Record';
		labelDown: 'RECORDING';
		label: 'Record';
		color: self buttonColor;
		target: self;
		actionUpSelector: #stop;
		actionDownSelector: #record;
		setBalloonText: 'Press and hold to record a message. It will be sent when you release the mouse.'
