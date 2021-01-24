accessing
baseVersionName
	"The version name of our ancestor, if this is a Diffy filename."

	^(MCDiffyVersion baseNameFrom: (self copyUpThrough: $))) asMCVersionName