changing page
jumpToAbsoluteUrl: urlText
	"start downloading a new page.  The page source is downloaded in a background thread"
	|  newUrl newSource |

	self stopEverything.

	"get the new url"
	newUrl _ urlText asUrl.


	"if it fundamentally doesn't fit the pages-and-contents model used internally, spawn off an external viewer for it"
	newUrl hasContents ifFalse: [ newUrl activate.  ^true ].

	"fork a Process to do the actual downloading, parsing, and formatting.  It's results will be picked up in #step"
	self status: ('downloading {1}...' translated format:{newUrl asString}).

	downloadingProcess _ [ 
	  	newSource _ [ newUrl retrieveContentsForBrowser: self ] ifError: [ :msg :ctx |
			MIMEDocument contentType: 'text/plain' content: msg ].

		newSource 
			ifNil: [ newSource _ MIMEDocument contentType: 'text/plain' content: 'Error retrieving this URL' translated].

			newSource url ifNil: [
				newSource _ MIMEDocument contentType: newSource contentType  content: newSource content  url: newUrl ].

			documentQueue nextPut: newSource.
			downloadingProcess _ nil.
	] newProcess.
	downloadingProcess resume.

	self addNextToRecentDocuments.	
	^true
