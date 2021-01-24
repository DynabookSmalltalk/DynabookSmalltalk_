initialize-release
privRefresh
	"Reinitialize the receiver so that it is in the state it was at its creation."

	closureOrNil
		ifNotNil:
			[closureOrNil isFullBlock
				ifTrue:
					[pc := method initialPC.
					 self stackp: method numTemps.
					 closureOrNil numArgs + closureOrNil numCopiedValues + 1 to: method numTemps do:
						[:i | self tempAt: i put: nil]]
				ifFalse: "In non-full blocks temps are established by push btecodes"
					[pc := closureOrNil startpc.
					 self stackp: closureOrNil numArgs + closureOrNil numCopiedValues].
			 1 to: closureOrNil numCopiedValues do:
				[:i | self tempAt: closureOrNil numArgs + i put: (closureOrNil at: i)]]
		ifNil:
			[pc := method initialPC.
			 self stackp: method numTemps.
			 method numArgs + 1 to: method numTemps do:
				[:i | self tempAt: i put: nil]]