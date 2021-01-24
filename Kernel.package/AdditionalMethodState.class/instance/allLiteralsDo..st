literals
allLiteralsDo: aBlock

	1 to: self basicSize do: [:index |
		(self basicAt: index) allLiteralsDo: aBlock].