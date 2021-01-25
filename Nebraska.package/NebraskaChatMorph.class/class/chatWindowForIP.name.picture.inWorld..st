as yet unclassified
chatWindowForIP: ipAddress name: senderName picture: aForm inWorld: aWorld

	| makeANewOne aSenderBadge existing |

	existing := self instanceForIP: ipAddress inWorld: aWorld.
	existing ifNotNil: [^existing].
	makeANewOne := [
		self new
			recipientForm: aForm; 
			open; 
			setIPAddress: ipAddress
	].
	NebraskaCommunicatorMorph playArrivalSound.
	self doChatsInternalToBadge ifTrue: [
		aSenderBadge := NebraskaSenderMorph instanceForIP: ipAddress inWorld: aWorld.
		aSenderBadge ifNotNil: [
			aSenderBadge startChat: false.
			^aSenderBadge 
				findDeepSubmorphThat: [ :x | x isKindOf: NebraskaChatMorph] 
				ifAbsent: makeANewOne
		].
		aSenderBadge := NebraskaSenderMorph instanceForIP: ipAddress.
		aSenderBadge ifNotNil: [
			aSenderBadge := aSenderBadge veryDeepCopy.
			aSenderBadge 
				killExistingChat;
				openInWorld: aWorld;
				startChat: false.
			^aSenderBadge 
				findDeepSubmorphThat: [ :x | x isKindOf: NebraskaChatMorph] 
				ifAbsent: makeANewOne
		].
		(aSenderBadge := NebraskaSenderMorph new)
			userName: senderName 
			userPicture: aForm
			userEmail: 'unknown'  translated
			userIPAddress: ipAddress;
			position: 200@200;
			openInWorld: aWorld;
			startChat: false.
		^aSenderBadge 
			findDeepSubmorphThat: [ :x | x isKindOf: NebraskaChatMorph] 
			ifAbsent: makeANewOne
	].
	^makeANewOne value.

