menus
displayHistory
	"Let the user selecet a previous page to view."

	| menu |
	menu _ MenuMorph entitled: 'Recent URLs' translated.
	menu defaultTarget: self.
	menu addStayUpItem.
	menu addLine.
	recentDocuments reverseDo:
		[:doc |
		menu add: doc url asString selector: #displayDocument: argument: doc].
	menu popUpInWorld: self currentWorld