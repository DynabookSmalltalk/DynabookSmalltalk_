initialize-release
initialize: initialCapacity

	definitions := (KeyedSet new: initialCapacity)
		keyBlock: [ :object | object description ];
		yourself