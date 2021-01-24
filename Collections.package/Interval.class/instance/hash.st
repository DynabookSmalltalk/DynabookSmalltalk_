comparing
hash
	"Hash is reimplemented because = is implemented."
        ^((start hash hashMultiply bitXor: self last hash) hashMultiply
                bitXor: self size)