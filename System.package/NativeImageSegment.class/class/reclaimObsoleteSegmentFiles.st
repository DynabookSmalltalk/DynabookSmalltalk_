fileIn/Out
reclaimObsoleteSegmentFiles  "NativeImageSegment reclaimObsoleteSegmentFiles"
	"Delete segment files that can't be used after this image is saved.
	Note that this is never necessary -- it just saves file space."

	| segDir segFiles folderName byName exists |
	folderName := FileDirectory default class localNameFor: self folder.
	(FileDirectory default includesKey: folderName) ifFalse: [
		^ self "don't create if absent"].
	segDir := self segmentDirectory.
	segFiles := (segDir fileNames select: [:fn | fn endsWith: '.seg']) asSet.
	exists := segFiles copy.
	segFiles isEmpty ifTrue: [^ self].
	byName := Set new.
	"Remove (save) every file owned by a segment in memory"
	NativeImageSegment allInstancesDo: [:is | | aFileName | 
		(aFileName := is localName) ifNotNil: [
			segFiles remove: aFileName ifAbsent: [].
			(exists includes: aFileName) ifFalse: [
				Transcript cr; show: 'Segment file not found: ', aFileName].
			byName add: is segmentName]].
	"Of the segments we have seen, delete unclaimed the files."
	segFiles do: [:fName | 
		"Delete other file versions with same project name as one known to us"
		(byName includes: (fName sansPeriodSuffix stemAndNumericSuffix first))
			ifTrue: [segDir deleteFileNamed: fName]].