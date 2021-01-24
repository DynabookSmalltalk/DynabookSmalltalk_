instruction stream support
isTempStoreAt: pc in: method
	"Answer if the bytecode at pc is a store or store-pop into a temporary variable.
	 208-215	11010 iii			Pop and Store Temporary Variable #iii
	 242		11110010	iiiiiiii		Pop and Store Temporary Variable #iiiiiiii
	 245		11110110	iiiiiiii		Store Temporary Variable #iiiiiiii"

	| byte |
	byte := method at: pc.
	^byte >= 208
	  and: [byte <= 215
			or: [byte = 242 or: [byte = 245]]]