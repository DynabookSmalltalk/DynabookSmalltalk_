versions
allVersionNames
	"Answers all the version names in this repository"

	^ dict values collect: [:ea | ea info name]
	