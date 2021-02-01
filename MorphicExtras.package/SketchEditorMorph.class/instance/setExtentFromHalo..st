morphic
setExtentFromHalo: anExtent
	"The user has dragged the grow box such that the receiver's extent would be anExtent.  Do what's needed"
	super setExtentFromHalo: ((anExtent x max: paintingForm width) @ (anExtent y max: paintingForm height)).
