private
depurate
	"PRIVATE: This method is called from a critical section, be carefull to call 
	it without synchonization"
	"keys make a Set, so I can remove without problem"
	dictionary keys
		do: [:key | (dictionary at: key) isNil
				ifTrue: [dictionary removeKey: key]].
