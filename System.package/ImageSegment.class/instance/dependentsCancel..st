fileIn
dependentsCancel: aProject
	"Erase the place we temporarily held the dependents of things in this project.  So we don't carry them around forever."

	aProject projectParameters removeKey: #GlobalDependentsInProject ifAbsent: []