morphic ui
packageList
	| result loadedPackages |
	packageNames ifNotNil: [ ^ packageNames ].
	repository cacheAllFileNamesDuring: 
		[ "Enjoy emphasis side-effects of populating my versionNames." 
		self versionNames.
		result := self class browseBranchedVersionsSeparately
					ifTrue: [ repository allPackageAndBranchNames ]
					ifFalse: [ repository allPackageNames ] ].
	"sort loaded packages first, then alphabetically"
	loadedPackages := loaded asSet collect: [ : each | each packageAndBranchName ].
	result := result asArray sort:
		[ : a : b | | loadedA loadedB |
		loadedA := loadedPackages includes: a.
		loadedB := loadedPackages includes: b.
		loadedA = loadedB
			ifTrue: [ a < b ]
			ifFalse: [ loadedA ] ].
	^ packageNames := result collect:
		[ : each | self packageHighlight: each ]