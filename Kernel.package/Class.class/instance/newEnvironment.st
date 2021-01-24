subclass creation
newEnvironment
	
	self flag: #uniclasses.
	^ (Environment withName: 'EnvironmentForUniClass')
		at: self name asSymbol put: self;
		importSelf;
		yourself