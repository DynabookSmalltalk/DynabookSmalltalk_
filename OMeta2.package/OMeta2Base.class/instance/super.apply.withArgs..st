rule application
super: superclass apply: aRule withArgs: args

	args reverseDo: [:a | input := OM2Stream new initHead: a tail: input].
	^ self perform: aRule withArguments: #() inSuperclass: superclass