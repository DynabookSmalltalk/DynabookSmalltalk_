fileIn/Out
startUp
	| choice |
	"Minimal thing to assure that a .segs folder is present"

(Preferences valueOfFlag: #projectsSentToDisk) ifTrue: [
	(FileDirectory default includesKey: (FileDirectory localNameFor: self folder)) 
		ifFalse: [
			choice := UIManager default 
				chooseFrom: #('Create folder' 'Quit without saving')
				title: 
					'The folder with segments for this image is missing.\' withCRs,
					self folder, '\If you have moved or renamed the image file,\' withCRs,
					'please Quit and rename the segments folder in the same way'.
			choice = 1 ifTrue: [FileDirectory default createDirectory: self folder].
			choice = 2 ifTrue: [Smalltalk snapshot: false andQuit: true]]]

	