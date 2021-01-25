initialization
toggleForHandsFreeTalking

	^self
		simpleToggleButtonFor: self 
		attribute: #handsFreeTalking 
		help: 'Whether you want to talk without holding the mouse down.'