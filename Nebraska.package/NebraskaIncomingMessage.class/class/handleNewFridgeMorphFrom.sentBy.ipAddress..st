handlers
handleNewFridgeMorphFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	| newObject |

	newObject := self newObjectFromStream: dataStream.
	newObject
		setProperty: #fridgeSender toValue: senderName;
		setProperty: #fridgeIPAddress toValue: ipAddressString;
		setProperty: #fridgeDate toValue: Time dateAndTimeNow.
	WorldState addDeferredUIMessage: [NebraskaFridgeMorph newItem: newObject].
	