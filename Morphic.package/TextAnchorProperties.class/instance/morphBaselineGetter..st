accessing
morphBaselineGetter: aSymbol
	"This sets the callback send to the anchored morph to determine the baseline
	of the morph. The baseline should be the distance from the top of the anchored
	morph. This can be used, e.g. when having formula morphs inside a text."

	morphBaselineGetter := aSymbol