comparing
hash
	"#hash is implemented, because #= is implemented."
	^(selector hash bitXor: args hash) bitXor: lookupClass hash