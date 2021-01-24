accessing
timeStamp
	^ TimeStamp date: date time: (time ifNil: [Time fromString: '00:00'])