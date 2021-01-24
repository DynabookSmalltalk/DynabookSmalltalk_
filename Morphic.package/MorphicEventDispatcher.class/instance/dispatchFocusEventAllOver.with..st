focus events
dispatchFocusEventAllOver: evt with: focusMorph
	"Like a full event dispatch BUT adds regular dispatch if the focus morph did nothing with the event. This is useful for letting the focusMorph's siblings handle the events instead. Take halo invocation as an example. See senders of me."
	
	| result hand mouseFocus |
	result := self dispatchFocusEventFully: evt with: focusMorph.
	
	evt isMouseOver ifTrue: [^ result]. 
	
	result == #rejected ifTrue: [^ result].
	result wasIgnored ifTrue: [^ result].
	result wasHandled ifTrue: [^ result].

	hand := evt hand.
	mouseFocus := hand mouseFocus.

	[
		"Avoid re-dispatching the event to the focus morph. See Morph >> #rejectsEvent:."
		focusMorph lock.
		hand newMouseFocus: nil.
		
		"Give the event's hand a chance to normally dispatch it."
		^ hand handleEvent: evt
	] ensure: [
		focusMorph unlock.
		hand newMouseFocus: mouseFocus].