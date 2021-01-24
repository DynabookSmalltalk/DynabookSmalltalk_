filtering
modelIndexFor: selectionIndex 
	"The model does not know anything about the receiver's filtering. So if I am filtered, we must determine the correct index by scanning the full list in the model -- or use the lookup cache."
	
	self hasFilter ifFalse: [^ selectionIndex]. "No lookup needed."
	self filterableList ifFalse: [^ selectionIndex]. "No lookup needed."
	selectionIndex = 0 ifTrue: [^ 0]. "Nothing selected."
	
	^ viewToModel at: selectionIndex ifAbsent: [0]