networking
acceptNullConnection

	| twins |

	twins := LoopbackStringSocket newPair.
	self addClientFromConnection: twins first.
	(NullTerminalMorph new connection: twins second) openInWorld.
