layout
fitContents
	"Adjust my size to fit my contents reasonably snugly"

	self extent: scroller submorphBounds extent
				+ (yScrollBar width @ xScrollBar height)
				+ (self borderWidth*2)
				 