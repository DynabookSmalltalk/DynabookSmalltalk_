running
stop
	"stop the running broker"
	instance notNil
		ifTrue: [instance stop].
	instance _ nil