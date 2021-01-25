This is a socket which sends arrays of strings back and forth.  This is less convenient than ObjectSockets, but it is more secure and it makes it easier to reason about updates to the protocol.

An array of strings is represented on the network as:

	4-bytes		number of strings in the array
	4-byte		number of bytes in the first string
	n1-bytes		characters in the first string
	4-bytes		number of bytes in the second string
	n2-bytes	characters in the second string
	...

