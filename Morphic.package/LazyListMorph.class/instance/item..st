list access - cached
item: index
	"Do inst-var access on listItems here to initialize it as late as possible."

	listItems ifNil: [listItems := Array new: self getListSize].

	^ (listItems at: index) ifNil: [
		| newItem itemWidth |	
		newItem := self getListItem: index.

		"Update the width cache."
		maxWidth ifNotNil: [
			itemWidth := self widthToDisplayItem: newItem.
			itemWidth > maxWidth ifTrue: [
				maxWidth := itemWidth.
				super layoutChanged]].

		listItems at: index put: newItem.
		newItem].