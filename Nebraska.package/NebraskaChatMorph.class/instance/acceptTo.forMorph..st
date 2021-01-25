as yet unclassified
acceptTo: someText forMorph: aMorph

	| betterText |

	betterText := self improveText: someText forMorph: aMorph.
	self 
		transmitStreamedObject: (betterText eToyStreamedRepresentationNotifying: self) 
		to: self ipAddress.
	aMorph setText: '' asText.
	self appendMessage: 
		self startOfMessageFromMe,
		' - ',
		betterText,
		String cr.

	^true