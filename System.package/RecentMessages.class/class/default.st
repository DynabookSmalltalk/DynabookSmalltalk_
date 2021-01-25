accessing
default
	^ Default ifNil: [Default := RecentMessages newRemembering: 30].