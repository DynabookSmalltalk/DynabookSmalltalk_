meta-actions
makeNewPlayerInstance: evt
	"Make a duplicate of the receiver's argument.  This is called only where the argument has an associated Player as its costumee, and the intent here is to make another instance of the same uniclass as the donor Player itself.  Much works, but there are flaws so this shouldn't be used without recognizing the risks"

	evt hand attachMorph: self usableSiblingInstance