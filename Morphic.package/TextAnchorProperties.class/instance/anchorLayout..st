accessing
anchorLayout: aSymbolOrNil
	"Anchor layout determines how the morph is embedded into the text.
	
	document:	The morph is placed relative to the complete document. 
	The relative position is in relation to the document topLeft.
	inline: The moph is layouted inline. The position of the morph is 
	determined through verticalAlignment and consumesHorizontalSpace."
	
	self assert: (#(document inline nil) includes: aSymbolOrNil).
	^ anchorLayout := aSymbolOrNil