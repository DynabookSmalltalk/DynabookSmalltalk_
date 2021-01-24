accessing
resetOnStartUp
	"If true, do not suppress this kind of warning anymore after image start up. This flag will be reset to false after doing this."
	
	^ resetOnStartUp ifNil: [false]