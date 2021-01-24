editing
setCompositionWindow

	| hand |
	self flag: #ImmPlugin.
	hand := self primaryHand.
	hand ifNotNil: [hand compositionWindowManager keyboardFocusForAMorph: self].
