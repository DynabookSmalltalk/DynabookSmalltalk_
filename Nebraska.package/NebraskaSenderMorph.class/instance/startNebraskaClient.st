as yet unclassified
startNebraskaClient

	| newMorph |
	[
		[
			newMorph := NetworkTerminalMorph connectTo: (self ipAddress copyUpTo: $:). "FIXME: get real port of Nebraska Server"
			WorldState addDeferredUIMessage: [newMorph openInStyle: #scaled].
		]
			on: Error
			do: [ :ex |
				WorldState addDeferredUIMessage: [
					self inform: 'No connection to: ' translated. self ipAddress,' (',ex printString,')'
				]
			].
	] fork
