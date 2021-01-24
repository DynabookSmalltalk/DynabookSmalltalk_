accessing
methodsForSelectedProtocol
	| methods |
	protocolSelection ifNil: [^ Array empty].
	methods := self methodsForSelectedClassAndMetaSelection asOrderedCollection.
	(protocolSelection = '-- all --') 
		ifFalse: [methods removeAllSuchThat: [:ea | ea category ~= protocolSelection]].
	^ methods 
	
								