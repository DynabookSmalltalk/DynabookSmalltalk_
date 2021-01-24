recompilation
updateStatePostRecompile
	"worldState refers to blocks in its alarms and stepList inst vars.  These should be rebuilt post recompileAll"
	worldState convertAlarms; convertStepList