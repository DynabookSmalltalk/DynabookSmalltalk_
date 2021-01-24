accessing - convenience
font: aFont emphasis: emphasisCode

	self
		setFont: ((aFont isNil or: [aFont emphasis = emphasisCode] or: [emphasisCode isNil])
			ifTrue: [aFont]
			ifFalse: [aFont emphasized: emphasisCode])
		emphasis: (emphasisCode ifNil: [aFont emphasis]).