network I/O
requestBufferedConnection
	"request the opposite side to send complete screen updates rather than discrete drawing commands"
	
	connection nextPut: { 'beginBuffering' }
