accessing
fileName
	|rawName cookedName|

	rawName := info name.
	"care for invalid filename characters"
	cookedName := rawName copy 
						replaceAll: $/ with: $_;
						replaceAll: $: with: $_..
	^ (cookedName, '.', self writerClass extension) asMCVersionName