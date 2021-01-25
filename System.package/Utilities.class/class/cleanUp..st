class initialization
cleanUp: aggressive

	aggressive ifTrue: [
		self authorInitials: String empty.
		self authorName: String empty.
		CommonRequestStrings := nil].