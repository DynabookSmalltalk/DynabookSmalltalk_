testing
hasFileAccess
	"SecurityManager default hasFileAccess"
	"Return true if the right to access arbitrary files hasn't been revoked"
	<primitive: 'primitiveHasFileAccess' module: 'FilePlugin'>
	^true "assume so unless otherwise proven"