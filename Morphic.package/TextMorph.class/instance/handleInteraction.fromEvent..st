editing
handleInteraction: interactionBlock fromEvent: evt
	"Perform the changes in interactionBlock, noting any change in selection
	and possibly a change in the size of the paragraph (ar 9/22/2001 - added for TextPrintIts)"

	| oldEditor oldParagraph oldText oldSelection |
	oldEditor := editor.
	oldParagraph := paragraph.
	oldText := oldParagraph text copy.
	oldSelection := oldParagraph selectionRects. "already copy"

	"Note old selection."
	self selectionChanged: oldSelection.
	
	interactionBlock value.

	(oldParagraph == paragraph) ifTrue:[
		"this will not work if the paragraph changed"
		editor := oldEditor.     "since it may have been changed while in block"
	].
	
	"Note new selection."
	paragraph selectionRects in: [:newSelection |
		newSelection ~= oldSelection ifTrue: [
			self selectionChanged: newSelection]].
		
	(oldText = paragraph text and: [ oldText runs = paragraph text runs ])
		ifFalse:[ 
			self paragraph composeAll.
			self updateFromParagraph ].
	
	self flag: #ImmPlugin.
	"self setCompositionWindow."