menus
editStartPage
	| win textMorph |
	Smalltalk isMorphic ifFalse: [^ self inform: 'only works for morphic currently' translated].

	win _ SystemWindow labelled: 'edit Bookmark page' translated.
	win model: self.
	textMorph _ PluggableTextMorph on: self text: #startPage  accept: #startPage:.
	win addMorph: textMorph frame: (0@0 extent: 1@1).
	win openInWorld.
	^ true