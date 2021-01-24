private
forgetSuperfluousMethodRemovals
	|  removedClasses |
	removedClasses := (removals select: #isClassDefinition) collect: #actualClass.
	removedClasses addAll: (removedClasses collect: #class).
	removals := removals reject: [:e | e isMethodDefinition and: [removedClasses includes: e actualClass]]