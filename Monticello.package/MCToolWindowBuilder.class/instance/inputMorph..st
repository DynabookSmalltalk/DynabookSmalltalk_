building-parts
inputMorph: aSymbol
	| text |
	text := builder pluggableInputFieldSpec new.
	text 
		model: tool;
		getText: aSymbol; 
		setText: (aSymbol, ':') asSymbol;
		frame: currentFrame.
	window children add: text