networking
acceptPhonyConnection

	| twins |

	twins := LoopbackStringSocket newPair.
	self addClientFromConnection: twins first.
	(NetworkTerminalMorph new connection: twins second) inspect "openInWorld".
