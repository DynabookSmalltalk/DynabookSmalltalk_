connection - server
remoteBroker: brokerIDString references: objectsIDsCollection 
	"process a notification from a remote image of referenced objects"
	| referencedObjects |
	referencedObjects _ objectsIDsCollection
				collect: [:objectID | ""
					exportedObjects
						at: objectID
						ifAbsent: []].
	"forget the old objects, meanwhile the object are alive becouse  
	referencedObjects holds references"
	rememberer forgetAllNamed: brokerIDString.
	"now remember the news"
	referencedObjects
		do: [:object | "the broker has 1 day to contact me again"
			rememberer
				remember: object
				forSeconds: 24 * 60 * 60
				naming: brokerIDString]