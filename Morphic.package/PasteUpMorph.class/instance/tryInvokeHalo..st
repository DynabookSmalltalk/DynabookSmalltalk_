events-processing
tryInvokeHalo: aUserInputEvent 
	"Invoke halos around the top-most world container at aUserInputEvent's #position.  If it was already halo'd, zero-in on its next inward component morph at that position.  Holding Shift during the click reverses this traversal order."
	| stack innermost haloTarget |
	Preferences noviceMode ifTrue: [ ^ self ].
	Morph haloForAll ifFalse: [ ^ self ].
	"the stack is the top-most morph to bottom-most."
	stack := (self morphsAt: aUserInputEvent position unlocked: true) select:
		[ : each | each wantsHaloFromClick or: [ each handlesMouseDown: aUserInputEvent ] ].
	innermost := aUserInputEvent hand halo
		ifNil: [ stack first ]
		ifNotNil:
			[ : existingHalo | (stack copyWithout: existingHalo) "No halos on halos"
				detect: [ : each | each owner == self ]
				ifFound:
					[ : worldContainer | "Is existingHalo's target part of the same worldContainer as the morph clicked?"
					(existingHalo target withAllOwners includes: worldContainer)
						ifTrue: [ "same hierarchy, let #transferHalo: continue to handle it for now."  ^self ]
						ifFalse:
							[ "different hierarchy, remove + add."
							aUserInputEvent hand removeHalo.
							aUserInputEvent shiftPressed
								ifTrue: [ stack second "first is still the just removed halo" ]
								ifFalse: [ worldContainer ] ] ]
				ifNone: [ "existingHalo is on the World, defer to #transferHalo: for now."  ^self ] ].
	"If modifier key is pressed, start at innermost (the target), otherwise the outermost (direct child of the world (self))."
	haloTarget := (innermost == self or: [aUserInputEvent shiftPressed])
		ifTrue: [ innermost ]
		ifFalse:
			 [ "Find the outermost owner that wants it."
			innermost withAllOwners reversed allButFirst
				detect: [ : each | each wantsHaloFromClick ]
				ifNone: [ "haloTarget has its own mouseDown handler, don't halo."  ^ self ] ].
	"Now that we have the haloTarget, show the halo."
	aUserInputEvent hand
		newMouseFocus: haloTarget
		event: aUserInputEvent.
	haloTarget invokeHaloOrMove: aUserInputEvent.
	"aUserInputEvent has been consumed, don't let it cause any further side-effects."
	aUserInputEvent ignore