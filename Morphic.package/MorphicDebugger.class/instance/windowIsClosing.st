initialize
windowIsClosing
	"Keep track of last debugger extent."

	interruptedProcess ifNil: [ ^ self ].

	SavedExtent ifNotNil:
		[ self dependents
			detect:
				[ : each | each isWindowForModel: self ]
			ifFound:
				[ : topWindow | | isDebuggerNotNotifier |
				isDebuggerNotNotifier := self dependents anySatisfy:
					[ : each | each isTextView ].
				isDebuggerNotNotifier ifTrue: [
					SavedExtent := (topWindow extent / RealEstateAgent scaleFactor) rounded ] ]
			ifNone: [ "do nothing" ] ].

	super windowIsClosing.