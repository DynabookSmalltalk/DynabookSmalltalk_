*System-Fonts
chooseTTCFontSize: args
	"Prompt for a point size and, if one is given, add a new font size to the font named by the first member of args. If args' length is three, send a message with the selector equal to the third of args, and the receiver equal to the second of args, passing the selected style as an argument."

	| f n style |
	f := UIManager default request: 'New Point Size' initialAnswer: '0'.
	n := f asNumber.
	style := (TextConstants at: args first) addNewFontSize: n.
	style ifNotNil: [
		args second ifNotNil: [args second perform: args third with: style].
	].
