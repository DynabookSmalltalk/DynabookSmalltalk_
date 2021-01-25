system startup
isActiveHostWindowProxyClass
"Am I active?"
	^Smalltalk platformName  = 'Mac OS' and: [Smalltalk osVersion asInteger >= 1000]