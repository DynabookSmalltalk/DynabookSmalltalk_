command line
options
	"Answer an array with all the command line options."
	"Smalltalk commandLine options"
	^ Array streamContents:
		[ : stream | self optionsDo:
			[ : each | stream nextPut: each ] ]