networking
acceptNewConnections
	| connection |
	listenQueue ifNil: [ ^self ].
	[ clients size > 20 ifTrue: [ "too many connections!" ^self ].
	  connection := listenQueue getConnectionOrNil.  
	  connection isNil ] 
	whileFalse: [
	  self addClientFromConnection: (StringSocket on: connection) ].