private
getBehavior: name factory: pseudoBehaviorFactory
	| pseudoBehavior |
	(classes includesKey: name) ifTrue:[
		^classes at: name.
	].
	pseudoBehavior := pseudoBehaviorFactory new.
	pseudoBehavior name: name.
	classes at: name put: pseudoBehavior.
	^pseudoBehavior.