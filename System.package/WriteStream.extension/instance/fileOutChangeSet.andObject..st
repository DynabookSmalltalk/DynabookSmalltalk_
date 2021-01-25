*System-Object Storage-fileIn/Out
fileOutChangeSet: aChangeSetOrNil andObject: theObject
	"Write a file that has both the source code for the named class and an object as bits.  Any instance-specific object will get its class written automatically."

	"An experimental version to fileout a changeSet first so that a project can contain its own classes"


	self setFileTypeToObject.
		"Type and Creator not to be text, so can attach correctly to an email msg"
	self header; timeStamp.

	aChangeSetOrNil ifNotNil: [
		aChangeSetOrNil fileOutPreambleOn: self.
		aChangeSetOrNil fileOutOn: self.
		aChangeSetOrNil fileOutPostscriptOn: self.
	].
	self trailer.	"Does nothing for normal files.  HTML streams will have trouble with object data"

	"Append the object's raw data"
	(SmartRefStream on: self)
		nextPut: theObject;  "and all subobjects"
		close.		"also closes me"
