testing
isOwned
	"Answer if the receiver is owned.  DO NOT USE THIS IN NORMAL CODE.
	 This exists for the MutexTests so they don't have to use e.g. instVarNamed:.
	 N.B. don't use notNil because that is a real send and preemptable."
	^nil ~~ owner