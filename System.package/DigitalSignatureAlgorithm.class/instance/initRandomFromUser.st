initialization
initRandomFromUser
	"Ask the user to type a long random string and use the result to seed the secure random number generator."

	^ self initRandomFromString: (UIManager default request: 'Enter a long random string to seed the random generator.').