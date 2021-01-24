initialize-release
init: aCue notifying: anObject
	"The use of the variable requestor is a bit confusing here. This is
	*not* the original requestor, which is available through the cue.
	It's the Parser instance that is using the encoder."

	self setCue: aCue.
	requestor := anObject.
	nTemps := 0.
	supered := false.
	self initScopeAndLiteralTables.
	cue getClass variablesAndOffsetsDo:
		[:variable "<String|CFieldDefinition>" :offset "<Integer|nil>" |
		offset isNil
			ifTrue: [scopeTable at: variable name put: (FieldNode new fieldDefinition: variable)]
			ifFalse: [scopeTable
						at: variable
						put: (offset >= 0
								ifTrue: [InstanceVariableNode new
											name: variable index: offset]
								ifFalse: [MaybeContextInstanceVariableNode new
											name: variable index: offset negated])]].
	cue context ifNotNil:
		[| homeNode |
		 homeNode := self bindArg: self doItInContextName.
		 "0th temp = aContext passed as arg"
		 cue context tempNames withIndexDo:
			[:variable :index|
			variable ~= self doItInContextName ifTrue:
				[scopeTable
					at: variable
					put: (MessageAsTempNode new
							receiver: homeNode
							selector: #namedTempAt:
							arguments: (Array with: (self encodeLiteral: index))
							precedence: 3
							from: self)]]].
	sourceRanges := Dictionary new: 32.
	globalSourceRanges := OrderedCollection new: 32