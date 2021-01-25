fileIn/Out
segmentDirectory
	"Return a directory object for the folder of segments.
	Create such a folder if none exists."
	| dir folderName |
	dir := FileDirectory default.
	folderName := dir class localNameFor: self folder. "imageName:=segs"
	(dir includesKey: folderName) ifFalse:
		[dir createDirectory: folderName].	"create the folder if necess"
	^ dir directoryNamed: folderName