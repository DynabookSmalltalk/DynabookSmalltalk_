decoding
addFontToCache: command
	| index font |
	index := self class decodeInteger: command second.
	font := self class decodeFont: command third.

	index > fonts size ifTrue: [
		| newFonts |
		newFonts  := Array new: index.
		newFonts replaceFrom: 1 to: fonts size with: fonts.
		fonts := newFonts ].

	fonts at: index put: font