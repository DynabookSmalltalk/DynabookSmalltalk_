document handling
displayDocument: mimeDocument
	"switch to viewing the given MIMEDocument"
	|  handled  urlString |
	handled _ false.

	"add it to the history"
"	recentDocuments removeAllSuchThat: [ :d | d url = mimeDocument url ]."
	currentUrlIndex > recentDocuments size
		ifTrue: [recentDocuments addLast: mimeDocument].
"		ifFalse: [recentDocuments removeAt: currentUrlIndex]."
	recentDocuments size > 20 ifTrue: [ recentDocuments removeFirst ].
		
	mimeDocument mainType = 'image' 
		ifTrue: [handled _ self displayImagePage: mimeDocument].

	(mimeDocument contentType beginsWith: 'text/html') 
		ifTrue: [handled _ self displayTextHtmlPage: mimeDocument].

	mimeDocument contentType = 'x-application/shockwave-flash'
		ifTrue:[handled _ self displayFlashPage: mimeDocument].

	(#('audio/midi' 'audio/x-midi') includes: mimeDocument contentType) 
		ifTrue: [handled _ self processMidiPage: mimeDocument].

	"Before we display plain text files we should look at the extension of the URL"
	(handled not and:[ mimeDocument mainType = 'text']) ifTrue:[
		urlString _ mimeDocument url asString.
		(urlString endsWithAnyOf: #('.gif' '.jpg' '.pcx')) 
			ifTrue:[handled _ self displayImagePage: mimeDocument].
		(handled not and:[urlString endsWithAnyOf: #('.mid' '.midi')])
			ifTrue:[handled _ self processMidiPage: mimeDocument].
		(handled not and:[urlString endsWith: '.swf'])
			ifTrue:[handled _ self displayFlashPage: mimeDocument].
	].

	(handled not and: [ mimeDocument mainType = 'text']) ifTrue: [
		self displayPlainTextPage: mimeDocument.
		handled _ true].


	handled ifFalse: [self processUnhandledPage: mimeDocument].