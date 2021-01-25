accessing
resolve
	"resolve the transported object for local use"
	^ type caseOf: {
		[#copy] -> [object].
		[#reference] -> [object asLocalObject].
		[#exception] -> [object signal]}