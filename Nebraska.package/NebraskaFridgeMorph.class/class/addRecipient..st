as yet unclassified
addRecipient: aSenderMorph

	self fridgeRecipients do: [ :each |
		aSenderMorph ipAddress = each ipAddress ifTrue: [^self]
	].
	self fridgeRecipients add: aSenderMorph.
	UpdateCounter := self updateCounter + 1
