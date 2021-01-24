preferences
gripThickness: anInteger

	GripThickness := anInteger.
	Project current restoreDisplay.
	
	self flag: #todo. "mt: Update existing grips. This is challenging because it interferes with ProportionalLayoutPolicy, which is tricky to refresh from here for arbitrary morphs."