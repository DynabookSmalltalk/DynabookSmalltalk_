as yet unclassified
mouseUpEvent: event for: aMorph

	| depictedObject |

	depictedObject := aMorph firstSubmorph valueOfProperty: #depictedObject.
	event hand attachMorph: depictedObject.
	self class removeFromGlobalIncomingQueue: depictedObject.
	self rebuild.
