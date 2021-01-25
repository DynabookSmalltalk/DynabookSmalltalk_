viewer
methodInterfacesInPresentationOrderFrom: interfaceList forCategory: aCategory 
	"Answer the interface list sorted in desired presentation order, using a 
	static master-ordering list, q.v. The category parameter allows an 
	escape in case one wants to apply different order strategies in different 
	categories, but for now a single master-priority-ordering is used -- see 
	the comment in method EToyVocabulary.masterOrderingOfPhraseSymbols"

	| masterOrder ordered unordered |
	masterOrder := Vocabulary eToyVocabulary masterOrderingOfPhraseSymbols.
	ordered := OrderedCollection new. 
	unordered := OrderedCollection new.

	interfaceList do: [:interface | 
		| index |
		index := masterOrder indexOf: interface elementSymbol.
		index = 0
			ifTrue: [unordered addLast: interface]
			ifFalse: [ordered addLast: index -> interface]].

	ordered sort: [:a :b | a key < b key].
	unordered sort: [:a :b | a wording < b wording].
	
	^ Array
		streamContents: [:stream | 
			ordered do: [:assoc | stream nextPut: assoc value].
			stream nextPutAll: unordered]