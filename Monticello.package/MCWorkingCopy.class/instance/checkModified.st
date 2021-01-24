operations
checkModified
	self ancestors size = 1
		ifFalse: [
			self modified: true]
		ifTrue: [
			| cleanSnapshot currentSnapshot modification |
			cleanSnapshot := self findSnapshotWithVersionInfo: self ancestors first.
			currentSnapshot := self package snapshot.
			modification := currentSnapshot patchRelativeToBase: cleanSnapshot.
			self modified: modification isEmpty not].
