menus
browseFullProtocol
	"Open up a protocol-category browser on the value of the receiver's current selection.    If in mvc, an old-style protocol browser is opened instead.  Someone who still uses mvc might wish to make the protocol-category-browser work there too, thanks."

	| aClass |

	(Smalltalk isMorphic and: [Smalltalk hasClassNamed: #Lexicon]) ifFalse: [^ self spawnFullProtocol].
	(aClass := self selectedClassOrMetaClass) ifNotNil:
		[(Smalltalk at: #Lexicon) new openOnClass: aClass inWorld: ActiveWorld showingSelector: self selectedMessageName]