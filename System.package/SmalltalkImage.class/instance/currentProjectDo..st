miscellaneous
currentProjectDo: aBlock 
	"So that code can work after removal of Projects"
	self
		at: #Project
		ifPresent: [:projClass | aBlock value: projClass current]