updating
update: anEvent 
	anEvent = #name
		ifTrue: [lastName _ self model name].
	anEvent = #eMail
		ifTrue: [lastEMail _ self model eMail]