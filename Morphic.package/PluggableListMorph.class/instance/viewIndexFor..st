filtering
viewIndexFor: modelIndex 
	"The model does not know anything about the receiver's filtering. So if I am filtered, we must determine the correct index by scanning the filtered list in the view -- or use the lookup cache."

	self hasFilter ifFalse: [^ modelIndex]. "No lookup needed."
	self filterableList ifFalse: [^ modelIndex]. "No lookup needed."
	modelIndex = 0 ifTrue: [^ 0]. "Nothing selected."
	
	^ modelToView at: modelIndex ifAbsent: [0]