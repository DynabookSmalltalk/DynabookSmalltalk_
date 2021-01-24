running
getUserResponseAtHand
	"Remove unnecessary widgets."
	self message ifEmpty: [ messageMorph delete ].
	self paneMorph submorphs ifEmpty: [ self paneMorph delete ].
	"Modal dialogs must be as convenient as possible, put default button directly under hand."
	self
		 ensureSelectedButton ;
		 preferredPosition: self selectedButton.
	^ self getUserResponse