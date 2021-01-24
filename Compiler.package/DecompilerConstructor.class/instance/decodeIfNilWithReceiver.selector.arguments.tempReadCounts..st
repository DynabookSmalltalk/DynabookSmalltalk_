constructor
decodeIfNilWithReceiver: receiver selector: selector arguments: arguments tempReadCounts: tempReadCounts
	
	| node temp |
	receiver ifNil: [ ^nil ].		"For instance, when cascading"
	selector == #ifTrue:ifFalse:
		ifFalse: [^ nil].
				
	(receiver isMessage: #==
				receiver: nil
				arguments: [:argNode | argNode == NodeNil])
		ifFalse: [^ nil].
		
	"Like #to:(by:)do:, support only local temps."
	(((temp := receiver ifNilTemporary) isNil or: [tempReadCounts includesKey: temp]) or: [
		"What about 'object ifNotNil: [:o | ]', which as not read the blockArg? Just check that there is no remote vector pointing to it."
		tempReadCounts keys noneSatisfy:
			[:otherTemp |
				otherTemp isIndirectTempVector
					ifTrue: [otherTemp remoteTemps anySatisfy:
						[:remoteTemp |
						remoteTemp name = temp name]]
					ifFalse: [otherTemp name = temp name]]
			])
		ifFalse: [^ nil].
		
	node := (MessageNode new
			receiver: receiver
			selector: (SelectorNode new key: #ifTrue:ifFalse: code: #macro)
			arguments: arguments
			precedence: 3).

	"Reconfigure the message node to #ifNil:ifNotNil:. Note that original* instance variables keep their optimized format. See MessageNode >> #printIfNilNotNil:indent:."	
	node
		noteSpecialSelector: #ifNil:ifNotNil:;
		selector: (SelectorNode new key: #ifNil:ifNotNil:).
	
	temp ifNil: [^ node].
	temp isTemp ifFalse: [^ node].
	
	(arguments second isJust: NodeNil) not ifTrue:
		[temp beBlockArg.
		node arguments: {
			arguments first.
			arguments second copy arguments: { temp }; yourself }].
				
	^ node