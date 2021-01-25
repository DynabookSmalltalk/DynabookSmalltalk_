private
drawCommand: aBlock
	"set up the connection for a drawing command, and then execute aBlock with the connection as an argument"
	connection updateTransform: transform andClipRect: outerClipRect.
	aBlock value: connection