system primitives
become: otherObject 
	"when remote objects participates, only remote objects that live in the 
	same image could be becomed"
	otherObject isRemote
		ifFalse: [^ self error: 'invalid #become: (the receiver is remote and the other is local)'].
	(self xxxSameImage: otherObject)
		ifFalse: [^ self error: 'invalid #become: (the receiver lives in a diferent image than the other)'].
	self
		xxxSend: (Message selector: #become: argument: otherObject)