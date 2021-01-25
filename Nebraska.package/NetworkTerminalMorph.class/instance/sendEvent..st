event handling
sendEvent: evt

	self sendEventAsIs: (evt translatedBy: bounds topLeft negated).