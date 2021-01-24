enumerating
allFileNames
	"sorting {entry. dirName. name}"

	| result |
	result := OrderedCollection new.
	self allDirectories
		do: [:dir | dir entries
				do: [:ent | ent isDirectory
						ifFalse: [result addLast: {ent. dir fullName. ent name}]]].
	^result
		sort: [:a :b | a first modificationTime >= b first modificationTime ];
		replace: [:ea | ea third asMCVersionName]