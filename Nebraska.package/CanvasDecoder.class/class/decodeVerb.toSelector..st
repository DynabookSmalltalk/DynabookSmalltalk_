decode table modification
decodeVerb: verb toSelector: selector
	"verb is a single character which will be ferformed by my instances using selector"
	DecodeTable at: verb asciiValue + 1 put: selector.	