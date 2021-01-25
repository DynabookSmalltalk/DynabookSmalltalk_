access
allObjectsDo: aBlock
	"Enumerate all objects that came from this segment.  NOTE this assumes that the segment was created (and extracted).  After the segment has been installed (install), this method allows you to enumerate its objects."
	self checkAndReportLoadError.
	segment do: aBlock