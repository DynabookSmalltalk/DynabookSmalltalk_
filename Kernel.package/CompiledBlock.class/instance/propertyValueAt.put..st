accessing-pragmas & properties
propertyValueAt: propName put: propValue
	"Set or add the property with key propName and value propValue.
	 If the receiver does not yet have a method properties create one and replace
	 the selector with it.  Otherwise, either relace propValue in the method properties
	 or replace method properties with one containing the new property."
	^self homeMethod propertyValueAt: propName put: propValue