user interface
fullScreenSize
	"Answer the size to which a window displaying the receiver should be set"
	| adj |
	adj := (3 * Preferences scrollBarWidth) @ 0.
	^ Rectangle origin: adj extent: (DisplayScreen actualScreenSize - adj)