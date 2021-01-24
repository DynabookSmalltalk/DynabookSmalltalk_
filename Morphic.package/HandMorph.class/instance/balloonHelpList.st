balloon help
balloonHelpList
	"Return all balloon morphs associated with this hand"

	self flag: #performance. "mt: Make it an instance variable because we need to access this on every keystroke in a text field. See senders of #deleteBalloon."
	
	^ self
		valueOfProperty: #balloonHelpMorphs
		ifAbsentPut: [OrderedCollection new]