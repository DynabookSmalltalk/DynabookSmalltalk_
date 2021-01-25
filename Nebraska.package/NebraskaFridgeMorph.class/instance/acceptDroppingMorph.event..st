layout
acceptDroppingMorph: morphToDrop event: evt

	| outData |

	(morphToDrop isKindOf: NewHandleMorph) ifTrue: [		"don't send these"
		^morphToDrop rejectDropMorphEvent: evt
	].
	self eToyRejectDropMorph: morphToDrop event: evt.		"we will keep a copy"
	(morphToDrop isKindOf: NebraskaSenderMorph) ifTrue: [
		self class addRecipient: morphToDrop.
		^self rebuild
	].
	self stopFlashing.
	"7 mar 2001 - remove #veryDeepCopy"
	outData := morphToDrop eToyStreamedRepresentationNotifying: self.
	self resetIndicator: #working.
	self class fridgeRecipients do: [ :each |
		self transmitStreamedObject: outData to: each ipAddress
	].

