as yet unclassified
dateAndTimeStringFrom: totalSeconds

	| dateAndTime |
	dateAndTime := Time dateAndTimeFromSeconds: totalSeconds.
	^dateAndTime first printString,' ',dateAndTime second printString