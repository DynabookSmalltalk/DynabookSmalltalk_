private
markTemp: tempVarNode asOutOfScope: scopeFlag
	tempVarNode scope: scopeFlag.
	tempReadCounts removeKey: tempVarNode ifAbsent: []