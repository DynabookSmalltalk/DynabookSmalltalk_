running
getUserResponse

	| hand world |
	self message ifEmpty: [messageMorph delete]. "Do not waste space."
	self paneMorph submorphs
		ifEmpty: ["Do not waste space and avoid strange button-row wraps."
			self paneMorph delete.
			self buttonRowMorph wrapDirection: #none]. 
	
	hand := self currentHand.
	world := self currentWorld.

	self fullBounds.
	self moveToPreferredPosition.
	self openInWorld: world.
	
	hand showTemporaryCursor: nil. "Since we are out of context, reset the cursor."
	
	hand keyboardFocus in: [:priorKeyboardFocus |
		hand mouseFocus in: [:priorMouseFocus |
			self exclusive ifTrue: [hand newMouseFocus: self].
			hand newKeyboardFocus: self.

			[[self isInWorld] whileTrue: [world doOneSubCycle]]
				ifCurtailed: [self cancelDialog].

			hand newKeyboardFocus: priorKeyboardFocus.
			
			self flag: #discuss. "Since 2016 we are having this *ping pong* between (a) restoring the prior mouse focus and (b) just clearing it globally. The former solution makes more sense while the latter fixes issues with some modal dialogs. We have to investigate this further."
			hand releaseMouseFocus.
			"hand newMouseFocus: priorMouseFocus."]].

	^ result