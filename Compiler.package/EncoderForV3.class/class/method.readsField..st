scanning
method: method readsField: varIndex
	"Answer if method loads the instance variable indexed by varIndex.
	 N.B. Don't assume the compiler uses the most compact encoding available.
	0-15 		0000iiii 	Push Receiver Variable #iiii
	128 		10000000 jjkkkkkk 	Push (Receiver Variable, Temporary Location, Literal Constant, Literal Variable) [jj] #kkkkkk
	132 		10000100 iiijjjjj kkkkkkkk 	(Send, Send Super, Push Receiver Variable, Push Literal Constant, Push Literal Variable, Store Receiver Variable, Store-Pop Receiver Variable, Store Literal Variable)[iii] #kkkkkkkk jjjjj (for sends jjjjj = numArgs)"
	| varIndexCode scanner |
	varIndexCode := varIndex - 1.
	method isReturnField ifTrue:
		[^method returnField = varIndexCode].
	^(scanner := InstructionStream on: method) scanFor:
		[:b|
		b < 16
			ifTrue: [b = varIndexCode]
			ifFalse:
				[b = 128
					ifTrue: [scanner followingByte = varIndexCode and: [varIndexCode <= 63]]
					ifFalse:
						[b = 132
						 and: [(scanner followingByte between: 64 and: 95)
						 and: [scanner thirdByte = varIndexCode]]]]]