initialization
fontName: fontName size: fontSize
	| newTextStyle |
	newTextStyle := ((TextStyle named: fontName asSymbol) ifNil: [ TextStyle default ]) copy.
	textStyle := newTextStyle.
	text addAttribute: (TextFontChange fontNumber: (newTextStyle fontIndexOfSize: fontSize)).
	self releaseParagraph.