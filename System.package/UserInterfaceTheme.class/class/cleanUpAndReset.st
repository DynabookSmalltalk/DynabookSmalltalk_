initialize-release
cleanUpAndReset
	"Rebuild all themes and re-apply the current one by name."
	
	| nameToReset |
	nameToReset := UserInterfaceTheme current name.
	self cleanUp: true.
	(self named: nameToReset) apply.