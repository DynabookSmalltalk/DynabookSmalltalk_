testing - server side
serverStartup
	"Initialize an broker in the port 9999 and export some objects for testing"
	| today collection |
	RSTBroker
		startOnPort: self serverPort
		logging: false.
	""
	RSTBroker instance export: Transcript named: 'Transcript'.
	today _ Date today.
	collection _ {1. 'aString'. #aSymbol. today}.
	RSTBroker instance export: today named: 'today'.
	RSTBroker instance export: collection named: 'collection'.
	RSTBroker instance
		export: [self collectionToString: collection]
		named: 'collectionAsStringConverter'.
	""
	RSTBroker instance
		export: (RSTPerson name: 'name1' eMail: 'eMail1')
		named: 'person1'.
	RSTBroker instance
		export: (RSTPerson name: 'name2' eMail: 'eMail2')
		named: 'person2'