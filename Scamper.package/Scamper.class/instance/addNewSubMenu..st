menus
addNewSubMenu: aDictionary 
	| subMenu url sub |
	subMenu _ MenuMorph new.
	aDictionary
		keysAndValuesDo: 
			[:name :value | 
			url _ value.
			(url isKindOf: Dictionary)
				ifTrue: 
					[sub _ self addNewSubMenu: url.
					subMenu add: name subMenu: sub]
				ifFalse: [subMenu
						add: name
						target: self
						selector: #jumpToUrl:
						argument: url]].
	^ subMenu