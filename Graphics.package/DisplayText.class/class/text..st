instance creation
text: aText 
	"Answer an instance of me such that the text displayed is aText 
	according to the system's default text style."

	^self new
		setText: aText
		textStyle: DefaultTextStyle copy
		offset: 0 @ 0