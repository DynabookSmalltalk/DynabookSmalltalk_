initialize-release
cleanUp

	MorphExtension allInstancesDo: [ :each | each removeUndoCommands ]