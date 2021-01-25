private - running
stopMaintenancer
maintenancer isNil ifFalse:[""
	maintenancer terminate.
	maintenancer _ nil]