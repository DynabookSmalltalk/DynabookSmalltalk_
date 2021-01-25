stuff
connect

	mytargetip := UIManager default 
		request: 'Connect to?' 
		initialAnswer: (mytargetip ifNil: ['']).
	mytargetip := NetNameResolver stringFromAddress: (
		(NetNameResolver addressFromString: mytargetip) ifNil: [^mytargetip := '']
	)
