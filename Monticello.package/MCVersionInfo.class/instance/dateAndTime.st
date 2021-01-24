accessing
dateAndTime
	^ DateAndTime
		date: date
		time: (time ifNil: [ Time midnight ])