fileIn/Out
uniqueFileNameFor: segName
	"Choose a unique file name for the segment with this name."
	| segDir fileName listOfFiles |
	segDir := self segmentDirectory.
	listOfFiles := segDir fileNames.
	BiggestFileNumber ifNil: [BiggestFileNumber := 1].
	BiggestFileNumber > 99 ifTrue: [BiggestFileNumber := 1].	"wrap"
	[fileName := segName, BiggestFileNumber printString, '.seg'.
	 (listOfFiles includes: fileName)] whileTrue: [
		BiggestFileNumber := BiggestFileNumber + 1].	"force a unique file name"
	^ fileName