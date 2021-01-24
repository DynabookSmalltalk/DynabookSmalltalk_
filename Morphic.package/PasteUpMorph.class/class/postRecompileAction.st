recompilation
postRecompileAction
	"PasteUpMorph's worldState refers to blocks in its alarms and stepList inst vars.  These should be rebuilt post recompileAll"
	Project allProjects do:
		[:project|
		 project isMorphic ifTrue:
			[project world updateStatePostRecompile]].
	self currentWorld addGlobalFlaps