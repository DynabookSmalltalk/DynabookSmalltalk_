accessing
put: newObject
	"Include newObject as one of the receiver's elements even if there is already an element with the same key. Answer the replaced SetElement object or nil if no element existed with newObject's key. This method's behavior is similar to Dictionary >> #at:put:'s, hence the name."

	| index |
	index := self scanFor: (keyBlock value: newObject).
	(array at: index)
		ifNil: [
			self atNewIndex: index put: newObject asSetElement.
			^nil ]
		ifNotNil: [ :oldObject |
			array at: index put: newObject asSetElement.
			^oldObject ]