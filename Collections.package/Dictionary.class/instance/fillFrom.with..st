private
fillFrom: aCollection with: aBlock
	"Evaluate aBlock with each of aCollections's elements as the argument.  
	Collect the resulting values into self. Answer self."

	aCollection isDictionary
		ifFalse: [
			aCollection do: [ :element |
				self add: (aBlock value: element) ] ]
		ifTrue: [
			aCollection associationsDo: [ :association |
				self at: association key put: (aBlock value: association value) ] ]