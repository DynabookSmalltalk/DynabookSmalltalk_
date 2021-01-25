private
newKeyFor: anObject 
	"PRIVATE: This method is called from a critical section, be carefull to call 
	it without synchronization"
	| lastKeyAsString |
	lastKey _ lastKey + 1.
	lastKeyAsString _ 'OID-'
				, (65535 atRandom hex allButFirst: 3)
				, (lastKey hex allButFirst: 3)
				, (65535 atRandom hex allButFirst: 3).
	dictionary at: lastKeyAsString put: anObject.
	onNewKey isNil ifFalse:[onNewKey value: anObject value: lastKeyAsString].
	(lastKey isDivisibleBy: 25)
		ifTrue: [self depurate].
	^ lastKeyAsString