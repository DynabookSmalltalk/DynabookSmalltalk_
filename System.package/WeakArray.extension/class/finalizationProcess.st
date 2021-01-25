*System-Finalization
finalizationProcess

	[FinalizationSemaphore wait.
	 FinalizationLock
		critical:
			[FinalizationDependents do:
				[ :weakDependent |
				weakDependent ifNotNil:
					[weakDependent finalizeValues]]]
		ifError:
			[:msg :rcvr | rcvr error: msg]] repeat