*System-Localization
translated
	"answer the receiver translated to the default language"
	| translation |
	translation := self
		translatedTo: LocaleID current
		inDomain: (TextDomainManager domainOfMethod: thisContext sender method).
	self == translation ifTrue: [^self translatedInAllDomains].
	^translation