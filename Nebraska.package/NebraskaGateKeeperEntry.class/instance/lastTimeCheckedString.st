as yet unclassified
lastTimeCheckedString

	| statusTime |
	statusTime := self valueOfProperty: #lastTimeChecked ifAbsent: [^'none'].
	^(self dateAndTimeStringFrom: statusTime)