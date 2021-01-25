maintenance
maintenance
	"within time and time, check for objects to forget"
	mutex
		critical: [| current toForget | 
			current _ Time totalSeconds.
			remembered _ remembered
						select: [:eachRemembered | 
							""
							eachRemembered
								keysAndValuesRemove: [:name :expires | ""
									expires notNil
										and: [expires <= current]].
							eachRemembered notEmpty]]