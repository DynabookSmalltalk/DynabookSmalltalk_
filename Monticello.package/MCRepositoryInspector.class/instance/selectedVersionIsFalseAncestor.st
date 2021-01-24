testing
selectedVersionIsFalseAncestor
	"Answer true if selectedVersion is a false ancestor of working copy.
	An ancestor of working copy that has same name, but not same id is a false ancestor!"
	^(selectedVersion notNil
			and: [(inherited includes: selectedVersion versionName)
					and: [(inheritedId includes: self versionInfo id) not]])