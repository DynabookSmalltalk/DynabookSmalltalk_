accessing
definitionLike: aDefinition ifPresent: foundBlock ifAbsent: absentBlock

	^(definitions like: aDefinition ifAbsent: nil)
		ifNil: [ absentBlock value ]
		ifNotNil: [ :definition |
			foundBlock value: definition ]