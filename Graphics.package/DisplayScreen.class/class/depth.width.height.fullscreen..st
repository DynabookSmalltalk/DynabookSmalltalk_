display box access
depth: depthInteger width: widthInteger height: heightInteger fullscreen: aBoolean
	"Force Squeak's window (if there's one) into a new size and depth."
	"DisplayScreen depth: 8 width: 1024 height: 768 fullscreen: false"

	"August 2019: This method will be deprecated in the future! Use the HostWindowPlugin instead if possible.
	
	This method is still the only way to change the size of the display, when the image is started with the -vm-display-none flag, because
(1) you still have a Display, hurray!, and (2) HostWindowPlugin will refuse to notice that, because you don't have any windows."

	<primitive: 92>
	self primitiveFailed