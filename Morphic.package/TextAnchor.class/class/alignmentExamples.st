examples
alignmentExamples
	"self alignmentExamples"
	| anchoredMorph textMorph text demoMorph |
	demoMorph := Morph new
		changeTableLayout;
		color: Color white;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself.
	#(top center bottom) do: [:morphAlignment |
		#(top center baseline bottom) do: [:textAlignment |
			anchoredMorph := Morph new.
			anchoredMorph textAnchorProperties verticalAlignment: {morphAlignment . textAlignment}.
			anchoredMorph textAnchorProperties padding: (anchoredMorph textAnchorProperties padding top: 10).
			text := Text streamContents: [ :stream | 
				stream
					nextPutAll: ('Here is an {1}, {2} example: ' format: {morphAlignment . textAlignment});
					nextPutAll: (Text
						string: Character startOfHeader asString
						attributes: {TextAnchor new anchoredMorph: anchoredMorph. 
							TextColor color: Color transparent});
					nextPutAll: ' with the morph in the text.'].
			textMorph := text asMorph.
			textMorph height: 100.
			demoMorph addMorph: textMorph]].
	demoMorph openInWorld