accessing-pragmas & properties
removeProperty: propName
	"Remove the property propName if it exists.
	 Do _not_ raise an error if the property is missing."
	^self homeMethod removeProperty: propName