identification
setAuthorInitials
	"Put up a dialog allowing the user to specify the author's initials.  "

	self authorInitials:
		(UIManager default request: 'Please type your initials: ' translated
					initialAnswer: AuthorInitials)