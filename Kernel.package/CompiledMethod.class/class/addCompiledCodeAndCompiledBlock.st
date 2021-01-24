full block bootstrap
addCompiledCodeAndCompiledBlock
	| cmHash cmInstCount cc |
	"Ensure that
		- CompiledMethod is a subclass of CompiledCode
		- CompiledMethod has a sibling called CompiledBlock,
		- CompiledMethod's class vars are moved to CompiledCode
		- CompiledMethod preserves its identityHash and instances"
	self compiledCodeAndCompiledBlockArePresent ifTrue:
		[^self].
	cmHash := CompiledMethod identityHash.
	cmInstCount := CompiledMethod instanceCount.
	cc := CompiledMethod variableByteSubclass: #CompiledCode
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'Kernel-Methods'.
	self assert: cc == (ByteArray variableByteSubclass: #CompiledCode
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'Kernel-Methods').
	self assert: cc typeOfClass == #compiledMethod.
	cc ensureClassPool.
	CompiledMethod classPool keys do:
		[:classVar|
		cc classPool declare: classVar from: CompiledMethod classPool].
	self assert: CompiledMethod classPool isEmpty.
	CompiledMethod superclass: cc.
	CompiledMethod class superclass: cc class.
	cc addSubclass: CompiledMethod.
	self assert: cmHash = CompiledMethod identityHash.
	self assert: cmInstCount = CompiledMethod instanceCount.
	self assert: (CompiledMethod inheritsFrom: cc).
	self assert: (CompiledMethod class inheritsFrom: cc class).
	cc variableByteSubclass: #CompiledBlock
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'Kernel-Methods'.
	self assert: self compiledCodeAndCompiledBlockArePresent