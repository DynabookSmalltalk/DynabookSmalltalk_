SuperSwiki
tellAFriend: emailAddressOrNil 
	"
	Project current tellAFriend
	"
	| urlForLoading |
	(urlForLoading := self urlForLoading)
		ifNil: [urlForLoading := self url
			"fallback for dtp servers"].
	urlForLoading isEmptyOrNil
		ifTrue: [^ self inform: 'Since this project has not been saved yet,
I cannot tell someone where it is.' translated].
	FancyMailComposition new
		celeste: nil
		to: (emailAddressOrNil
				ifNil: ['RECIPIENT.GOESHERE'])
		subject: 'New/Updated Squeak project'
		initialText: 'This is a link to the Squeak project ' , self name , ': ' , String crlf
		theLinkToInclude: urlForLoading;
		 open