resolving objects
asLocalObject
	"convert to an apropiate local object, could be a proxy or the real object"
	^ RSTBroker instance localObjectFor: self