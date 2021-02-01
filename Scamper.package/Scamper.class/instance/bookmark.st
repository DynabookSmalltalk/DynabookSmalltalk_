menus
bookmark
	| menu sub url |
	menu _ (MenuMorph entitled: ' Bookmark ' translated)
				defaultTarget: self.
	menu addStayUpItem.
	menu addLine.
	menu
		add: 'add to bookmark' translated
		target: self
		selector: #addToBookmark.
	menu add: 'Import...' translated target: self selector: #importBookmark. 
	menu addLine.
	bookmark
		keysAndValuesDo: 
			[:name :value | 
			url _ value.
			(url isKindOf: Dictionary)
				ifTrue: 
					[sub _ self addNewSubMenu: url.
					menu add: name subMenu: sub]
				ifFalse: [menu
						add: name
						selector: #jumpToUrl:
						argument: url]].
	menu popUpInWorld: self currentWorld