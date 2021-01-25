read/write segment
readFromFile
	"Read in a simple segment.  Use folder of this image, even if remembered as previous location of this image"

	| ff realName |
	realName := self class folder, FileDirectory slash, self localName.
	ff := FileStream readOnlyFileNamed: realName.
	segment := ff nextWordsInto: (WordArrayForSegment new: ff size//4).
	ff close.
	state := #active