actions
fileOutOn: aStream
	"The whole point of diffy versions is to not store the full snapshot, so ensure we don't."
	snapshot:=nil.
	super fileOutOn: aStream