as yet unclassified
encodeChar: aChar to: aStream

	(self conversionNeededFor: aChar)
			ifFalse: [aStream nextPut: aChar]
			ifTrue: [aStream nextPut: $=;
						nextPut: (Character digitValue: aChar asciiValue // 16);
						nextPut: (Character digitValue: aChar asciiValue \\ 16)].
			
	
