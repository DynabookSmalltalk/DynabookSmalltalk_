cleanup
stubAllAncestry
	"Replace VersionInfo instances which are more than 10 versions behind with a MCInfoProxy which will dynamically re-retrieve them from the current repository if necessary."
	MCWorkingCopy allManagers do: [ : each | each stubAncestry ]