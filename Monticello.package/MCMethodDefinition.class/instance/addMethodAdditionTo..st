installing
addMethodAdditionTo: aCollection 
	aCollection
		 add: self asMethodAddition createCompiledMethod ;
		 yourself