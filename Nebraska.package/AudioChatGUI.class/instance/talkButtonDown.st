sending
talkButtonDown

	NebraskaListenerMorph confirmListening.
	self handsFreeTalking ifFalse: [^self record].
	theTalkButton label: 'Release'.
