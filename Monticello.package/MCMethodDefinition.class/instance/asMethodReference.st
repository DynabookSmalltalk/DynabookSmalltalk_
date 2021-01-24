converting
asMethodReference
	^ MethodReference
		class: self actualClass
		selector: self selector