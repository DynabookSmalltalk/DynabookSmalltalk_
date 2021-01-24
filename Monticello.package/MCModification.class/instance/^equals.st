comparing
= other
	^ other isModification 
	and: [obsoletion = other obsoletion
	and: [modification = other modification]]