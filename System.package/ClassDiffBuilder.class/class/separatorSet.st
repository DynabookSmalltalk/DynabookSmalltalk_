constants
separatorSet

	^SeparatorSet ifNil: [
		SeparatorSet := CharacterSet separators copy
			add: $'; "for variables"
			add: $"; "for comments in mc"
			yourself ]