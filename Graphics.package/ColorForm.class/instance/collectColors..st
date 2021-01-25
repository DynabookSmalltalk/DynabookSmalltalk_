converting
collectColors: aBlock

	^ (ColorForm extent: self extent depth: self depth bits: self bits)
		colors: (self colors collect: aBlock);
		yourself