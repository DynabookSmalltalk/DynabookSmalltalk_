*System-Support
asSimpleSetter
	"Return a setter message from a getter message. For example, #name asSimpleSetter returns #name:"
	
	self size > 0 ifTrue: [
		self last = $:
			ifTrue: [ self numArgs = 1 ifTrue: [ ^ self asSymbol ] ]
			ifFalse: [ self numArgs = 0 ifTrue: [ ^ (self copyWith: $:) asSymbol ] ] ].
		
	self error: 'Only simple setters and getters can be converted to simple setters!'.