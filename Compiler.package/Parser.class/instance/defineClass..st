error correction
defineClass: className 
	"prompts the user to define a new class,  
	asks for it's category, and lets the users edit further  
	the definition"
	| sym cat def d2 |
	sym := className asSymbol.
	cat := UIManager default request: 'Enter class category : ' initialAnswer: self encoder classEncoding theNonMetaClass category.
	cat
		ifEmpty: [cat := 'Unknown'].
	def := 'Object subclass: #' , sym , '
		instanceVariableNames: '''' 
		classVariableNames: ''''
		poolDictionaries: ''''
		category: ''' , cat , ''''.
	d2 := UIManager default request: 'Edit class definition : ' initialAnswer: def.
	d2
		ifEmpty: [d2 := def].
	Compiler evaluate: d2.
	^ encoder
		global: (cue environment bindingOf: sym)
		name: sym