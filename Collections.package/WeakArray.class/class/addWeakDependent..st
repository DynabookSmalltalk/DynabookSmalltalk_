accessing
addWeakDependent: anObject

	FinalizationLock
		critical: [
			| emptySlotIndex |
			emptySlotIndex := FinalizationDependents 
				identityIndexOf: nil
				ifAbsent: [ 
					| newIndex |
					newIndex := FinalizationDependents size + 1.
					"Grow linearly"
					FinalizationDependents := FinalizationDependents grownBy: 10.
					newIndex ].
			FinalizationDependents at: emptySlotIndex put: anObject ]
		ifError: [ :msg :rcvr | rcvr error: msg ]