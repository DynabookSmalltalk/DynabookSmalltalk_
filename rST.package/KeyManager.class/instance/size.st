accessing
size
	"answer an estimated size"
	^ mutex
		critical: [dictionary size]