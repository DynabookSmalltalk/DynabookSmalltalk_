actions
installSelection
	super installSelection.
	selection ifNotNil: [
		ignore remove: selection ifAbsent: [].
		self changed: #list].

