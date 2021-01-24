controlling
send: selector to: rcvr with: arguments
	"Simulate the action of sending a message with selector arguments to rcvr."

	^self send: selector to: rcvr with: arguments lookupIn: (self objectClass: rcvr)