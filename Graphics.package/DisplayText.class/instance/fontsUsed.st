accessing
fontsUsed
	"Return a list of all fonts used currently in this text.  8/19/96 tk"

	^ text runs values asSet collect: [:each | textStyle fontAt: each]