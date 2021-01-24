file streaming
readStreamForFileNamed: aString do: aBlock
	| file fileName |
	fileName := self fullNameFor: aString.
	fileName ifNil: [
		"assume that this will come from the cache."
		^MCCacheRepository default readStreamForFileNamed: aString do: aBlock ].
	file := FileStream readOnlyFileNamed: fileName.
	^[ aBlock value: file ] ensure: [ file close ].
