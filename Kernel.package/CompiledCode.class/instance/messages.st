scanning
messages
	"Answer a Set of all the message selectors sent by this method."

	| result |
	result := Set new.
	self messagesDo: [:selector | result add: selector].
	^ result