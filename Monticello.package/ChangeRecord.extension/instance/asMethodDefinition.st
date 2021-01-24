*monticello
asMethodDefinition
	^ MCMethodDefinition 
		className: class
		classIsMeta: meta
		selector: self methodSelector
		category: category
		timeStamp: stamp
		source: self string