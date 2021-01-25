as yet unclassified
killExistingChat

	| oldOne |
	self rubberBandCells: true. "disable growing"
	(oldOne := self valueOfProperty: #embeddedChatHolder) ifNotNil: [
		oldOne delete.
		self removeProperty: #embeddedChatHolder
	].

	(oldOne := self valueOfProperty: #embeddedAudioChatHolder) ifNotNil: [
		oldOne delete.
		self removeProperty: #embeddedAudioChatHolder
	].

