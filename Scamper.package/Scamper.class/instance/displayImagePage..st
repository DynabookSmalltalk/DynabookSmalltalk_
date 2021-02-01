document handling
displayImagePage: newSource
	"an image--embed it in a text"
	| image imageMorph attrib text handled |
	handled _ true.
	backgroundColor _ self defaultBackgroundColor.
	formattedPage _ [
		image _ ImageReadWriter formFromStream: (RWBinaryOrTextStream with: newSource content) binary reset.
		imageMorph _ ImageMorph new image: image.
		attrib _ TextAnchor new anchoredMorph: imageMorph.
		text _ (Character value: 1) asText.
		text addAttribute: attrib from: 2 to: 2.
		text] ifError: [ :msg :ctx | handled _ false ].

	currentUrl _ newSource url.
	pageSource _ newSource content.

	"remove it from the history--these thigns are too big!"
	"ideally, there would be a smarter history mechanism that can do things like remove items when memory consumption gets too high...."
"	recentDocuments removeLast."

	self changeAll: 	#(currentUrl relabel hasLint lint backgroundColor formattedPage formattedPageSelection).
	self status: 'sittin' translated.
	^handled