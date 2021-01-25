accessing
defaultOrNil
	"This app registry returns instances instead of classes."
	
	^ super defaultOrNil ifNotNil: [:default | default new]