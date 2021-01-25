testing
testBasics
	end1 nextPut: 'hello'.
	end1 nextPut: 42.
	end1 nextPut: 3@5.
	end1 processIO.  "hopefully one call is enough...."
	10 milliSeconds asDelay wait. "data sent, wait a few milliseconds"
	end2 processIO.  "hopefully one call is enough...."
	self should: [ end2 next = 'hello' ].
	self should: [ end2 next = 42 ].
	self should: [ end2 next = (3@5) ].
	