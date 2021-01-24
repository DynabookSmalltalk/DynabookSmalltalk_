focus
updateFocusLookForKeyboardFocus
	"Ensure that the window holding the current keyboard focus looks focused. Note that the focus window is not necessarily the receiver of this message."

	| f w |
	(((f := self activeHand keyboardFocus) notNil and: [(w := f containingWindow) notNil])
		and: [w isActive])
			ifTrue: [
				(self class windowsIn: self world) do: [:window |
					w ~~ window ifTrue: [window lookUnfocused]].
				w lookFocused]