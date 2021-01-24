listing
visibleProtocols
	| methods protocols |
	self switchIsComment ifTrue: [^ Array empty].
	methods := self methodsForSelectedClassAndMetaSelection.
	protocols := methods collect: [:ea | ea category] as: Set.
	(protocols size > 1) ifTrue: [protocols add: '-- all --'].
	^ protocols sorted