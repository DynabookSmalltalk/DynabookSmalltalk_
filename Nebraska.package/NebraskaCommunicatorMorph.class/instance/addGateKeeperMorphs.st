collaborative
addGateKeeperMorphs

	| list currentTime choices |

	self setProperty: #gateKeeperCounterValue toValue: NebraskaGateKeeperMorph updateCounter.
	choices := #(
		(60 'm' 'in the last minute')
		(3600 'h' 'in the last hour')
		(86400 'd' 'in the last day')
	).
	currentTime := Time totalSeconds.
	list := NebraskaGateKeeperMorph knownIPAddresses.
	list do: [ :each | | age row |
		age := each timeBetweenLastAccessAnd: currentTime.
		age := choices
			detect: [ :x | age <= x first]
			ifNone: [{0. '-'. (age // 86400) printString,'days ago'}].
		row := self addARow:
		(NebraskaIncomingMessage allTypes collect: [ :type |
				self toggleButtonFor: each attribute: type]
		),
		{

			(self inAColumn: {
				(StringMorph contents: age second) lock.
			}) layoutInset: 2; hResizing: #shrinkWrap; setBalloonText: 'Last attempt was ',age third.

			(self inAColumn: {
				(StringMorph contents: each ipAddress) lock.
			}) layoutInset: 2; hResizing: #shrinkWrap.

			(self inAColumn: {
				(StringMorph contents: each latestUserName) lock.
			}) layoutInset: 2.
		}.
		row
			color: (Color r: 0.6 g: 0.8 b: 1.0);
			borderStyle: (BorderStyle raised width: 1);
			vResizing: #spaceFill;
			"on: #mouseUp send: #mouseUp:in: to: self;"
			setBalloonText: each fullInfoString
	].