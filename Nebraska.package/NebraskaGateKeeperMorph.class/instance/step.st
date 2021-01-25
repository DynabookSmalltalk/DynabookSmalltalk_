stepping and presenter
step

	(self valueOfProperty: #gateKeeperCounterValue) = 
			NebraskaGateKeeperMorph updateCounter ifTrue: [^self].
	self rebuild.
