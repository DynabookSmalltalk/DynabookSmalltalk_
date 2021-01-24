comparing
= aByteString 
	"Ignore any file-extension for comparison of MCVersionNames."
	| myVersionName |
	aByteString isString ifFalse: [ ^ false ].
	myVersionName := self versionName.
	^ (myVersionName
		compare: myVersionName
		with: aByteString asMCVersionName versionName
		collated: AsciiOrder) = 2