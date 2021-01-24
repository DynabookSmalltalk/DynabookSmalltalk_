accessing
requestedPosition: anObject
	"only change the progress bar position if this is an occasion when the progress bar is opening with a single active bar. After that we don't want to change the position and leap around the screen"
	activeSlots 	< 1 ifTrue:[ requestedPosition := anObject]