accessing
at: aKey 
	"answer the object for aKey, if not present in the cache creates it"
	| element keyHash |
	calls _ calls + 1.
	keyHash _ aKey hash.
	1
		to: size
		do: [:index | 
			element _ values at: index.
			(keyHash
						= (element at: 2)
					and: [aKey
							= (element at: 1)])
				ifTrue: ["Found!"
					hits _ hits + 1.
					values
						replaceFrom: 2
						to: index
						with: (values first: index - 1).
					values at: 1 put: element.
					^ element at: 3]].
	"Not found!"
	element _ {aKey. keyHash. factory value: aKey}.
	values
		replaceFrom: 2
		to: size
		with: values allButLast.
	values at: 1 put: element.
	^ element at: 3