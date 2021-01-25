error checking
checkAndReportLoadError
	"Check that the load has occurred.  A side-efect of the load primitive is to become
	 the segment into an Array of the loaded objects, so they can be enumerated.  If
	 this hasn't happened also check if the segment is a zero-length word array which
	 indicates we're running on an older Spur VM that doesn't do the become."
	segment class isPointers ifTrue: [^self]. "ok"
	(segment class == WordArrayForSegment
	 and: [segment size = 0]) ifTrue:
		[^self error: 'The load primitive has not becomed segment into an Array of the loaded objects. \Please upgrade your virtual machine to one that does this.' withCRs].
	^self error: 'Segment has not been becommed into the loaded objects'