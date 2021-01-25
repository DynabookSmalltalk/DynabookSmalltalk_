instance creation
newPair
	"create a connected pair of sockets"
	| a b |
	a := self new.
	b := self new.
	a associate: b.
	b associate: a.
	^{a. b}