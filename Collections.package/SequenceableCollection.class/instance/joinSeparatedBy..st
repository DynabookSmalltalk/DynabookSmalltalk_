converting
joinSeparatedBy: aSeparator
	"Returns a string, which is a concatenation of each element's string representation separated by another string.
	
	August 2019 -- http://forum.world.st/The-Inbox-Collections-ct-827-mcz-td5099876.html
	There was a discussion about whether to move this method up to Collection. We identified a trade-off between (iinterface) convenience and (result) predictability. In Collection, this method would be available for Set, too. However, random result order makes such a feature questionable. What would be the result of #(1 2 3) asSet joinSeparatedBy: '-'? For such scenarios, some people argued, it would be better to explicitely call #asArray and maybe explain why a non-sequenceable collection was used in the first place."

	^ String streamContents: [:stream |
		self joinOn: stream separatedBy: aSeparator]