accessing
at: keyObject ifAbsent: absentBlock 
	"anser the object that the key was asigned before"
	| value |
	mutex
		critical: [self flag: #TODO.
			"TODO: be carefull when WeakDictionary will be used"
			value _ dictionary
						at: keyObject
						ifAbsent: [].
			value
				ifNil: [value _ absentBlock value]].
	^ value