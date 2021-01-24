code generation
generateWithTempNames
	"Answer a CompiledMethod with temps names encoded in its trailer."
	| methodSansTempNames |
	"The encoder computes the schematic temp names during generation, so 
	 generate a method without temp names first.  If the method is quick there are
	 no temps and hence no temp names."
	methodSansTempNames := self
									generate: CompiledMethodTrailer empty
									using: CompiledMethod.
	^methodSansTempNames
		copyWithTrailerBytes:
			((CompiledMethodTrailer new tempNames:
				(methodSansTempNames isQuick
					ifTrue: ['']
					ifFalse: [encoder schematicTempNamesString])))