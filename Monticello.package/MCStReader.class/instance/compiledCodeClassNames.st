private
compiledCodeClassNames
	"Answer the names of classes for which the type is #compiledMethod. Traditionally,
	this was only class CompiledMehod, but later refactorings require that CompiledCode
	and its subclasses be treated as type #compiledMethod."

	^{ #CompiledCode . #CompiledBlock . #CompiledMethod }