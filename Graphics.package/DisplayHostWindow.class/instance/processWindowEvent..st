private-events
processWindowEvent: evt
	(evt at: 3) caseOf: {
		[WindowEventMetricChange] -> [self handleMetricChange: ((evt at: 4)@(evt at: 5) corner: (evt at: 6)@(evt at: 7)) ].
		[WindowEventClose] ->	 [self handleClose].
		[WindowEventIconise] -> [self handleIconise]. 
		[WindowEventActivated] -> [self handleActivated]. 
		[WindowEventPaint] -> [self handlePaint: ((evt at: 4)@(evt at: 5) corner: (evt at: 6)@(evt at: 7))].
	} otherwise: ["unknown"]
