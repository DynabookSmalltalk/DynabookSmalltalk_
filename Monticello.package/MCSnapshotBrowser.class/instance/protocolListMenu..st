menus
protocolListMenu: aMenu 
	protocolSelection
		ifNotNil: [aMenu
				add: ('load protocol ''{1}''' translated format: {protocolSelection})
				action: #loadProtocolSelection ].
	^ aMenu