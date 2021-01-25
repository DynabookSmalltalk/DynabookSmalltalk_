instance creation
connectTo: hostAndPort
	| host port |
	host := hostAndPort copyUpTo: $:.
	port := (hostAndPort copyAfter: $:) asInteger.
	port ifNil: [port := NebraskaServer defaultPorts first].
	^self connectTo: host port:port
