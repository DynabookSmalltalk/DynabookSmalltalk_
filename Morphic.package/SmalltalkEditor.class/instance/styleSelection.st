do-its
styleSelection

	| styler |
	self lineSelectAndEmptyCheck: [^ ''].
	styler := self styler ifNil: [(Smalltalk classNamed: #SHTextStylerST80) new].
	^ styler styledTextFor: self selection