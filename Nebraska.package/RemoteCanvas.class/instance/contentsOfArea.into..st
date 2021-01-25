accessing
contentsOfArea: aRectangle into: aForm
	"this should never be called; normally, RemoteCanvas's are used in conjunction with a CachingCanvas"

	self flag: #roundedRudeness.	

	"aForm fillWhite.
	^aForm"

	^Display getCanvas contentsOfArea: aRectangle into: aForm