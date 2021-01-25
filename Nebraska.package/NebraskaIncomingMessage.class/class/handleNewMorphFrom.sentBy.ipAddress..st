handlers
handleNewMorphFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	| newObject thumbForm targetWorld |

	newObject := self newObjectFromStream: dataStream.
	NebraskaCommunicatorMorph playArrivalSound.
	targetWorld := self currentWorld.
	(NebraskaMorphsWelcomeMorph morphsWelcomeInWorld: targetWorld) ifTrue: [
		newObject position: (
			newObject 
				valueOfProperty: #positionInOriginatingWorld 
				ifAbsent: [(targetWorld randomBoundsFor: newObject) topLeft]
		).
		WorldState addDeferredUIMessage: [
			newObject openInWorld: targetWorld.
		].
		^self
	].
	thumbForm := newObject imageForm scaledToSize: 50@50.
	Smalltalk at: #SugarListenerMorph ifPresent: [:c |
		c addToGlobalIncomingQueue: {
			thumbForm. newObject. senderName. ipAddressString
		}.
		WorldState addDeferredUIMessage: [
			c ensureListenerInCurrentWorld
		].
	].