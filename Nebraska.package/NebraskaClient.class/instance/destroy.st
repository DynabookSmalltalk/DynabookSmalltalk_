initialization
destroy
	hand ifNotNil:[hand world ifNotNil:[hand world removeHand: hand]].
	connection ifNotNil:[connection destroy].
	encoder := canvas := hand := connection := nil.