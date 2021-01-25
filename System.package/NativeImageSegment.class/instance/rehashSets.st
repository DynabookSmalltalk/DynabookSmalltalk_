fileIn/Out
rehashSets
	"I have just been brought in and converted to live objects.  Find all Sets and Dictionaries in the newly created objects and rehash them.  Segment is near then end of memory, since is was newly brought in (and a new object created for it).
	Also, collect all classes of receivers of blocks.  Return them.  Caller will check if they have been reshaped."

	| hashedCollections receiverClasses |
	hashedCollections := OrderedCollection new.
		"have to collect them, because Dictionary makes a copy, and that winds up at the end of memory and gets rehashed and makes another one."
	receiverClasses := IdentitySet new.
	self allObjectsDo:
		[:object|
		object isInMemory ifTrue:
			[(object isCollection and: [object isKindOf: HashedCollection]) ifTrue:
				[hashedCollections add: object].
			(object isBlock or: [object isContext]) ifTrue:
				[receiverClasses add: object receiver class]]].
	hashedCollections do: [ :each | each compact ]. "our purpose"
	^receiverClasses	"our secondary job"