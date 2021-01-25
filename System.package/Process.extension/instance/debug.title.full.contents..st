*System-debugging
debug: context title: title full: bool contents: contents
	"Open debugger on self with context shown on top"

	| topCtxt |
	topCtxt := self isActiveProcess ifTrue: [thisContext] ifFalse: [self suspendedContext].
	(topCtxt hasContext: context) ifFalse: [^ self error: 'context not in process'].
	^ ToolSet debugProcess: self context: context label: title contents: contents fullView: bool