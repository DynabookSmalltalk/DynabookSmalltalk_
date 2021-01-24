morphic ui
versionHighlight: aMCVersionName 
	inherited ifNil: [inherited := #()].
	inheritedId ifNil: [inheritedId := #()].
	(selectedVersion notNil
			and: [selectedVersion = aMCVersionName
					and: [self selectedVersionIsFalseAncestor]])
		ifTrue: ["False ancestor might be dangerous, signal them in red"
			^ Text string: aMCVersionName attributes: {TextColor red. TextEmphasis bold}].
	^ Text
		string: aMCVersionName
		attribute: (TextEmphasis new
				emphasisCode: ((loaded includes: aMCVersionName)
						ifTrue: ["underlined" 4]
						ifFalse: [(inherited includes: aMCVersionName)
								ifTrue: [0]
								ifFalse: ["bold" 1]]))