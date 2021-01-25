*System-Object Storage-fileIn/Out
fileOutChanges
	"Append to the receiver a description of all class changes."
	Cursor write showWhile:
		[self header; timeStamp.
		ChangeSet current fileOutOn: self.
		self trailer; close]