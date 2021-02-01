initialization
intoWorld: newOwner
"Make sure report damage at least once"
	damageReported := false.
	super intoWorld: newOwner.
	