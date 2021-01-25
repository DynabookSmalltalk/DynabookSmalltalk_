handling messages
applyMessagesTo: aHand
	| msg |
	"apply all queued events to the given hand"
	"currently, there is no way to extract the rawmessages.  This is simply because I didn't feel like implementing individual classes for each message -lex"
	[ msg := connection nextOrNil.  msg notNil ] whileTrue: [
		self apply: msg to: aHand ].
