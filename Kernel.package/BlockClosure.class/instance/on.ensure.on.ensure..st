exceptions
on: anException1 ensure: aBlock1 on: anException2 ensure: aBlock2

	^ [self on: anException1 ensure: aBlock1]
		on: anException2
		ensure: aBlock2