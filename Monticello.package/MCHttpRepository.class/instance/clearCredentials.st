accessing
clearCredentials
	user ifNotNil: [user atAllPut: $x].
	password ifNotNil: [password atAllPut: $x].
	user := password := String empty