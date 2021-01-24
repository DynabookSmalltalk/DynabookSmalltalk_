printing
stringForReadout

	^ String streamContents: [:stream |
		self printOn: stream showingDecimalPlaces: 0]