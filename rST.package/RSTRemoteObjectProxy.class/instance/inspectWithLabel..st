user interface
inspectWithLabel: aLabel 
	"Open an RSTRemoteInspector on the receiver. Use basicInspect to get a 
	normal (less useful) type of inspector."
	RSTRemoteInspector
		openOn: self
		withEvalPane: true
		withLabel: aLabel