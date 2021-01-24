actions
browseSelectionOrigin
	| mcDefinition |
	selection ifNil: [ UIManager inform: 'Make a selection.' ].
	mcDefinition := selection definition.
	Cursor wait showWhile:
		[ mcDefinition mcModel ifNotNil:
			[ : mcModel | (mcModel originOf: mcDefinition)
				ifNil: [ UIManager inform: mcDefinition asString , ' was not found in any historical MC repository.' ]
				ifNotNilDo:
					[ : version | version open ] ] ]