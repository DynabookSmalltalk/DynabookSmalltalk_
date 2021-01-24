initialization
inAScrollPane
	"Answer a scroll pane that allows the user to scroll the receiver in either direction.  It will have permanent scroll bars unless you take some special action."

	| widget |
	widget := ScrollPane new.
	widget borderWidth: 0.

	widget scroller addMorph: self.
	self position: 0@0.

	widget
		hScrollBarPolicy: #whenNeeded;
		vScrollBarPolicy: #whenNeeded;
		fit;
		extent: (widget width min: 300 max: 100) @ (widget height min: 150 max: 100).

	widget color: self color darker darker.
	^ widget