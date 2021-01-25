*System-Object Storage-fileIn/Out
fileOutClass: extraClass andObject: theObject
	"Write a file that has both the source code for the named class and an object as bits.  Any instance-specific object will get its class written automatically."

	| class srefStream |
	self setFileTypeToObject.
		"Type and Creator not to be text, so can attach correctly to an email msg"
	self text.
	self header; timeStamp.

	extraClass ifNotNil: [
		class := extraClass.	"A specific class the user wants written"
		class sharedPools size > 0 ifTrue:
			[class shouldFileOutPools
				ifTrue: [class fileOutSharedPoolsOn: self]].
		class fileOutOn: self moveSource: false toFile: 0].
	self trailer.	"Does nothing for normal files.  HTML streams will have trouble with object data"
	self binary.

	"Append the object's raw data"
	srefStream := SmartRefStream on: self.
	srefStream nextPut: theObject.  "and all subobjects"
	srefStream close.		"also closes me"
