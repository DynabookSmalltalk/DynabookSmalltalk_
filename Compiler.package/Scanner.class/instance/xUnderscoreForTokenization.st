multi-character scans
xUnderscoreForTokenization
	"Parse underscores as assignments so as to be able to correctly tokenize ancient source code."
	self step.
	tokenType := #leftArrow.
	^token := #'_'