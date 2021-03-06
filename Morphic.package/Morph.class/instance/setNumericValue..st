e-toy support
setNumericValue: aValue
	"Set the receiver's contents to reflect the given numeric value.  Only certain kinds of morphs know what to do with this, the rest, for now, stash the number in a property, where it may not be visible but at least it won't be lost, and can be retrieved by the companion getter.  This code is never reached under normal circumstances, because the #numericValue slot is not shown in Viewers for most kinds of morphs, and those kinds of morphs that do show it also reimplement this method.  However, this code *could* be reached via a user script which sends #setNumericValue: but whose receiver has been changed, via tile-scripting drag and drop for example, to one that doesn't directly handle numbers"

	ScriptingSystem informScriptingUser: 'an unusual setNumericValue: call was made'.
	self renderedMorph setProperty: #numericValue toValue: aValue
