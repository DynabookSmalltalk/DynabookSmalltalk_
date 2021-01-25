layout
acceptDroppingMorph: morphToDrop event: evt

	| myCopy outData |

	(morphToDrop isKindOf: NewHandleMorph) ifTrue: [			"don't send these"
		^morphToDrop rejectDropMorphEvent: evt.
	].
	self eToyRejectDropMorph: morphToDrop event: evt.		"we don't really want it"

	"7 mar 2001 - remove #veryDeepCopy"
	myCopy := morphToDrop.	"gradient fills require doing this second"
	myCopy setProperty: #positionInOriginatingWorld toValue: morphToDrop position.
	self stopFlashing.

	outData := myCopy eToyStreamedRepresentationNotifying: self.
	self resetIndicator: #working.
	self transmitStreamedObject: outData to: self ipAddress.

