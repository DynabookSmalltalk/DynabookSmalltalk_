morphic ui
orderSpecs
	^{
		'unchanged' -> nil.
		'order by package' -> [ :x :y | x packageName < y packageName ].
		'order by author' -> [ :x :y | x author caseInsensitiveLessOrEqual: y author ].
		'order by version-string' -> [ :x :y | x versionNumber asString < y versionNumber asString ].
		'order by version-number' -> [ :x :y | x versionNumber > y versionNumber ].
		'order by filename' -> [ :x :y | x < y ].
	}