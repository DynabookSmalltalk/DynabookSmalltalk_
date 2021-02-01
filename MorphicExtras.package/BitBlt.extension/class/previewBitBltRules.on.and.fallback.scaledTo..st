*MorphicExtras
previewBitBltRules: rules on: aForm1 and: aForm2 fallback: fallbackForm scaledTo: aNumberOrPoint
	"Returns a combined morph of the result of each rule applied on aForm1 combined with 
	aForm2 scaled to aNumberOrPoint. If the combination faild with a rule, fallbackForm is 
	shown instead. The number of each rule is appended at the bottom of each result."

	| resultMorph tileExtent |
	tileExtent := aNumberOrPoint asPoint.
	resultMorph := Morph new
		color: Color transparent;
		extent: (rules size * tileExtent x)@tileExtent y;
		yourself.

	rules withIndexDo: [ :rule :index | | form formMorph numberLabel |
		form := aForm1 copy.
		[aForm2 copy displayOn: form at: 0@0 rule: rule]
			on: Exception 
			do: [form := fallbackForm].
		formMorph := (form scaledToSize: tileExtent) asMorph
			position: (index*tileExtent x)@0;
			yourself.
		resultMorph addMorph: formMorph.
	
		numberLabel := rule asString asMorph
	      	center: ((index+0.5)*tileExtent x)@tileExtent y;
			yourself.
		resultMorph addMorph: numberLabel].

	^ resultMorph