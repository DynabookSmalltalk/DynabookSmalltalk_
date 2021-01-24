instruction stream support
isSendAt: pc in: method
	"Answer whether the bytecode at pc is a message-send."

	| byte |
	byte := method at: pc.
	^byte >= 176			"special send or short send"
	 or: [byte >= 131
		 and: [byte <= 134	"long sends"	
		 and: [byte ~= 132	"double extended do anything"
			or: [(method at: pc + 1) // 32 <= 1]]]]