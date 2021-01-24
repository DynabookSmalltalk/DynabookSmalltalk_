actions
changeEnvironment
	workingCopy ifNil: [^ self].
	workingCopy environment: EnvironmentRequest signal