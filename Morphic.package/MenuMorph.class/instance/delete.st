initialization
delete
	"Delete the receiver."

	self hideKeyboardHelp.
	activeSubMenu ifNotNil: [activeSubMenu stayUp ifFalse: [activeSubMenu delete]].
	self isFlexed ifTrue: [^ owner delete].
	^ super delete