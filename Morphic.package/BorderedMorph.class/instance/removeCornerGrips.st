resize handling
removeCornerGrips

	| corners |
	corners := self submorphsSatisfying: [:each | each isKindOf: CornerGripMorph].
	corners do: [:each | each delete]