initialization
initialize
	documentQueue _ SharedQueue new.
	recentDocuments _ OrderedCollection new.
	bookmark := Dictionary new.
	self loadBookmark.
	currentUrlIndex _ 0.
	currentUrl _ ''.
	pageSource _ ''.
	document _ HtmlParser parse: (ReadStream on: '').
	self status: 'sittin' translated