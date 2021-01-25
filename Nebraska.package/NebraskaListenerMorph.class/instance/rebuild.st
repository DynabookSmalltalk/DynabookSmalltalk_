as yet unclassified
rebuild

	| earMorph |
	updateCounter := UpdateCounter.
	self removeAllMorphs.
	self addGateKeeperMorphs.
	GlobalListener ifNil: [
		earMorph := (self class makeListeningToggleNew: false) asMorph.
		earMorph setBalloonText: 'Click to START listening for messages' translated.
		earMorph on: #mouseUp send: #startListening to: self.
	] ifNotNil: [
		earMorph := (self class makeListeningToggleNew: true) asMorph.
		earMorph setBalloonText: 'Click to STOP listening for messages' translated.
		earMorph on: #mouseUp send: #stopListening to: self.
	].
	self addARow: {self inAColumn: {earMorph}}.
	self
		addARow: {
			self inAColumn: {(StringMorph contents: 'Incoming communications' translated ) lock}.
			self indicatorFieldNamed: #working color: Color blue help: 'working' translated.
			self indicatorFieldNamed: #communicating color: Color green help: 'receiving' translated.
		}.
	"{thumbForm. newObject. senderName. ipAddressString}"
	self class globalIncomingQueueCopy do: [ :each |
		self
			addNewObject: each second 
			thumbForm: each first 
			sentBy: each third 
			ipAddress: each fourth.
	].