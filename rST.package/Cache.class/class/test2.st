testing
test2
	" 
	Cache test2. 
	Time millisecondsToRun:[Cache test2].
	MessageTally spyOn:[Cache test2]. 
	"
	| c |
	c _ Cache size: 600 factory: [:key | key * 2].
	1 to: 6000 do: [:each | c at: each].
	^ c