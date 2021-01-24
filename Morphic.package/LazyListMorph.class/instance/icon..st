list access - cached
icon: row
	"Do inst-var access on listIcons here to initialize it as late as possible."
	
	self listSource canHaveIcons ifFalse: [^ nil].
	
	listIcons ifNil: [listIcons := Array new: self getListSize].
	
	^ (listIcons at: row) ifNil: [
		| icon |
		icon := (self getListIcon: row) ifNotNil: [:form | form scaleIconToDisplay].
		"Update cache for uniform icon extent."
		iconExtent ifNil: [iconExtent := icon ifNotNil: [icon extent]].
		listIcons at: row put: icon.
		icon]