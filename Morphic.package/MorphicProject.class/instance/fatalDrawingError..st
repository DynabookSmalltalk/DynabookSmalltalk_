scheduling & debugging
fatalDrawingError: errMsg
	"Morphic drawing failed and could not be recovered. So we end up here."
	
	self primitiveError: errMsg.

	"Hm... we should jump into a 'safe' worldState here, but how do we find it?!"