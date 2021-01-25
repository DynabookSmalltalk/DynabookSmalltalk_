system startup
shutDown: quitting

	WasListeningAtShutdown := GlobalListener notNil.
	self stopListening.
