layout
acceptDroppingMorph: morphToDrop event: evt

	(morphToDrop isKindOf: NebraskaSenderMorph) ifFalse: [
		^morphToDrop rejectDropMorphEvent: evt.
	].
	self eToyRejectDropMorph: morphToDrop event: evt.		"we don't really want it"
	self updateIPAddressField: targetIPAddresses,{morphToDrop ipAddress}.

