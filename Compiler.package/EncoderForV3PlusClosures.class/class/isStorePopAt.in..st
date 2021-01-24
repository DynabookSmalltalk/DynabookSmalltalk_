instruction stream support
isStorePopAt: pc in: method
	"Answer whether the bytecode at pc is a store-pop."

	| byte |
	byte := method at: pc.
	^(byte between: 96 and: 111)	"96 103	storeAndPopReceiverVariableBytecode"
									"104 111	storeAndPopTemporaryVariableBytecode"
	  or: [byte = 130				"130		extendedStoreAndPopBytecode"
	  or: [byte = 142]]				"142		storeAndPopRemoteTempLongBytecode"