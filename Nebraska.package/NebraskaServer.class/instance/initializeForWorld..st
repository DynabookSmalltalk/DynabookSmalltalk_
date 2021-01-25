initialization
initializeForWorld: aWorld

	world := aWorld.
	clients := IdentitySet new.
	self extent: world extent depth: Display depth.
	aWorld remoteServer: self.