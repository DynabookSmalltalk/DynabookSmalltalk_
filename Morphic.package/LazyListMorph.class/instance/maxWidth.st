layout
maxWidth
	"Approximate the maximum width of this lazy list. Take first n items as a sample."

	| threshold listSize |
	maxWidth ifNotNil:[^maxWidth].

	threshold := 30.
	listSize := self getListSize.
	
	maxWidth := 0.
	1 to: (threshold min: listSize) do: [:index |
		maxWidth := maxWidth max: (self widthToDisplayItem: (self getListItem: index))].

	^ maxWidth
