testing
hasSocketAccess
	"SecurityManager default hasSocketAccess"
	"Return true if the right to access sockets hasn't been revoked"
	<primitive: 'primitiveHasSocketAccess' module: 'SocketPlugin'>
	^true "assume so unless otherwise proven"