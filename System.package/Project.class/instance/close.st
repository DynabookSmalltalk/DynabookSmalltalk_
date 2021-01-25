release
close
	"Close and delete this project. Try to trigger the close request through the UI first, do manually of not in the UI."

	self topView
		ifNotNil: [self changed: #close]
		ifNil: [
			self okToClose ifTrue: [
				self windowIsClosing; release]].