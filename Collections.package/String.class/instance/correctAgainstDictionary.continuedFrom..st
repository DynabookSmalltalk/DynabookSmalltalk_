converting
correctAgainstDictionary: wordDict continuedFrom: oldCollection
	"Like correctAgainst:continuedFrom:.  Use when you want to correct against a dictionary."

	^self
		correctAgainstEnumerator: (
			wordDict ifNotNil: [
				[ :action | wordDict keysDo: action ] ])
		continuedFrom: oldCollection