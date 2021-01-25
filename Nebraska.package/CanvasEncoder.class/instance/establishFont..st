fonts
establishFont: aFont
	"make sure that the given font is in the fonts cache.  If it is not there already, then transmit it.  Either way, after this returns, the font is in the cache at the index specified by the return value"
	| index |
	(fontCache includesFont: aFont) ifTrue: [ ^fontCache indexOf: aFont ].
	index := fontCache indexForNewFont: aFont.
	self sendFont: aFont atIndex: index.
	^index