connection - server
process: aSocket 
	"process a new open socket"
	[| executor result | 
	executor _ aSocket getObject.
	result _ executor executeIn: self.
	aSocket sendObject: result]
		ensure: [""
			aSocket closeAndDestroy]