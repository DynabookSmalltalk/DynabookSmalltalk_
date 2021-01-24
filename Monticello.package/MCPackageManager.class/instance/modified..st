accessing
modified: aBoolean
     modified = aBoolean ifTrue: [^ self].
	modified := aBoolean.
	self changed: #modified.
	
	modified ifFalse:
		[(((Smalltalk classNamed: 'SmalltalkImage') ifNotNil: [:si | si current]) ifNil: [Smalltalk])
			logChange: '"', self packageName, '"'].