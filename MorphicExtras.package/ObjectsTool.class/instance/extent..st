layout
extent: anExtent
	"The user has dragged the grow box such that the receiver's extent would be anExtent.  Do what's needed"
	super extent: anExtent.
	self submorphsDo: [:m |
		m width: anExtent x]