morphic ui
packageHighlight: loadedPackageAndMaybeBranchName
	| packageName bold underline emphasis |
	bold := TextEmphasis bold emphasisCode.
	underline := TextEmphasis underlined emphasisCode.
	packageName := loadedPackageAndMaybeBranchName copyUpTo: $..
	emphasis := (loaded detect: [:each| each packageName = packageName] ifNone: nil) ifNotNil:
			[:mcVersionName|
			 self class browseBranchedVersionsSeparately
				ifTrue:
					[mcVersionName packageAndBranchName = loadedPackageAndMaybeBranchName
						ifTrue:
							[(newer includes: loadedPackageAndMaybeBranchName)
								ifTrue: [bold + underline]
								ifFalse: [underline]]
						ifFalse:
							[(newer includes: packageName)
								ifTrue: [bold]
								ifFalse: [nil]]]
				ifFalse:
					[(newer includes: loadedPackageAndMaybeBranchName)
						ifTrue: [bold + underline]
						ifFalse: [underline]]].
	^emphasis
		ifNil: [loadedPackageAndMaybeBranchName]
		ifNotNil:
			[Text
				string: loadedPackageAndMaybeBranchName
				attribute: (TextEmphasis new emphasisCode: emphasis)]