accessing-pragmas & properties
removeProperty: propName ifAbsent: aBlock
	"Remove the property propName if it exists.
	 Answer the evaluation of aBlock if the property is missing."
	^self homeMethod removeProperty: propName ifAbsent: aBlock