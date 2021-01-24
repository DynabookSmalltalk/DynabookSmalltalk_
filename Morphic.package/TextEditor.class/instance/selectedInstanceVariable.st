menu messages
selectedInstanceVariable
	"Try to make an association from an instance-variable name to the class where this variable is defined. Make the implementation robust for models that do not know about classes.
	
	Note that inst-var names might not have symbol a representation, only via their accessors."

	(model respondsTo: #selectedClassOrMetaClass) ifFalse: [ ^ nil ].
		
	^ self selection string ifNotNil: 
		[ :token | model selectedClassOrMetaClass ifNotNil:
			[ :behavior |
				(behavior instVarIndexFor: token ifAbsent: [ 0 ]) ~= 0
					ifTrue: [ token -> behavior ]
					ifFalse: [ nil ] ] ]