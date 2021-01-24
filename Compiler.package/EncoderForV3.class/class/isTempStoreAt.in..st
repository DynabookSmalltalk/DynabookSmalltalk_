instruction stream support
isTempStoreAt: pc in: method
	"Answer whether the bytecode at pc is a store or store-pop into a temporary variable.
	 104-111 	01101iii 	Pop and Store Temporary Location #iii
	 129 		10000001 jjkkkkkk 	Store (Receiver Variable, Temporary Location, Illegal, Literal Variable) [jj] #kkkkkk
	 130 		10000010 jjkkkkkk 	Pop and Store (Receiver Variable, Temporary Location, Illegal, Literal Variable) [jj] #kkkkkk"

	| byte |
	byte := method at: pc.
	^byte >= 104
	  and: [byte <= 111
			or: [byte <= 130 and: [byte >= 129 and: [(method at: pc + 1) >> 6 = 1]]]]