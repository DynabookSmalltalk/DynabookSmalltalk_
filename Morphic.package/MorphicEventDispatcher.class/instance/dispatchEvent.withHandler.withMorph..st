support
dispatchEvent: anEvent withHandler: aHandler withMorph: aMorph
	"Perform the actual event dispatch. Use the given object as handler. Ask submorphs first to handle the event. Then bubble up. Stop if ignored. Note that event rejection and event filters are two separete concepts. Filters come from the outside. Rejection is a morph's decision.
	
	* The top-most chain of visible, unlocked morphs containing the event position will get a chance to handle the event.
	* When travelling up, the prospective handler is always executed. The handler needs to check if the event was handled before as well as checking if somebody else's handler has been installed.
	* If another handler has been installed but the event was not handled it means that somebody up in the hierarchy wants to handle the event."
	
	| result filteredEvent |
	
	result := self dispatchEvent: anEvent toSubmorphsOf: aMorph.

	result == #rejected "Anybody?"
		ifFalse: [filteredEvent := result]
		ifTrue: [
			"My submorphs did not want it. Do I want it anyway? It's about locked children..."
			(aMorph containsPoint: anEvent position event: anEvent)
				ifFalse: [^ #rejected].
			filteredEvent := anEvent "there was no filtering, only basic rejects"].
	
	"Receiver is in the top-most unlocked, visible chain."
	(aHandler notNil and: [filteredEvent wasIgnored not])
		ifTrue: [filteredEvent := [aHandler handleEvent: filteredEvent] valueInProcessWithArguments: {}].

	^ filteredEvent