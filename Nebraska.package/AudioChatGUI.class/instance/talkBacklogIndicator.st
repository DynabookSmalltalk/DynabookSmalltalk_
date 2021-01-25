initialization
talkBacklogIndicator

	^(UpdatingStringMorph on: self selector: #talkBacklog)
		setBalloonText: 'Approximate number of seconds of delay in your messages getting to the other end.'