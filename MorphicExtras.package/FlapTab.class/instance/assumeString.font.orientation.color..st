textual tabs
assumeString: aString font: aFont orientation: orientationSymbol color: aColor 
	| aTextMorph workString tabStyle |
	labelString := aString asString.
	workString := orientationSymbol == #vertical 
				ifTrue: 
					[String streamContents: 
							[:s | 
							labelString do: [:c | s nextPut: c] separatedBy: [s nextPut: Character cr]]]
				ifFalse: [labelString]. 
	tabStyle := (TextStyle new)
				leading: 0;
				newFontArray: (Array with: aFont).
	aTextMorph := (TextMorph new setTextStyle: tabStyle) 
				contents: (workString asText addAttribute: (TextKern kern: 3)).
	aTextMorph wrapFlag: true.
	self removeAllMorphs.
	self borderStyle: (BorderStyle raised width: 2).
	aColor ifNotNil: [self color: aColor].
	self addMorph: aTextMorph centered.
	aTextMorph lock
	"
FlapTab allSubInstancesDo: [:ft | ft reformatTextualTab]
"