as yet unclassified
addNewObject: newObject thumbForm: aForm sentBy: senderName ipAddress: ipAddressString

	| thumb row |

	thumb := aForm asMorph.
	thumb setProperty: #depictedObject toValue: newObject.
	row := self addARow: {
		thumb. 
		self inAColumn: {
			StringMorph new contents: senderName; lock.
			StringMorph new contents: ipAddressString; lock.
		}
	}.
	true ifTrue: [	"simpler protocol"
		row on: #mouseUp send: #mouseUpEvent:for: to: self.
	] ifFalse: [
		row on: #mouseDown send: #mouseDownEvent:for: to: self.
	].

