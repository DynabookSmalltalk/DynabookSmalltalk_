instance creation
readCarefullyFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream.  Return an error instead of putting up a SyntaxError window."

	^ [self basicReadFrom: textStringOrStream]
		on: SyntaxErrorNotification
		do: [:ex | self error: ex messageText]