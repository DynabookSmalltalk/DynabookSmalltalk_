scheduling & debugging
interruptCleanUpFor: interruptedProcess
	"Clean up things in case of a process interrupt."

	super interruptCleanUpFor: interruptedProcess.

	self uiProcess == interruptedProcess ifTrue: [
		ActiveHand ifNotNil: [ActiveHand interrupted].
		ActiveWorld := world. "reinstall active globals"
		ActiveHand := world primaryHand.
		ActiveHand interrupted. "make sure this one's interrupted too"
		ActiveEvent := nil.
		
		Preferences eToyFriendly
			ifTrue: [Project current world stopRunningAll]].