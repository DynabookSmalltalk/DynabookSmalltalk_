accessing
default
	"This app registry returns instances instead of classes."
	
	| cls |
	cls := super default.
	^ cls new