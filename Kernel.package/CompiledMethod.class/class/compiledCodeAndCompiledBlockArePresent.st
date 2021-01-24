full block bootstrap
compiledCodeAndCompiledBlockArePresent
	^((Smalltalk classNamed: #CompiledCode) notNil
	   and: [((Smalltalk classNamed: #CompiledCode) subclasses collect: [:ea| ea name])
						= #(CompiledMethod CompiledBlock)])