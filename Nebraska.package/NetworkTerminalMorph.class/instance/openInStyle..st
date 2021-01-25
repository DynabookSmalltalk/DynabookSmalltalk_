initialization
openInStyle: aSymbol

	aSymbol == #naked ifTrue: [
		self openInWorld.
	].
	aSymbol == #scaled ifTrue: [
		self openScaled.
	].
	aSymbol == #bordered ifTrue: [
		AlignmentMorph newColumn
			hResizing: 	#shrinkWrap;
			vResizing: 	#shrinkWrap;
			borderWidth: 8;
			borderColor: Color blue;
			addMorph: self;
			openInWorld.
	].

	[
		[self world isNil] whileFalse: [(Delay forSeconds: 2) wait].
		self disconnect.
	] fork.

