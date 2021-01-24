morphic ui
viewChanges: otherInfo
	self viewChanges: self selectedInfo snapshot: self selectedSnapshot
		relativeTo:  otherInfo snapshot: (self snapshotForInfo: otherInfo)