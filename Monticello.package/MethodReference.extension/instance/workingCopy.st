*monticello
workingCopy
	"Answer the MCWorkingCopy in which I am defined."
	^ self packageInfo ifNotNil: [ : pi | pi workingCopy ]