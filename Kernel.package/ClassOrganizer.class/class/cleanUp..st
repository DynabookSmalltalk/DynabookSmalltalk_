class initialization
cleanUp: aggressive
	"Remove empty method categories when cleaning aggressively"

	aggressive ifTrue: [
		SystemChangeNotifier uniqueInstance doSilently: [
			Smalltalk removeEmptyMessageCategories]].
