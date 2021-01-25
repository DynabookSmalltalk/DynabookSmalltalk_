fileIn
dependentsRestore: aProject
	"Retrieve the list of dependents from the exporting system, hook them up, and erase the place we stored them."

	| dict |
	dict := aProject projectParameterAt: #GlobalDependentsInProject.
	dict ifNil: [^ self].
	dict associationsDo: [:assoc |
		assoc value do: [:dd | assoc key addDependent: dd]].

	self dependentsCancel: aProject.