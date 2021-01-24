update cycle
displayWorldSafely: aWorld
	"Update this world's display and keep track of errors during draw methods."

	| finished classesWithErrors |
	finished := false.
	
	[finished] whileFalse: [
		[aWorld displayWorld. finished := true] on: Error, Halt, Warning do: [:ex |
			"Handle a drawing error"
			| err rcvr errCtx errMorph |
			err := ex description.
			rcvr := ex receiver.

			errCtx := thisContext.
			[
				errCtx := errCtx sender.
				"Search the sender chain to find the morph causing the problem"
				[errCtx notNil and:[(errCtx receiver isMorph) not]] 
					whileTrue:[errCtx := errCtx sender].
				"If we're at the root of the context chain then we have a fatal drawing problem"
				errCtx ifNil:[^Project current fatalDrawingError: err].
				errMorph := errCtx receiver.
				"If the morph causing the problem has already the #drawError flag set,
				then search for the next morph above in the caller chain."
				errMorph hasProperty: #errorOnDraw
			] whileTrue.
			errMorph setProperty: #errorOnDraw toValue: true.

			"Catch all errors, one for each receiver class."
			classesWithErrors ifNil: [classesWithErrors := IdentitySet new].
			(classesWithErrors includes: rcvr class) ifFalse: [
				classesWithErrors add: rcvr class.
				ToolSet debugException: ex].

			"Repaint all to catch all errors now and not if the debugger will appear."
			aWorld fullRepaintNeeded.
		]].