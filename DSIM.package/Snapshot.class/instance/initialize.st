accessing
initialize
objects  := Dictionary new.basicObjects := (SystemNavigation default allObjects reject: [:o|self class allInstances anySatisfy: [:i|i isProtected: o]]) basicVeryDeepCopy: objects.