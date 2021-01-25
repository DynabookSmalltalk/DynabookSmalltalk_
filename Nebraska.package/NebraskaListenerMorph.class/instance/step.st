stepping and presenter
step

	| needRebuild |
	super step.
	needRebuild := false.
	(self valueOfProperty: #gateKeeperCounterValue) = 
			NebraskaGateKeeperMorph updateCounter ifFalse: [needRebuild := true].
	updateCounter = UpdateCounter ifFalse: [
		needRebuild := true.
	].
	needRebuild ifTrue: [self rebuild].
