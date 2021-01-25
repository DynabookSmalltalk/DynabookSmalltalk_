private
split: aString

	| formatted |
	aString ifEmpty: [ ^super split: aString ].
	formatted := [
		sourceClass prettyPrinterClass
			format: aString
			in: sourceClass
			notifying: nil
			decorated: false ] 
				on: Error
				do: [ :ex | aString ].
	^super split: formatted