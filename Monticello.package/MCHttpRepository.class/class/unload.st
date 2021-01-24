class initialization
unload
	| methodMenuServiceCategory classMenuServiceCategory |
	methodMenuServiceCategory := ServiceRegistry current serviceWithId: #browserMethodMenu.
	methodMenuServiceCategory services copy do:
		[ : each | (#(#browseMcMethodRevisions #browseMcMethodOrigin ) includes: each id) ifTrue: [ methodMenuServiceCategory services remove: each ] ].
	classMenuServiceCategory := ServiceRegistry current serviceWithId: #browserClassMenu.
	classMenuServiceCategory services copy do:
		[ : each | (#(#browseMcClassRevisions #browseMcClassOrigin ) includes: each id) ifTrue: [ classMenuServiceCategory services remove: each ] ]