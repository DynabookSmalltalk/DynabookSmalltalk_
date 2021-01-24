configuring
fillInTheBlankConfigure: aTemplateString
	| chunk repo |
	
	aTemplateString ifNil: [ ^ false ].
	chunk := UIManager default
		multiLineRequest: self fillInTheBlankRequest
		centerAt: Sensor cursorPoint
		initialAnswer: aTemplateString
		answerHeight: 120.
			
	chunk 
		ifNotNil: [ 
			repo := self readFrom: chunk readStream.
			repo creationTemplate: chunk. 
	].

	^ repo