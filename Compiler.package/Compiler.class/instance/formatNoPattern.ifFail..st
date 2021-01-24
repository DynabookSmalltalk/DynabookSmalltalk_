private
formatNoPattern: noPattern ifFail: failBlock
	^(self parser
		parseCue: cue 
		noPattern: noPattern
		ifFail: [^failBlock value]) preen