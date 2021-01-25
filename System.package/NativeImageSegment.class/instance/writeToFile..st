read/write segment
writeToFile: shortName
	"The short name can't have any fileDelimiter characters in it.  It is remembered in case the segment must be brought in and then sent out again (see ClassDescription updateInstancesFrom:)."

	segmentName := (shortName endsWith: '.seg')
		ifTrue: [shortName copyFrom: 1 to: shortName size - 4]
		ifFalse: [shortName].
	segmentName last isDigit ifTrue: [segmentName := segmentName, '-'].
	self writeToFile.