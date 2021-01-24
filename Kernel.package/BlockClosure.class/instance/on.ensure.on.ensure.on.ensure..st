exceptions
on: anException1 ensure: aBlock1 on: anException2 ensure: aBlock2 on: anException3 ensure: aBlock3

	^ [self on: anException1 ensure: aBlock1]
		on: anException2
		ensure: aBlock2
		on: anException3
		ensure: aBlock3