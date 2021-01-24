editing keys
flattenSelection: dummy
	"Replace all lines and consecutive whitespace characters of the current selection with one line separated by single spaces."
	self replaceSelectionWith: self selection string condensedIntoOneLine.
	^ true