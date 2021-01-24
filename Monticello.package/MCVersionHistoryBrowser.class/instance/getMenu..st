morphic ui
getMenu: aMenu
	| menuSpecs |
	self selection < 1 ifTrue: [^ aMenu]. "Nothing selected = nothing to do"
	menuSpecs := 	(self selectedInfo ancestors collect: [:parent |
			{'view changes from ', parent name . #viewChanges: . parent}]),
		#(('spawn history' spawnHistory)
		('search history' searchHistory)).
	self selection > 1 ifTrue: [menuSpecs := {{'view changes to ', ancestry name . #viewChanges}}, menuSpecs].
	self fillMenu: aMenu fromSpecs: menuSpecs.
	^ aMenu