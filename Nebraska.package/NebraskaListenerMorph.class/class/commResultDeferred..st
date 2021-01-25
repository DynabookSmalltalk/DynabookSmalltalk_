as yet unclassified
commResultDeferred: anArrayOfAssociations

	| m ipAddress aDictionary |

	"to be run as part of the UI process in case user interaction is required"

	aDictionary := Dictionary new.
	anArrayOfAssociations do: [ :each | aDictionary add: each].
	
	aDictionary at: #commFlash ifPresent: [ :ignore | ^self].
	m := aDictionary at: #message ifAbsent: [^self].
	m = 'OK' ifFalse: [^self].
	ipAddress := aDictionary at: #ipAddress.

	NebraskaIncomingMessage new 
		incomingMessgage: (ReadStream on: (aDictionary at: #data)) 
		fromIPAddress: ipAddress

	