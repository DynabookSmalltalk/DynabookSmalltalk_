running
tearDown
	
	end1 ifNotNil: [ 
		end1 destroy.
		end1 := nil ].
	end2 ifNotNil: [
		end2 destroy.
		end2 := nil ].
	"StringSocket >> #destroy is expected to destroy the tcp socket. The code below will just ensure that." 
	socket1 ifNotNil: [
		socket1 destroy.
		socket1 := nil ].
	socket2 ifNotNil: [
		socket2 destroy.
		socket2 := nil ]
	