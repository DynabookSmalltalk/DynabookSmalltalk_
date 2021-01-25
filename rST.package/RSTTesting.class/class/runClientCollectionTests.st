testing - client side
runClientCollectionTests
	"in this example remoteCollection receives 2 remote references to local  
	blocks, then the remote collection send #value: and #value to these  
	locals blocks"
	| remoteCollection localCollectionAsString remoteCollectionAsString remoteCollectionAsStringConverter |
	remoteCollection _ ('collection@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remoteCollectionAsStringConverter _ ('collectionAsStringConverter@' , self serverBrokerID) asRemoteObjectID asLocalObject.
	remoteCollectionAsString _ remoteCollectionAsStringConverter value.
	localCollectionAsString _ self collectionToString: remoteCollection.
	Transcript show: 'remoteCollection=';
		 show: localCollectionAsString;
		 cr.
	localCollectionAsString = remoteCollectionAsString
		ifFalse: [self error: 'something wrong!']