running
testBasics
	end1 nextPut: #().
	end1 nextPut: #('').
	end1 nextPut: #('hello' 'world').
	end1 processIO.

	"The wait makes this test a bit more robust because network delivery 
	is asynchronous and may not have happened when we call end2 processIO. 
	This causes the test to fail occasionally for no apparent reason."
	(Delay forMilliseconds: 100) wait.

	end2 processIO.
	self should: [ end2 next = #() ].
	self should: [ end2 next = #('') ].
	self should: [ end2 next = #('hello' 'world') ].
	