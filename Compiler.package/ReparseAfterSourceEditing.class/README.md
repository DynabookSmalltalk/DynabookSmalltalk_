A ReparseAfterSourceEditing is a Notification used to restart the syntax parsing phase of a compilation after a source code edition.

Instance Variables
	newSource:		<UndefinedObject | String | Text | Stream>

newSource
	- this is the new source code to be used for restarting compilation if non interactive

In case of interactive compilation, newSource variable is nil because source code edition is performed directly in the source code editor, and the new source code will be picked directly there by the compiler.

In case of non interactive compilation, source code edition typically occurs in a SyntaxError window popping up. But the compiler has no direct access to this object, so newSource has to be passed by our intermediate.
