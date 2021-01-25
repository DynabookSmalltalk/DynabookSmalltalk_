read/write segment
writeForExportWithSourcesGZ: fName inDirectory: aDirectory
	"Write the segment on the disk with all info needed to reconstruct it in a new image.  For export.  Out pointers are encoded as normal objects on the disk.  Append the source code of any classes in roots.  Target system will quickly transfer the sources to its changes file."

	"this is the gzipped version which I have temporarily suspended until I can get resolve the problem with forward references tring to reposition the stream - RAA 11 june 2000"




	| fileStream allClassesInRoots classesToWriteEntirely methodsWithSource |
	state = #activeCopy ifFalse: [self error: 'wrong state'].
	(fName includes: $.) ifFalse: [
		^ self inform: 'Please use ''.pr'' or ''.extSeg'' at the end of the file name'.].
	fileStream := GZipSurrogateStream newFileNamed: fName inDirectory: aDirectory.
	fileStream fileOutClass: nil andObject: self.
		"remember extra structures.  Note class names."

	"append sources"
	allClassesInRoots := arrayOfRoots select: [:cls | cls isBehavior].
	classesToWriteEntirely := allClassesInRoots select: [ :cls | cls theNonMetaClass isSystemDefined].
	methodsWithSource := OrderedCollection new.
	allClassesInRoots do: [ :cls |
		(classesToWriteEntirely includes: cls) ifFalse: [
			cls selectorsAndMethodsDo: [ :sel :meth |
				meth sourcePointer = 0 ifFalse: [methodsWithSource add: {cls. sel. meth}].
			].
		].
	].
	(classesToWriteEntirely isEmpty and: [methodsWithSource isEmpty]) ifTrue: [
		fileStream reallyClose.	"since #close is ignored"
		^ self
	].
	"fileStream reopen; setToEnd."	"<--not required with gzipped surrogate stream"
	fileStream nextPutAll: '\\!NativeImageSegment new!\\' withCRs.
	methodsWithSource do: [ :each |
		fileStream nextPut: $!.	"try to pacify NativeImageSegment>>scanFrom:"
		fileStream nextChunkPut: 'RenamedClassSourceReader formerClassName: ',
				each first name printString,' methodsFor: ',
				(each first organization categoryOfElement: each second) asString printString,
				' stamp: ',(each third timeStamp) printString; cr.
		fileStream nextChunkPut: (each third getSourceFor: each second in: each first) asString.
		fileStream nextChunkPut: ' '; cr.
	].
	classesToWriteEntirely do: [:cls | 
		cls isMeta ifFalse: [fileStream nextPutAll: 
						(cls name, ' category: ''', cls category, '''.!'); cr; cr].
		cls organization
			putCommentOnFile: fileStream
			numbered: 0
			moveSource: false
			forClass: cls.	"does nothing if metaclass"
		cls organization categories do: 
			[:heading |
			cls fileOutCategory: heading
				on: fileStream
				moveSource: false
				toFile: 0]].
	"no class initialization -- it came in as a real object"
	fileStream reallyClose	"since #close is ignored"