compiling
compile: text environment: anEnvironment classified: category withStamp: changeStamp notifying: requestor logSource: logSource

	| methodAndNode context methodNode selector |
	context := CompilationCue
		source: text
		class: self
		environment: anEnvironment
		requestor: requestor.
	methodNode := self newCompiler compile: context ifFail: [^ nil].
	methodAndNode := CompiledMethodWithNode 
		generateMethodFromNode: methodNode 
		trailer: (self defaultMethodTrailerIfLogSource: logSource).
	selector := methodAndNode selector.
	logSource ifTrue: [
		self
			logMethodSource: text
			forMethodWithNode: methodAndNode 
			inCategory: category
			withStamp: changeStamp
			notifying: requestor.
		RecentMessages default
			recordSelector: selector
			forClass: methodAndNode method methodClass
			inEnvironment: anEnvironment ].
	self
		addAndClassifySelector: selector
		withMethod: methodAndNode method
		inProtocol: category
		notifying: requestor.
	self instanceSide
		noteCompilationOf: selector
		meta: self isClassSide.
	^selector