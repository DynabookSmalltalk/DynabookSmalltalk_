as yet unclassified
statusReplyReceivedString

	| statusTime |
	statusTime := self valueOfProperty: #lastStatusReplyTime ifAbsent: [^'none'].
	^(self dateAndTimeStringFrom: statusTime),' accepts:
', (self valueOfProperty: #lastStatusReply) asArray printString