building-parts
codePane: aSymbol
	| text |
	text := builder pluggableCodePaneSpec new.
	text 
		model: tool;
		getText: aSymbol; 
		setText: (aSymbol, ':') asSymbol;
		frame: currentFrame.
	window children add: text