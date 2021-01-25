receiving
doReceiveData

	| answer |

	answer := [self doReceiveOneMessage] 
		on: Error
		do: [ :ex | 
			communicatorMorph commResult: {#message -> (ex description,' ',socket printString)}.
			^false
		].
	communicatorMorph commResult: {
		#message -> 'OK'. 
		#data -> answer .
		#ipAddress -> remoteSocketAddress.
	}.
	^answer size > 0

