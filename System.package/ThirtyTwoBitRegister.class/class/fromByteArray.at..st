instance creation
fromByteArray: aByteArray at: startIndex
	"Answer a new instance whose initial contents is copied from next four bytes from aByteArray starting at startIndex..
	Convention is Most Significant Byte first (aka big endian)."

	^ self basicNew loadFrom: aByteArray at: startIndex
