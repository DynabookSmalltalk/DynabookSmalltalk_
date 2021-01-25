as yet unclassified
acceptTo: someText forMorph: aMorph

	| streamedMessage betterText |

	betterText := self improveText: someText forMorph: aMorph.
	streamedMessage := {targetIPAddresses. betterText} eToyStreamedRepresentationNotifying: self.
	targetIPAddresses do: [ :each |
		self 
			transmitStreamedObject: streamedMessage
			to: each.
	].
	aMorph setText: '' asText.
	self appendMessage: 
		self startOfMessageFromMe,
		' - ',
		betterText,
		String cr.

	^true