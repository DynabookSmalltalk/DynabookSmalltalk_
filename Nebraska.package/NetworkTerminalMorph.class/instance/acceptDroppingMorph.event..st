layout
acceptDroppingMorph: morphToDrop event: evt

	| myCopy outData null |

	(morphToDrop isKindOf: NewHandleMorph) ifTrue: [			"don't send these"
		^morphToDrop rejectDropMorphEvent: evt.
	].
	self eToyRejectDropMorph: morphToDrop event: evt.		"we don't really want it"

	"7 mar 2001 - remove #veryDeepCopy"
	myCopy := morphToDrop.	"gradient fills require doing this second"
	myCopy setProperty: #positionInOriginatingWorld toValue: morphToDrop position.

	outData := myCopy eToyStreamedRepresentationNotifying: nil.
	null := String with: 0 asCharacter.
	NebraskaPeerToPeer new 
		sendSomeData: {
			NebraskaIncomingMessage typeMorph,null. 
			Preferences defaultAuthorName,null.
			outData
		}
		to: connection remoteSocketAddress hostNumber
		for: self.
