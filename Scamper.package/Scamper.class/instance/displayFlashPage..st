document handling
displayFlashPage: newSource
	"A shockwave flash document -- embed it in a text"
	| attrib stream player |
	true ifTrue: [^self error: 'No flash for you :( Flash is removed']."
	stream _ (RWBinaryOrTextStream with: newSource content) binary reset."
	"(FlashFileReader canRead: stream) ifFalse:[^false]." "Not a flash file"
	"player _ (FlashMorphReader on: stream) processFileAsync.
	player sourceUrl: newSource url.
	player startPlaying.
	attrib _ TextAnchor new anchoredMorph: player.
	formattedPage _ (Character value: 1) asText.
	backgroundColor _ self defaultBackgroundColor.
	formattedPage addAttribute: attrib from: 2 to: 2.

	currentUrl _ newSource url.
	pageSource _ newSource content.
"
	"remove it from the history--these thigns are too big!"
	"ideally, there would be a smarter history mechanism that can do things like remove items when memory consumption gets too high...."
"	recentDocuments removeLast."

	
"self changeAll: 	#(currentUrl relabel hasLint lint backgroundColor formattedPage formattedPageSelection).
	self status: 'sittin' translated."
	^true