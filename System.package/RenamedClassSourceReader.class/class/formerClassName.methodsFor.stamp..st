instance creation
formerClassName: formerClassName methodsFor: aCategory stamp: aString

	^self new
		setClass: formerClassName 
		category: aCategory 
		changeStamp: aString