*System-Support
asSimpleGetter
	"Return a getter message from a setter message. For example, #name: asSimpleGetter returns #name"

	self size > 0 ifTrue: [
		self last = $:
			ifTrue: [ self numArgs = 1 ifTrue: [ ^ self allButLast asSymbol ] ]
			ifFalse: [ self numArgs = 0 ifTrue: [ ^ self asSymbol ] ] ].
	
	self error: 'Only simple setters and getters can be converted to simple getters!'.